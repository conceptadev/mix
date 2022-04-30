import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../testing_utils.dart';

final textVariant = Variant('textVariant');

const overrideTextAttribute = TextAttributes(
  style: TextStyle(
    fontSize: 18,
    color: Colors.blue,
  ),
);

final pressableMix = Mix.fromList([
  baseBoxAttributes,
  baseTextAttributes,
  textVariant(overrideTextAttribute),
]);

class _MixContextTestWidget extends StatelessWidget {
  const _MixContextTestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MixTestWidget(
      child: Pressable(
        mix: pressableMix,
        onPressed: () {},
        child: Column(
          children: [
            const TextMix('Hello'),
            TextMix('With Variant', variant: textVariant),
            TextMix(
              'With Mix',
              mix: Mix(
                textColor(Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  group("Mix Context", () {
    testWidgets('Mix Context exist and Matches', (tester) async {
      await tester.pumpWidget(const _MixContextTestWidget());

      final foundWidget = find.byType(BoxMixedWidget);
      final BuildContext context = tester.element(foundWidget);
      foundWidget.evaluate().forEach((element) {
        final boxMixedWidget = element.widget as BoxMixedWidget;

        final mixContext = boxMixedWidget.mixContext;

        final matchContext = MixContext.create(
          context: context,
          mix: pressableMix,
        );

        expect(mixContext.sourceMix, pressableMix);
        expect(
          mixContext.descendentMix,
          matchContext.descendentMix,
          reason: 'descendentMix',
        );

        expect(
          mixContext.originalMix,
          matchContext.originalMix,
          reason: 'originalMix',
        );

        expect(
          mixContext.sourceMix,
          matchContext.sourceMix,
          reason: 'sourceMix',
        );

        // Different instance but same properties
        expect(matchContext.hashCode == mixContext.hashCode, false);
      });

      expect(foundWidget, findsOneWidget);
    });
  });
}
