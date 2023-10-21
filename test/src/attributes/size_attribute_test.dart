import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('HeightAttribute', () {
    test('from constructor sets value correctly', () {
      final attr = HeightAttribute.from(100.0);

      expect(attr.value.value, 100.0);
    });

    test('merge returns merged object correctly', () {
      const attr1 = HeightAttribute(DoubleDto(100.0));
      const attr2 = HeightAttribute(DoubleDto(200.0));

      final merged = attr1.merge(attr2);

      expect(merged.value.value, 200.0); // should take from attr2
    });
  });

  group('WidthAttribute', () {
    test('from constructor sets value correctly', () {
      final attr = WidthAttribute.from(100.0);

      expect(attr.value.value, 100.0);
    });

    test('merge returns merged object correctly', () {
      const attr1 = WidthAttribute(DoubleDto(100.0));
      const attr2 = WidthAttribute(DoubleDto(200.0));

      final merged = attr1.merge(attr2);

      expect(merged.value.value, 200.0); // should take from attr2
    });
  });
}
