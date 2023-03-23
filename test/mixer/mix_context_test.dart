import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../testing_utils.dart';

const textVariant = Variant('textVariant');

const overrideTextAttribute = TextAttributes(
  style: TextStyle(
    fontSize: 18,
    color: Colors.blue,
  ),
);

final pressableMix = MixFactory.fromAttributes([
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
        onPressed: () {},
        child: VBox(
          mix: pressableMix,
          children: const [
            TextMix('Hello'),
            TextMix('With Variant', variants: [textVariant]),
            TextMix(
              'With Mix',
              mix: MixFactory(
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

        final matchContext = MixContextData.create(
          context: context,
          mix: pressableMix,
        );

        expect(mixContext.toValues(), matchContext.toValues());

        expect(
          mixContext.toValues(),
          matchContext.toValues(),
          reason: 'sourceMix',
        );

        // Different instance but same properties
        expect(matchContext.hashCode == mixContext.hashCode, false);
      });

      expect(foundWidget, findsOneWidget);
    });
  });
}
