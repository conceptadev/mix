import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/widgets/common/common.attributes.dart';
import 'package:mix/src/attributes/widgets/icon/icon.attributes.dart';
import 'package:mix/src/mixer/mix_factory.dart';

import '../test_utils.dart';

void main() {
  group("Mix Icon widget", () {
    testWidgets('Adds icon on widget', (tester) async {
      await tester.pumpWidget(
        DirectionalTestWidget(
          child: Mix().icon(Icons.bolt),
        ),
      );

      expect(
        tester.widget<Icon>(find.byType(Icon)).icon,
        Icons.bolt,
      );
    });

    testWidgets('Adds Icon properties on widget', (tester) async {
      await tester.pumpWidget(
        DirectionalTestWidget(
          child: Mix(
            const IconAttributes(color: Colors.greenAccent),
            const IconAttributes(size: 23),
            const CommonAttributes(textDirection: TextDirection.rtl),
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
