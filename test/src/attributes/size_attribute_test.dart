import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/value_attributes.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('HeightAttribute', () {
    test('from constructor sets value correctly', () {
      final attr = HeightAttribute(100.0.toDto);

      expect(attr.value.value, 100.0);
    });

    test('merge returns merged object correctly', () {
      final attr1 = HeightAttribute(100.0.toDto);
      final attr2 = HeightAttribute((200.0.toDto));

      final merged = attr1.merge(attr2);

      expect(merged.value.value, 200.0); // should take from attr2
    });
  });

  group('WidthAttribute', () {
    test('from constructor sets value correctly', () {
      final attr = WidthAttribute(100.0.toDto);

      expect(attr.value.value, 100.0);
    });

    test('merge returns merged object correctly', () {
      final attr1 = WidthAttribute(100.0.toDto);
      final attr2 = WidthAttribute(200.0.toDto);

      final merged = attr1.merge(attr2);

      expect(merged.value.value, 200.0); // should take from attr2
    });
  });
}
