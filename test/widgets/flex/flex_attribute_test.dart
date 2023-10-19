import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/widgets/exports.dart';

void main() {
  group('FlexAttributes', () {
    test('should create a FlexAttributes object with default values', () {
      const flex = FlexAttributes();

      expect(flex.crossAxisAlignment, isNull);
      expect(flex.direction, isNull);
      expect(flex.mainAxisAlignment, isNull);
      expect(flex.mainAxisSize, isNull);
      expect(flex.verticalDirection, isNull);
      expect(flex.textDirection, isNull);
      expect(flex.textBaseline, isNull);
      expect(flex.clipBehavior, isNull);
    });

    test('should create a FlexAttributes object with specified values', () {
      final flex = FlexAttributes(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.up,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.antiAlias,
      );

      expect(flex.crossAxisAlignment, equals(CrossAxisAlignment.start));
      expect(flex.direction, equals(Axis.horizontal));
      expect(flex.mainAxisAlignment, equals(MainAxisAlignment.center));
      expect(flex.mainAxisSize, equals(MainAxisSize.max));
      expect(flex.verticalDirection, equals(VerticalDirection.up));
      expect(flex.textDirection, equals(TextDirection.ltr));
      expect(flex.textBaseline, equals(TextBaseline.alphabetic));
      expect(flex.clipBehavior, equals(Clip.antiAlias));
    });
  });
}
