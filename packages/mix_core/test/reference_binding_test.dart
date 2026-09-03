// A complete miniature platform binding — the executable companion to
// PLATFORM_GUIDE.md. Together with `fixtures/term_platform.dart` it shows
// everything a non-Flutter platform (terminal UI, Jaspr, ...) implements to
// get the Mix engine end-to-end:
//
//   1. a context type carrying the token scope and interaction state
//   2. a token type resolving through that context
//   3. a Spec (resolved data) and an envelope pairing it with modifiers
//   4. a Style subclass of StyleBase with a fluent API
//   5. node modifiers applied as a reversed fold over the platform node
//
// package:mix is the Flutter instance of exactly this shape, with
// C = BuildContext, node = Widget, envelope = StyleSpec<S>.

import 'package:mix_core/mix_core.dart';
import 'package:test/test.dart';

import 'fixtures/term_platform.dart';

// 3. ── Spec + envelope -------------------------------------------------------

class TermTextSpec extends Spec<TermTextSpec> {
  final int? ansiColor;
  final bool? bold;

  const TermTextSpec({this.ansiColor, this.bold});

  @override
  TermTextSpec copyWith({int? ansiColor, bool? bold}) => TermTextSpec(
    ansiColor: ansiColor ?? this.ansiColor,
    bold: bold ?? this.bold,
  );

  @override
  TermTextSpec lerp(TermTextSpec? other, double t) =>
      t < 0.5 ? this : (other ?? this);

  @override
  List<Object?> get props => [ansiColor, bold];
}

/// The platform envelope: resolved spec + resolved node modifiers.
/// (package:mix's `StyleSpec<S>` adds animation configuration too.)
class TermStyleSpec {
  final TermTextSpec spec;
  final List<NodeModifier<String>> modifiers;

  const TermStyleSpec(this.spec, {this.modifiers = const []});
}

// 4. ── The style (hand-written styler over StyleBase) -----------------------

class TermTextStyle
    extends StyleBase<TermContext, TermStyleSpec, TermTextStyle> {
  final Prop<TermContext, int>? $ansiColor;
  final Prop<TermContext, bool>? $bold;
  final List<NodeModifier<String>>? $modifiers;

  const TermTextStyle({
    Prop<TermContext, int>? ansiColor,
    Prop<TermContext, bool>? bold,
    List<NodeModifier<String>>? modifiers,
    super.variants,
  }) : $ansiColor = ansiColor,
       $bold = bold,
       $modifiers = modifiers;

  // Fluent API — each setter merges a single-field style, exactly like the
  // generated stylers in package:mix.
  TermTextStyle color(int ansi) =>
      merge(TermTextStyle(ansiColor: Prop.value(ansi)));

  TermTextStyle colorToken(TermToken<int> token) =>
      merge(TermTextStyle(ansiColor: Prop.token(token)));

  TermTextStyle bold() => merge(TermTextStyle(bold: Prop.value(true)));

  TermTextStyle wrap(NodeModifier<String> modifier) =>
      merge(TermTextStyle(modifiers: [modifier]));

  TermTextStyle variant(Variant v, TermTextStyle style) =>
      merge(TermTextStyle(variants: [VariantStyle(v, style)]));

  TermTextStyle onFocused(TermTextStyle style) =>
      variant(TermStateVariant('focused'), style);

  TermTextStyle onWide(TermTextStyle style) => variant(wideVariant(), style);

  @override
  TermTextStyle merge(TermTextStyle? other) {
    if (other == null) return this;

    return TermTextStyle(
      ansiColor: $ansiColor?.mergeProp(other.$ansiColor) ?? other.$ansiColor,
      bold: $bold?.mergeProp(other.$bold) ?? other.$bold,
      modifiers: switch (($modifiers, other.$modifiers)) {
        (null, final b) => b,
        (final a, null) => a,
        (final a?, final b?) => [...a, ...b],
      },
      variants: mergeVariantLists($variants, other.$variants),
    );
  }

  @override
  TermTextStyle get self => this;

  @override
  TermStyleSpec resolve(TermContext context) => TermStyleSpec(
    TermTextSpec(
      ansiColor: $ansiColor?.resolveProp(context),
      bold: $bold?.resolveProp(context),
    ),
    modifiers: $modifiers ?? const [],
  );

  @override
  List<Object?> get props => [$ansiColor, $bold, $modifiers, $variants];
}

// 5. ── Rendering: the platform "StyleBuilder" -------------------------------

/// Resolves a style against the context and paints a string node — the
/// platform equivalent of mix's StyleBuilder + RenderModifiers.
String renderText(TermTextStyle style, String text, TermContext context) {
  final resolved = style.build(context);
  final spec = resolved.spec;

  var node = text;
  if (spec.bold ?? false) node = '\x1B[1m$node\x1B[22m';
  if (spec.ansiColor != null) {
    node = '\x1B[38;5;${spec.ansiColor}m$node\x1B[39m';
  }

  // First modifier in the ordered list = outermost wrapper.
  final ordered = reorderByType<NodeModifier<String>>(
    resolved.modifiers,
    defaultOrder: [PadNode, BorderNode],
  );
  for (final modifier in ordered.reversed) {
    node = modifier.build(node);
  }

  return node;
}

// ── The proof --------------------------------------------------------------

const accent = TermToken<int>('color.accent');

void main() {
  test('a themed, stateful, modified style renders end-to-end', () {
    final style = TermTextStyle()
        .colorToken(accent)
        .wrap(BorderNode())
        .wrap(PadNode())
        .onWide(TermTextStyle().bold())
        .onFocused(TermTextStyle().color(15));

    final theme = TokenStore<TermContext>({accent: 6});

    // Narrow, unfocused: token color, no bold; pad wraps outside border
    // because the default order puts PadNode first.
    expect(
      renderText(style, 'hi', TermContext(tokens: theme)),
      ' |\x1B[38;5;6mhi\x1B[39m| ',
    );

    // Wide: the wide variant adds bold.
    expect(
      renderText(style, 'hi', TermContext(tokens: theme, columns: 200)),
      ' |\x1B[38;5;6m\x1B[1mhi\x1B[22m\x1B[39m| ',
    );

    // Focused: the state variant wins over the token color (state variants
    // apply after state-free variants). The platform's interactivity layer
    // knows to track it from `style.stateDependencies`.
    expect(style.stateDependencies, {'focused'});
    expect(
      renderText(
        style,
        'hi',
        TermContext(tokens: theme, columns: 200, states: {'focused'}),
      ),
      ' |\x1B[38;5;15m\x1B[1mhi\x1B[22m\x1B[39m| ',
    );
  });
}
