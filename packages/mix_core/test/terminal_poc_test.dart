// Proof-of-concept: bind the mix_core engine to a fake terminal platform.
//
// This is the acceptance test for the mix_core extraction: a non-Flutter
// consumer defines its own context type, value types, tokens, directives,
// variants, and Mix types, and the full Prop pipeline (merge order, token
// resolution, Mix accumulation, converters, directives, nested Buildable)
// works with zero Flutter in the dependency graph.

import 'package:mix_core/mix_core.dart';
import 'package:test/test.dart';

// --- A fake terminal platform binding -------------------------------------

/// The terminal platform's resolution context: what a terminal styling
/// library would thread through resolution instead of Flutter's BuildContext.
class TermContext {
  final Map<MixToken<TermContext, Object?>, Object?> tokens;
  final int columns;
  final bool focused;

  const TermContext({
    this.tokens = const {},
    this.columns = 80,
    this.focused = false,
  });
}

/// The platform binds the engine's generic types to its context once.
typedef TermProp<V> = Prop<TermContext, V>;
typedef TermMix<V> = Mix<TermContext, V>;
typedef TermVariant = ContextVariant<TermContext>;

/// A pure-Dart color value type (no dart:ui).
class TermColor with Equatable {
  final int ansi;
  final bool dim;

  const TermColor(this.ansi, {this.dim = false});

  TermColor withDim() => TermColor(ansi, dim: true);

  @override
  List<Object?> get props => [ansi, dim];
}

/// The platform's token type: resolution looks the token up in the
/// context-carried theme map.
class TermToken<T> extends MixToken<TermContext, T> {
  const TermToken(super.name);

  @override
  T resolve(TermContext context) {
    if (!context.tokens.containsKey(this)) {
      throw StateError('Token $name not provided by TermContext');
    }

    return context.tokens[this] as T;
  }
}

/// A directive over the platform value type.
class DimDirective extends Directive<TermColor> {
  const DimDirective();

  @override
  String get key => 'term_color_dim';

  @override
  TermColor apply(TermColor value) => value.withDim();

  @override
  bool operator ==(Object other) => other is DimDirective;

  @override
  int get hashCode => key.hashCode;
}

/// A Mix over a composite platform type, to exercise accumulation merging.
class TermBorderMix extends Mix<TermContext, ({String style, TermColor? color})> {
  final Prop<TermContext, String>? style;
  final Prop<TermContext, TermColor>? color;

  const TermBorderMix({this.style, this.color});

  @override
  TermBorderMix merge(TermBorderMix? other) {
    if (other == null) return this;

    return TermBorderMix(
      style: style?.mergeProp(other.style) ?? other.style,
      color: color?.mergeProp(other.color) ?? other.color,
    );
  }

  @override
  ({String style, TermColor? color}) resolve(TermContext context) => (
    style: style?.resolveProp(context) ?? 'single',
    color: color?.resolveProp(context),
  );

  @override
  List<Object?> get props => [style, color];
}

/// A Buildable Mix standing in for a nested Style: build() applies a
/// context condition before resolving, which plain resolve() would drop.
class FocusAwareColorMix extends Mix<TermContext, TermColor>
    implements Buildable<TermContext, TermColor> {
  final TermColor base;
  final TermColor whenFocused;

  const FocusAwareColorMix(this.base, this.whenFocused);

  @override
  FocusAwareColorMix merge(FocusAwareColorMix? other) => other ?? this;

  @override
  TermColor resolve(TermContext context) => base;

  @override
  TermColor build(TermContext context) =>
      context.focused ? whenFocused : base;

  @override
  List<Object?> get props => [base, whenFocused];
}

const primaryColor = TermToken<TermColor>('color.primary');

