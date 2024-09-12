import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/src/components/button/button.dart';
import 'package:remix/src/components/spinner/spinner.dart';

void main() {
  group('RxButton', () {
    testWidgets('renders label correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        m.MaterialApp(
          home: Button(
            style: const ButtonStyle(),
            label: 'Test Button',
            onPressed: () {},
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool wasTapped = false;
      await tester.pumpWidget(
        m.MaterialApp(
          home: Button(
            style: const ButtonStyle(),
            label: 'Test Button',
            onPressed: () {
              wasTapped = true;
            },
          ),
        ),
      );

      await tester.tap(find.byType(Button));
      expect(wasTapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled',
        (WidgetTester tester) async {
      bool wasTapped = false;
      await tester.pumpWidget(
        m.MaterialApp(
          home: Button(
            style: const ButtonStyle(),
            label: 'Test Button',
            onPressed: () {
              wasTapped = true;
            },
            disabled: true,
          ),
        ),
      );

      await tester.tap(find.byType(Button));
      expect(wasTapped, isFalse);
    });

    testWidgets('shows loading indicator when loading',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        m.MaterialApp(
          home: Button(
            style: const ButtonStyle(),
            label: 'Test Button',
            onPressed: () {},
            loading: true,
          ),
        ),
      );

      expect(find.byType(SpinnerSpecWidget), findsOneWidget);

      final opacityWidget = tester.widget<Opacity>(find.byType(Opacity));
      expect(opacityWidget.opacity, 0);
    });

    testWidgets('renders left icon correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        m.MaterialApp(
          home: Button(
            style: const ButtonStyle(),
            label: 'Test Button',
            onPressed: () {},
            iconLeft: m.Icons.add,
          ),
        ),
      );

      expect(find.byIcon(m.Icons.add), findsOneWidget);
    });

    testWidgets('renders right icon correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        m.MaterialApp(
          home: Button(
            style: const ButtonStyle(),
            label: 'Test Button',
            onPressed: () {},
            iconRight: m.Icons.arrow_forward,
          ),
        ),
      );

      expect(find.byIcon(m.Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('uses custom spinner builder when provided',
        (WidgetTester tester) async {
      const key = Key('key');

      await tester.pumpWidget(
        m.MaterialApp(
          home: Button(
            style: const ButtonStyle(),
            label: 'Test Button',
            onPressed: () {},
            loading: true,
            spinnerBuilder: (_) {
              return Container(
                key: key,
                width: 20,
                height: 20,
                color: m.Colors.red,
              );
            },
          ),
        ),
      );

      final container = tester.widget<Container>(find.byKey(key));

      expect(container.constraints?.maxWidth, 20);
      expect(container.constraints?.maxHeight, 20);
      expect(container.color, m.Colors.red);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      const color = m.Colors.red;

      await tester.pumpWidget(
        m.MaterialApp(
          home: Button(
            label: 'Test Button',
            onPressed: () {},
            style: const FakeButtonStyle(color),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.decoration, isA<BoxDecoration>());
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.color, equals(color));
    });
  });
}

class FakeButtonStyle extends ButtonStyle {
  final Color color;
  const FakeButtonStyle(this.color);

  @override
  Style makeStyle(SpecConfiguration<ButtonSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    return Style.create([
      baseStyle(),
      $.container.color(color),
    ]);
  }
}
