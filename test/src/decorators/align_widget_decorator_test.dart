import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/align_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('AlignWidgetDecorator', () {
    test('merge', () {
      const decorator = AlignWidgetDecorator();
      const other = AlignWidgetDecorator();
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = AlignWidgetDecorator();
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<AlignWidgetSpec>());
    });

    // equality
    test('equality', () {
      const decorator = AlignWidgetDecorator(
          alignment: Alignment.center, widthFactor: 0.5, heightFactor: 0.5);
      const other = AlignWidgetDecorator(
          alignment: Alignment.center, widthFactor: 0.5, heightFactor: 0.5);
      expect(decorator, other);
    });

    test('inequality', () {
      const decorator = AlignWidgetDecorator(
          alignment: Alignment.topCenter, widthFactor: 0.5, heightFactor: 0.5);
      const other = AlignWidgetDecorator(
          alignment: Alignment.center, widthFactor: 0.5, heightFactor: 0.5);
      expect(decorator, isNot(equals(other)));
    });
  });

  group('AlignWidgetSpec Tests', () {
    const alignment = Alignment.center;
    const alignment2 = Alignment.bottomRight;

    test('Constructor assigns alignment correctly', () {
      const decorator = AlignWidgetSpec(alignment: alignment);

      expect(decorator.alignment, alignment);
    });

    test('Lerp method interpolates correctly', () {
      const start = AlignWidgetSpec(alignment: alignment);
      const end = AlignWidgetSpec(alignment: alignment2);
      final result = start.lerp(end, 0.5);

      expect(result.alignment, const Alignment(0.5, 0.5));
    });

    test('Equality and hashcode test', () {
      const decorator1 = AlignWidgetSpec(alignment: alignment);
      const decorator2 = AlignWidgetSpec(alignment: alignment);
      const decorator3 = AlignWidgetSpec(alignment: alignment2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Align widget with correct alignment',
      (WidgetTester tester) async {
        const decorator = AlignWidgetSpec(alignment: alignment);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final Align alignWidget = tester.widget(find.byType(Align));

        expect(find.byType(Align), findsOneWidget);
        expect(alignWidget.alignment, alignment);
        expect(alignWidget.child, isA<Container>());
      },
    );
  });
}
