import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('IconAttributes', () {
    const icon = Icons.add;
    const color = ColorDto(Colors.red);
    const size = DoubleDto(24.0);

    test('merge returns merged object correctly', () {
      const attr1 = IconAttributes(color: color, size: size, icon: icon);
      const attr2 = IconAttributes(color: null, size: DoubleDto(48.0));

      final merged = attr1.merge(attr2);

      expect(merged.color?.value, Colors.red); // should take from attr1
      expect(merged.size?.value, 48.0); // should take from attr2
      expect(merged.icon, Icons.add); // should take from attr1
    });

    test('resolve returns correct IconSpec', () {
      const attr = IconAttributes(color: color, size: size, icon: icon);

      final resolvedSpec = attr.resolve(EmptyMixData);

      expect(resolvedSpec.color, Colors.red);
      expect(resolvedSpec.size, 24.0);
      expect(resolvedSpec.icon, Icons.add);
      return const Placeholder();
    });

    test('Equality holds when all properties are the same', () {
      const attr1 = IconAttributes(color: color, size: size, icon: icon);
      const attr2 = IconAttributes(color: color, size: size, icon: icon);

      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = IconAttributes(color: color, size: size, icon: icon);
      const attr2 = IconAttributes(
        color: ColorDto(Colors.blue),
        size: DoubleDto(24.0),
        icon: Icons.remove,
      );

      expect(attr1, isNot(attr2));
    });
  });

  group('IconSpec', () {
    const icon = IconData(0xe900, fontFamily: 'MyIconFont');
    const color = Colors.red;
    const size = 24.0;

    test('lerp returns correct IconSpec', () {
      const spec1 = IconSpec(color: Colors.red, size: 20.0, icon: Icons.add);
      const spec2 =
          IconSpec(color: Colors.blue, size: 30.0, icon: Icons.remove);

      final lerpedSpec1 = spec1.lerp(spec2, 0.2);
      final lerpedSpec2 = spec1.lerp(spec2, 0.8);

      expect(lerpedSpec1.color, Color.lerp(Colors.red, Colors.blue, 0.2));
      expect(lerpedSpec1.size, 22.0);
      expect(lerpedSpec1.icon, null);

      expect(lerpedSpec2.color, Color.lerp(Colors.red, Colors.blue, 0.8));
      expect(lerpedSpec2.size, 28.0);
      expect(lerpedSpec2.icon, null);
    });

    test('copyWith returns correct IconSpec', () {
      const spec = IconSpec(color: Colors.red, size: 20.0, icon: Icons.add);

      final copiedSpec = spec.copyWith(
        color: Colors.blue,
        size: 30.0,
        icon: Icons.remove,
      );

      expect(copiedSpec.color, Colors.blue);
      expect(copiedSpec.size, 30.0);
      expect(copiedSpec.icon, Icons.remove);
    });

    test('Equality holds when all properties are the same', () {
      const spec1 = IconSpec(color: color, size: size, icon: icon);
      const spec2 = IconSpec(color: color, size: size, icon: icon);

      expect(spec1, spec2);
    });

    test('Equality fails when properties are different', () {
      const spec1 = IconSpec(color: color, size: size, icon: icon);
      const spec2 = IconSpec(color: Colors.blue, size: size, icon: icon);

      expect(spec1, isNot(spec2));
    });
  });
}
