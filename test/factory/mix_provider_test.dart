import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/factory/mix_provider.dart';

import '../helpers/random_dto.dart';

const textVariant = Variant('textVariant');

final overrideTextAttribute = TextAttributes.fromValues(
  style: const TextStyle(
    fontSize: 18,
    color: Colors.blue,
  ),
);

final pressableMix = StyleMix.fromAttributes([
  RandomGenerator.boxAttributes(),
  RandomGenerator.textAttributes(),
  textVariant(overrideTextAttribute),
]);

void main() {
  group("Mix Provider", () {
    testWidgets('Mix Provider exist and Matches', (tester) async {
      await tester.pumpWidget(
        StyledContainer(
          style: pressableMix,
        ),
      );

      final widgetFinder = find.byType(MixedContainer);

      // Get BuildContext for boxWidget
      BuildContext context = tester.element(widgetFinder);

      // Grab the MixContext from the BoxMixedWidget MixContext.of(context)
      final mix = MixProvider.maybeOf(context);

      final matchMix = MixData.create(
        context: context,
        style: pressableMix,
      );

      final clonedMix = MixData.create(
        context: context,
        style: pressableMix.clone(),
      );

      expect(mix, matchMix);

      expect(
        mix,
        matchMix,
        reason: 'MixValues should be the same',
      );

      // Different instance but same properties
      expect(matchMix.hashCode == mix.hashCode, true);
      expect(clonedMix.hashCode == mix.hashCode, false);
      expect(matchMix, equals(mix), reason: "matchMix should be the same");
      expect(clonedMix, equals(mix), reason: "clonedMix should be the same");
      expect(widgetFinder, findsOneWidget);
    });
  });
}
