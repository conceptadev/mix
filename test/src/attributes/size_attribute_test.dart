import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/visual_attributes.dart';

void main() {
  group('HeightAttribute', () {
    test('from constructor sets value correctly', () {
      const attr = HeightAttribute(100.0);

      expect(attr.value, 100.0);
    });

    test('merge returns merged object correctly', () {
      const attr1 = HeightAttribute(100.0);
      const attr2 = HeightAttribute((200.0));

      final merged = attr1.merge(attr2);

      expect(merged.value, 200.0); // should take from attr2
    });
  });

  group('WidthAttribute', () {
    test('from constructor sets value correctly', () {
      const attr = WidthAttribute(100.0);

      expect(attr.value, 100.0);
    });

    test('merge returns merged object correctly', () {
      const attr1 = WidthAttribute(100.0);
      const attr2 = WidthAttribute(200.0);

      final merged = attr1.merge(attr2);

      expect(merged.value, 200.0); // should take from attr2
    });
  });
}
