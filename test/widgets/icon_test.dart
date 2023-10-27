import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/icon.attribute.dart';
import 'package:mix/src/attributes/shared/shared.attributes.dart';
import 'package:mix/src/dtos/color.toDto.dart';
import 'package:mix/src/factory/style_mix.dart';
import 'package:mix/src/helpers/extensions/style_mix_ext.dart';

import '../helpers/testing_utils.dart';

void main() {
  group("Mix Icon widget", () {
    testWidgets('Adds icon on widget', (tester) async {
      await tester.pumpWidget(
        TestMixWidget(child: StyleMix().icon(Icons.bolt)),
      );

      expect(tester.widget<Icon>(find.byType(Icon)).icon, Icons.bolt);
    });

    testWidgets('Adds Icon properties on widget', (tester) async {
      await tester.pumpWidget(
        TestMixWidget(
          child: StyleMix(
            const StyledIconAttributes(color: ColorDto(Colors.greenAccent)),
            const StyledIconAttributes(size: 23),
            const SharedStyleAttributes(textDirection: TextDirection.rtl),
          ).icon(Icons.bolt),
        ),
      );

      final iconProp = tester.widget<Icon>(find.byType(Icon));

      expect(iconProp.color, Colors.greenAccent);
      expect(iconProp.size, 23);
      expect(iconProp.icon, Icons.bolt);

      expect(iconProp.textDirection, TextDirection.rtl);
    });
  });
}
