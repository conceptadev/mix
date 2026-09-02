// Guards the contract the mix_core binding relies on: every Prop a mix caller
// receives is a mix `Prop` (this package's subclass), never a raw engine
// Prop. Generated code stores fields as `Prop<V>` and `MixOps.merge` casts on
// that assumption, so a path that leaked the engine type would fail at
// runtime rather than at compile time.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix_core/mix_core.dart' as core;

class _StubMix extends Mix<int> {
  const _StubMix();

  @override
  _StubMix merge(_StubMix? other) => this;

  @override
  int resolve(BuildContext context) => 0;

  @override
  List<Object?> get props => const [];
}

void main() {
  group('Prop binding returns mix Props from every entry point', () {
    const token = DoubleToken('binding.test');

    test('static factories', () {
      expect(Prop.value(1), isA<Prop<int>>());
      expect(Prop.maybe(1), isA<Prop<int>>());
      expect(Prop.mix(const _StubMix()), isA<Prop<int>>());
      expect(Prop.maybeMix(const _StubMix()), isA<Prop<int>>());
      expect(Prop.token(token), isA<Prop<double>>());
    });

    test('merge and directives', () {
      final merged = Prop.value(1).mergeProp(Prop.value(2));
      expect(merged, isA<Prop<int>>());
      expect(merged.sources, hasLength(2));

      final withDirectives = Prop.value<num>(1.0).directives([
        MultiplyNumberDirective(2),
      ]);
      expect(withDirectives, isA<Prop<num>>());
      expect(withDirectives.$directives, hasLength(1));
    });

    test('merging with a raw engine Prop still yields a mix Prop', () {
      final raw = core.Prop.value<BuildContext, int>(2);

      expect(Prop.value(1).mergeProp(raw), isA<Prop<int>>());
    });
  });
}
