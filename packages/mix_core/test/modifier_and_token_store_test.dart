import 'package:mix_core/mix_core.dart';
import 'package:test/test.dart';

// --- NodeModifier / reorderByType --------------------------------------

class PadModifier implements NodeModifier<String> {
  @override
  String build(String child) => 'pad($child)';
}

class BorderModifier implements NodeModifier<String> {
  @override
  String build(String child) => 'border($child)';
}

class DimModifier implements NodeModifier<String> {
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

// --- token store fixtures -------------------------------------------------

class FakeContext {
  final int columns;
  const FakeContext(this.columns);
}

class FakeToken<T> extends MixToken<FakeContext, T> {
  final TokenStore<FakeContext> store;
  const FakeToken(super.name, this.store);

  @override
  T resolve(FakeContext context) => store.getToken(this, context);
}

void main() {
  group('reorderByType', () {
    final pad = PadModifier();
    final border = BorderModifier();
    final dim = DimModifier();

    test('applies default order, then appearance order for unknowns', () {
      final ordered = reorderByType<NodeModifier<String>>(
        [dim, border, pad],
        defaultOrder: [PadModifier, BorderModifier],
      );

      expect(ordered, [pad, border, dim]);
    });

    test('user order wins over default order', () {
      final ordered = reorderByType<NodeModifier<String>>(
        [pad, border],
        typeOrder: [BorderModifier],
        defaultOrder: [PadModifier, BorderModifier],
      );

      expect(ordered, [border, pad]);
    });

    test('keeps only the first item of each runtime type', () {
      final ordered = reorderByType<NodeModifier<String>>([pad, PadModifier()]);

      expect(ordered, [pad]);
    });

    test('reversed fold makes the first modifier the outermost wrapper', () {
      final ordered = reorderByType<NodeModifier<String>>(
        [border, pad],
        defaultOrder: [PadModifier, BorderModifier],
      );

      var node = 'child';
      for (final modifier in ordered.reversed) {
        node = modifier.build(node);
      }

      expect(node, 'pad(border(child))');
    });
  });

  group('mergeKeyedWithReset', () {
    test('merges same-key entries and keeps distinct keys', () {
      final acc = <Object, Mixable<Object?>>{};
      mergeKeyedWithReset(
        acc,
        const [
          _KeyedMix('a', ['1']),
          _KeyedMix('b', ['2']),
          _KeyedMix('a', ['3']),
        ],
        resetKey: 'reset',
      );

      expect((acc['a']! as _KeyedMix).values, ['1', '3']);
      expect((acc['b']! as _KeyedMix).values, ['2']);
    });

    test('a reset entry clears everything accumulated so far', () {
      final acc = <Object, Mixable<Object?>>{};
      mergeKeyedWithReset(
        acc,
        const [
          _KeyedMix('a', ['1']),
          _ResetMix(),
          _KeyedMix('b', ['2']),
        ],
        resetKey: 'reset',
      );

      expect(acc.keys, ['b']);
    });
  });

  group('TokenStore', () {
    test('resolves plain values and resolver entries', () {
      const store = TokenStore<FakeContext>(null);
      final width = FakeToken<int>('width', store);
      final label = FakeToken<String>('label', store);

      final table = TokenStore<FakeContext>({
        width: (FakeContext c) => c.columns,
        label: 'ansi',
      });

      expect(table.getToken(width, const FakeContext(120)), 120);
      expect(table.getToken(label, const FakeContext(120)), 'ansi');
    });

    test('missing and mistyped entries throw StateError', () {
      const store = TokenStore<FakeContext>(null);
      final width = FakeToken<int>('width', store);

      expect(
        () => const TokenStore<FakeContext>(null)
            .getToken(width, const FakeContext(1)),
        throwsStateError,
      );
      expect(
        () => TokenStore<FakeContext>({width: 'not an int'})
            .getToken(width, const FakeContext(1)),
        throwsStateError,
      );
    });

    test('merge is last-wins and keeps unmatched entries', () {
      const store = TokenStore<FakeContext>(null);
      final a = FakeToken<int>('a', store);
      final b = FakeToken<int>('b', store);

      final merged = TokenStore<FakeContext>({a: 1, b: 2})
          .merge(TokenStore<FakeContext>({a: 10}));

      expect(merged.getToken(a, const FakeContext(0)), 10);
      expect(merged.getToken(b, const FakeContext(0)), 2);
    });
  });
}
