import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/align_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('AlignDecoratorAttribute', () {
    test('merge', () {
      const decorator = AlignDecoratorAttribute();
      const other = AlignDecoratorAttribute();
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = AlignDecoratorAttribute();
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<AlignDecoratorSpec>());
    });

    // equality
    test('equality', () {
      const decorator = AlignDecoratorAttribute(
          alignment: Alignment.center, widthFactor: 0.5, heightFactor: 0.5);
      const other = AlignDecoratorAttribute(
          alignment: Alignment.center, widthFactor: 0.5, heightFactor: 0.5);
      expect(decorator, other);
    });

    test('inequality', () {
      const decorator = AlignDecoratorAttribute(
          alignment: Alignment.topCenter, widthFactor: 0.5, heightFactor: 0.5);
      const other = AlignDecoratorAttribute(
          alignment: Alignment.center, widthFactor: 0.5, heightFactor: 0.5);
      expect(decorator, isNot(equals(other)));
    });
  });

  group('AlignDecoratorSpec Tests', () {
    const alignment = Alignment.center;
    const alignment2 = Alignment.bottomRight;

    test('Constructor assigns alignment correctly', () {
      const decorator = AlignDecoratorSpec(alignment: alignment);

      expect(decorator.alignment, alignment);
    });

    test('Lerp method interpolates correctly', () {
      const start = AlignDecoratorSpec(alignment: alignment);
      const end = AlignDecoratorSpec(alignment: alignment2);
      final result = start.lerp(end, 0.5);

      expect(result.alignment, const Alignment(0.5, 0.5));
    });

    test('Equality and hashcode test', () {
      const decorator1 = AlignDecoratorSpec(alignment: alignment);
      const decorator2 = AlignDecoratorSpec(alignment: alignment);
      const decorator3 = AlignDecoratorSpec(alignment: alignment2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Align widget with correct alignment',
      (WidgetTester tester) async {
        const decorator = AlignDecoratorSpec(alignment: alignment);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final Align alignWidget = tester.widget(find.byType(Align));

        expect(find.byType(Align), findsOneWidget);
        expect(alignWidget.alignment, alignment);
        expect(alignWidget.child, isA<Container>());
      },
    );
  });
}
