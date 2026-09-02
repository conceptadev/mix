// Exercises the StyleBase variant fold on a fake terminal platform: variant
// activation, priority partitioning, declaration order, recursion, identity
// short-circuit, builder variants, and variant-list merging.

import 'package:mix_core/mix_core.dart';
import 'package:test/test.dart';

class TermContext {
  final bool focused;
  final int columns;

  const TermContext({this.focused = false, this.columns = 80});
}

/// Resolved envelope: an ordered record of which layers applied.
typedef TermSheet = List<String>;

class TermStyle extends StyleBase<TermContext, TermSheet, TermStyle> {
  final List<String> layers;

  const TermStyle(this.layers, {super.variants});

  @override
  TermStyle merge(TermStyle? other) {
    if (other == null) return this;

    return TermStyle([
      ...layers,
      ...other.layers,
    ], variants: mergeVariantLists($variants, other.$variants));
  }

  @override
  TermSheet resolve(TermContext context) => layers;

  @override
  List<Object?> get props => [layers, $variants];
}

final class TermIdentityStyle extends TermStyle implements IdentityElement {
  const TermIdentityStyle() : super(const []);
}

class FocusVariant extends ContextVariant<TermContext> {
  FocusVariant() : super('focused', (c) => c.focused);

  @override
  Set<Object> get stateDependencies => const {'focused'};

  @override
  bool operator ==(Object other) => other is FocusVariant;

  @override
  int get hashCode => key.hashCode;
}

TermStyle style(
  List<String> layers, [
  List<VariantStyle<TermContext, TermSheet, TermStyle>>? variants,
]) => TermStyle(layers, variants: variants);

void main() {
  const wideContext = TermContext(columns: 200);
  final wide = ContextVariant<TermContext>('wide', (c) => c.columns >= 120);

  group('StyleBase variant fold', () {
    test('inactive variants leave the style unchanged', () {
      final s = style(
        ['base'],
        [
          VariantStyle(const NamedVariant('primary'), style(['primary'])),
        ],
      );

      expect(s.build(const TermContext(), namedVariants: const {}), ['base']);
    });

    test('named variants apply when requested', () {
      final s = style(
        ['base'],
        [
          VariantStyle(const NamedVariant('primary'), style(['primary'])),
        ],
      );

      expect(
        s.build(
          const TermContext(),
          namedVariants: {const NamedVariant('primary')},
        ),
        ['base', 'primary'],
      );
    });

    test('context variants apply from the platform context', () {
      final s = style(
        ['base'],
        [
          VariantStyle(wide, style(['wide'])),
        ],
      );

      expect(s.build(const TermContext()), ['base']);
      expect(s.build(wideContext), ['base', 'wide']);
    });

    test('state-dependent variants apply after state-free ones', () {
      final s = style(
        ['base'],
        [
          VariantStyle(FocusVariant(), style(['focus'])),
          VariantStyle(wide, style(['wide'])),
        ],
      );

      // FocusVariant is declared first but reads interaction state, so the
      // state-free wide variant merges first.
      expect(s.build(const TermContext(columns: 200, focused: true)), [
        'base',
        'wide',
        'focus',
      ]);
    });

    test('declaration order is kept inside a priority group', () {
      final s = style(
        ['base'],
        [
          VariantStyle(wide, style(['first'])),
          VariantStyle(
            ContextVariant<TermContext>('wide_too', (c) => c.columns >= 120),
            style(['second']),
          ),
        ],
      );

      expect(s.build(wideContext), ['base', 'first', 'second']);
    });

    test('nested variants resolve recursively', () {
      final s = style(
        ['base'],
        [
          VariantStyle(
            wide,
            style(
              ['wide'],
              [
                VariantStyle(const NamedVariant('primary'), style(['primary'])),
              ],
            ),
          ),
        ],
      );

      expect(
        s.build(wideContext, namedVariants: {const NamedVariant('primary')}),
        ['base', 'wide', 'primary'],
      );
    });

    test('builder variants always run against the context', () {
      final s = style(
        ['base'],
        [
          VariantStyle(
            ContextVariantBuilder<TermContext, TermStyle>(
              (c) => style(['cols:${c.columns}']),
            ),
            const TermIdentityStyle(),
          ),
        ],
      );

      expect(s.build(const TermContext(columns: 42)), ['base', 'cols:42']);
    });

    test('identity styles short-circuit merging on either side', () {
      expect(
        mergeStyles<TermContext, TermSheet, TermStyle>(
          const TermIdentityStyle(),
          style(['real']),
        ).layers,
        ['real'],
      );
      expect(
        mergeStyles<TermContext, TermSheet, TermStyle>(
          style(['real']),
          const TermIdentityStyle(),
        ).layers,
        ['real'],
      );
    });

    test('stateDependencies walks the variant tree', () {
      final s = style(
        ['base'],
        [
          VariantStyle(
            wide,
            style([], [
              VariantStyle(FocusVariant(), style(['focus'])),
            ]),
          ),
        ],
      );

      expect(s.stateDependencies, {'focused'});
    });

    test('NotVariant forwards state dependencies', () {
      expect(NotVariant<TermContext>(FocusVariant()).stateDependencies, {
        'focused',
      });
    });
  });

  group('mergeVariantLists', () {
    test('same-key entries merge pairwise, order of first appearance', () {
      final a = [
        VariantStyle<TermContext, TermSheet, TermStyle>(
          const NamedVariant('primary'),
          style(['a1']),
        ),
      ];
      final b = [
        VariantStyle<TermContext, TermSheet, TermStyle>(
          const NamedVariant('primary'),
          style(['b1']),
        ),
        VariantStyle<TermContext, TermSheet, TermStyle>(
          const NamedVariant('other'),
          style(['b2']),
        ),
      ];

      final merged = mergeVariantLists(a, b)!;

      expect(merged, hasLength(2));
      expect(merged.first.value.layers, ['a1', 'b1']);
      expect(merged.last.value.layers, ['b2']);
    });

    test('merging mismatched variants throws', () {
      final entry = VariantStyle<TermContext, TermSheet, TermStyle>(
        const NamedVariant('primary'),
        style(['x']),
      );
      final other = VariantStyle<TermContext, TermSheet, TermStyle>(
        const NamedVariant('secondary'),
        style(['y']),
      );

      expect(() => entry.merge(other), throwsArgumentError);
    });
  });
}
