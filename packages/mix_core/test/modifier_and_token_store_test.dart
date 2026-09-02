import 'package:mix_core/mix_core.dart';
import 'package:test/test.dart';

import 'fixtures/term_platform.dart';

class DimNode implements NodeModifier<String> {
  @override
  String build(String child) => 'dim($child)';
}

// --- merge-with-reset fixtures ------------------------------------------

class _KeyedMix extends Mixable<Object?> {
  final String id;
  final List<String> values;

  const _KeyedMix(this.id, this.values);

  @override
  Object get mergeKey => id;

  @override
  _KeyedMix merge(_KeyedMix? other) =>
      other == null ? this : _KeyedMix(id, [...values, ...other.values]);
}

class _ResetMix extends Mixable<Object?> {
  const _ResetMix();

  @override
  Object get mergeKey => 'reset';

  @override
  _ResetMix merge(_ResetMix? other) => this;
}

void main() {
  group('reorderByType', () {
    final pad = PadNode();
    final border = BorderNode();
    final dim = DimNode();

    test('applies default order, then appearance order for unknowns', () {
      final ordered = reorderByType<NodeModifier<String>>(
        [dim, border, pad],
        defaultOrder: [PadNode, BorderNode],
      );

      expect(ordered, [pad, border, dim]);
    });

    test('user order wins over default order', () {
      final ordered = reorderByType<NodeModifier<String>>(
        [pad, border],
        typeOrder: [BorderNode],
        defaultOrder: [PadNode, BorderNode],
      );

      expect(ordered, [border, pad]);
    });

    test('keeps only the first item of each runtime type', () {
      final ordered = reorderByType<NodeModifier<String>>([pad, PadNode()]);

      expect(ordered, [pad]);
    });

    test('reversed fold makes the first modifier the outermost wrapper', () {
      final ordered = reorderByType<NodeModifier<String>>(
        [border, pad],
        defaultOrder: [PadNode, BorderNode],
      );

      var node = 'child';
      for (final modifier in ordered.reversed) {
        node = modifier.build(node);
      }

      expect(node, ' |child| ');
    });
  });

  group('mergeKeyedWithReset', () {
    test('merges same-key entries and keeps distinct keys', () {
      final acc = <Object, Mixable<Object?>>{};
      mergeKeyedWithReset(acc, const [
        _KeyedMix('a', ['1']),
        _KeyedMix('b', ['2']),
        _KeyedMix('a', ['3']),
      ], resetKey: 'reset');

      expect((acc['a']! as _KeyedMix).values, ['1', '3']);
      expect((acc['b']! as _KeyedMix).values, ['2']);
    });

    test('a reset entry clears everything accumulated so far', () {
      final acc = <Object, Mixable<Object?>>{};
      mergeKeyedWithReset(acc, const [
        _KeyedMix('a', ['1']),
        _ResetMix(),
        _KeyedMix('b', ['2']),
      ], resetKey: 'reset');

      expect(acc.keys, ['b']);
    });
  });

  group('TokenStore', () {
    const width = TermToken<int>('width');
    const label = TermToken<String>('label');

    test('resolves plain values and resolver entries', () {
      final table = TokenStore<TermContext>({
        width: (TermContext c) => c.columns,
        label: 'ansi',
      });

      expect(table.getToken(width, const TermContext(columns: 120)), 120);
      expect(table.getToken(label, const TermContext()), 'ansi');
    });

    test('missing and mistyped entries throw StateError', () {
      expect(
        () => const TokenStore<TermContext>(
          null,
        ).getToken(width, const TermContext()),
        throwsStateError,
      );
      expect(
        () => TokenStore<TermContext>({
          width: 'not an int',
        }).getToken(width, const TermContext()),
        throwsStateError,
      );
    });

    test('merge is last-wins and keeps unmatched entries', () {
      const a = TermToken<int>('a');
      const b = TermToken<int>('b');

      final merged = TokenStore<TermContext>({
        a: 1,
        b: 2,
      }).merge(TokenStore<TermContext>({a: 10}));

      expect(merged.getToken(a, const TermContext()), 10);
      expect(merged.getToken(b, const TermContext()), 2);
    });
  });
}
