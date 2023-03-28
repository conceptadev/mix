import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/mixer/mix_context.dart';

import '../helpers/random_dto.dart';

const textVariant = Variant('textVariant');

final overrideTextAttribute = TextAttributes.fromValues(
  style: const TextStyle(
    fontSize: 18,
    color: Colors.blue,
  ),
);

final pressableMix = Mix.fromAttributes([
  RandomGenerator.boxAttributes(),
  RandomGenerator.textAttributes(),
  textVariant(overrideTextAttribute),
]);

void main() {
  group("Mix Context", () {
    testWidgets('Mix Context exist and Matches', (tester) async {
      await tester.pumpWidget(Box(
        mix: pressableMix,
      ));

      final widgetFinder = find.byType(BoxMixedWidget);

      // Get BuildContext for boxWidget
      BuildContext context = tester.element(widgetFinder);

      // Grab the MixContext from the BoxMixedWidget MixContext.of(context)
      final mix = MixContext.of(context);

      final matchMix = MixContextData.create(
        context: context,
        mix: pressableMix,
      );

      final clonedMix = MixContextData.create(
        context: context,
        mix: pressableMix.clone(),
      );

      expect(mix?.toValues(), matchMix.toValues());

      expect(
        mix?.toValues(),
        matchMix.toValues(),
        reason: 'MixValues should be the same',
      );

      // Different instance but same properties
      expect(matchMix.hashCode == mix.hashCode, true);
      expect(clonedMix.hashCode == mix.hashCode, false);
      expect(matchMix, equals(mix));
      expect(clonedMix, equals(mix));
      expect(widgetFinder, findsOneWidget);
    });
  });
}
