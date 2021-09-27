import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/primitives/icon/icon_color.dart';
import 'package:mix/src/attributes/primitives/icon/icon_size.dart';
import 'package:mix/src/attributes/primitives/text/text_direction.dart';

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
            IconColorAttribute(Colors.greenAccent),
            IconSizeAttribute(23),
            const TextDirectionAttribute(TextDirection.rtl),
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
