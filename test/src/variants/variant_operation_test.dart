import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('VariantOperation', () {
    test('should add variant with & operator', () {
      const variant = Variant('test');
      const otherVariant = Variant('other');
      final result = otherVariant & variant;
      expect(result.variants, contains(variant));
    });

    test('should add variant with | operator', () {
      const variant = Variant('test');
      const otherVariant = Variant('other');
      final result = otherVariant | variant;
      expect(result.variants, contains(variant));
    });
  });
}