void main() {
  group('terminal platform binding (pure Dart)', () {
    test('Prop statics work through the platform typedef with inference', () {
      // Downward inference binds C from the declared/expected type.
      final TermProp<TermColor> direct = TermProp.value(const TermColor(1));
      expect(direct.resolveProp(const TermContext()), const TermColor(1));
    });

    test('last value wins across merges (replacement strategy)', () {
      final red = TermProp.value<TermContext, TermColor>(const TermColor(1));
      final blue = TermProp.value<TermContext, TermColor>(const TermColor(4));

      expect(
        red.mergeProp(blue).resolveProp(const TermContext()),
        const TermColor(4),
      );
      expect(
        blue.mergeProp(red).resolveProp(const TermContext()),
        const TermColor(1),
      );
    });

    test('tokens resolve against the platform context', () {
      final prop = TermProp<TermColor>.token(primaryColor);
      final context = TermContext(
        tokens: {primaryColor: const TermColor(6)},
      );

      expect(prop.resolveProp(context), const TermColor(6));
    });

    test('token overridden by a later value, and vice versa', () {
      final context = TermContext(
        tokens: {primaryColor: const TermColor(6)},
      );
      final token = TermProp<TermColor>.token(primaryColor);
      final value = TermProp.value<TermContext, TermColor>(
        const TermColor(2),
      );

      expect(token.mergeProp(value).resolveProp(context), const TermColor(2));
      expect(value.mergeProp(token).resolveProp(context), const TermColor(6));
    });

    test('directives transform the resolved value', () {
      final prop = TermProp.value<TermContext, TermColor>(
        const TermColor(3),
      ).directives(const [DimDirective()]);

      expect(
        prop.resolveProp(const TermContext()),
        const TermColor(3, dim: true),
      );
    });

    test('Mix sources accumulate field-by-field across merges', () {
      final styled = TermProp.mix<TermContext, ({String style, TermColor? color})>(
        TermBorderMix(style: TermProp.value('double')),
      );
      final colored = TermProp.mix<TermContext, ({String style, TermColor? color})>(
        TermBorderMix(color: TermProp.value(const TermColor(5))),
      );

      final resolved = styled.mergeProp(colored).resolveProp(const TermContext());

      // Both fields survive the merge — accumulation, not replacement.
      expect(resolved.style, 'double');
      expect(resolved.color, const TermColor(5));
    });

    test('converter registry converts raw values when mixed with Mix values',
        () {
      MixConverterRegistry.instanceOf<TermContext>()
          .register<({String style, TermColor? color})>(
        SimpleMixConverter(
          (value) =>
              TermBorderMix(style: TermProp.value(value.style)),
        ),
      );
      addTearDown(MixConverterRegistry.instanceOf<TermContext>().clear);

      final rawFirst =
          TermProp.value<TermContext, ({String style, TermColor? color})>(
        (style: 'ascii', color: null),
      );
      final mixSecond = TermProp.mix<TermContext, ({String style, TermColor? color})>(
        TermBorderMix(color: TermProp.value(const TermColor(2))),
      );

      final resolved =
          rawFirst.mergeProp(mixSecond).resolveProp(const TermContext());

      // The raw value was converted to a Mix and merged, not discarded.
      expect(resolved.style, 'ascii');
      expect(resolved.color, const TermColor(2));
    });

    test('Buildable values apply context conditions during resolution', () {
      final prop = TermProp.mix<TermContext, TermColor>(
        const FocusAwareColorMix(TermColor(7), TermColor(15)),
      );

      expect(prop.resolveProp(const TermContext()), const TermColor(7));
      expect(
        prop.resolveProp(const TermContext(focused: true)),
        const TermColor(15),
      );
    });

    test('context variants evaluate platform predicates', () {
      final wide = TermVariant('term_wide', (c) => c.columns >= 120);
      final narrow = NotVariant<TermContext>(wide);

      expect(wide.when(const TermContext(columns: 200)), isTrue);
      expect(wide.when(const TermContext(columns: 80)), isFalse);
      expect(narrow.when(const TermContext(columns: 80)), isTrue);
    });

    test('named variants and helpers are platform-neutral', () {
      const active = [NamedVariant('primary'), NamedVariant('large')];

      expect(hasVariant(active, const NamedVariant('primary')), isTrue);
      expect(
        hasAllVariants(
          active,
          const [NamedVariant('primary'), NamedVariant('large')],
        ),
        isTrue,
      );
      expect(hasAnyVariant(active, const [NamedVariant('danger')]), isFalse);
    });

    test('breakpoints match plain dimensions', () {
      expect(Breakpoint.mobile.matchesDimensions(400, 800), isTrue);
      expect(Breakpoint.desktop.matchesDimensions(400, 800), isFalse);
      expect(const Breakpoint.minWidth(100).matchesDimensions(120, 40), isTrue);
    });

    test('empty prop throws a StateError (not FlutterError)', () {
      final empty = TermProp<TermColor>.directives(const [DimDirective()]);

      expect(
        () => empty.resolveProp(const TermContext()),
        throwsStateError,
      );
    });
  });
}
