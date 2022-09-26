import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart' hide border, enabled, icon, iconColor;

import '../testing_utils.dart';

final activated = Variant("activated");

const myIcon = MyIconAttributes.icon;
const withSize = MyIconAttributes.withSize;
const withColor = MyIconAttributes.withColor;

const inputDecoration = InputDecorationAttributes.inputDecoration;

class MyIconAttributes extends InheritedAttribute<MyIconAttributes> {
  const MyIconAttributes({
    this.color,
    this.size,
  });

  final Color? color;
  final double? size;

  @override
  MyIconAttributes merge(MyIconAttributes? other) {
    if(other is! InheritedAttribute<MyIconAttributes>) {
      return this;
    }

    return MyIconAttributes(
      color: other?.color ?? color,
      size: other?.size ?? size,
    );
  }

  static MyIconAttributes icon({required Color color, required double size}) {
    return MyIconAttributes(
      size: size,
      color: color,
    );
  }

  static MyIconAttributes withColor(Color color) {
    return MyIconAttributes(
      color: color,
    );
  }

  static MyIconAttributes withSize(double size) {
    return MyIconAttributes(
      size: size,
    );
  }
}

class InputDecorationAttributes extends InputDecoration
    implements InheritedAttribute<InputDecorationAttributes> {
  const InputDecorationAttributes({
    Color? iconColor,
    Color? fillColor,
    InputBorder? border,
  }) : super(iconColor: iconColor, fillColor: fillColor, border: border);

  @override
  InputDecorationAttributes merge(InputDecorationAttributes other) {
    return InputDecorationAttributes(
      iconColor: other.iconColor ?? iconColor,
      fillColor: other.fillColor ?? fillColor,
      border: other.border ?? border,
    );
  }

  static InputDecorationAttributes inputDecoration({
    Color? iconColor,
    Color? fillColor,
    InputBorder? border,
  }) {
    return InputDecorationAttributes(
      iconColor: iconColor ?? iconColor,
      fillColor: fillColor ?? fillColor,
      border: border ?? border,
    );
  }

  @override
  Object get type => InputDecorationAttributes;
}

class Style {
  late final base = Mix(
    withSize(23),
    withColor(Colors.green),
    inputDecoration(
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    ),
    inputDecoration(
      fillColor: Colors.red,
    ),
    activated(withColor(Colors.blue), inputDecoration(fillColor: Colors.green)),
    const SharedAttributes(textDirection: TextDirection.rtl),
  );
}

class CustomWidget extends StatelessWidget {
  const CustomWidget(
    this.icon, {
    this.semanticLabel,
    Key? key,
    this.variants = const [],
  }) : super(
          key: key,
        );

  final IconData? icon;
  final String? semanticLabel;
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    return MixableBuilder(
      variants: variants,
      builder: (mixContext) {
        final attributes = mixContext.fromType<MyIconAttributes>();

        return Semantics(
          label: semanticLabel,
          child: Column(
            children: [
              Icon(
                icon,
                color: attributes.color,
                size: attributes.size,
                textDirection: mixContext.sharedProps.textDirection,
              ),
            ],
          ),
        );
      },
      mix: Style().base,
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
    this.icon, {
    this.semanticLabel,
    Key? key,
    this.variants = const [],
  }) : super(
          key: key,
        );

  final IconData? icon;
  final String? semanticLabel;
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    return MixableBuilder(
      mix: Style().base,
      variants: variants,
      builder: (mixContext) {
        final inputDecoration =
            mixContext.fromType<InputDecorationAttributes>();

        return Semantics(
          label: semanticLabel,
          child: Column(
            children: [
              TextField(
                decoration: inputDecoration,
              ),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  group("mix attribute extension", () {
    testWidgets('custom icon mix attribute extension', (tester) async {
      await tester.pumpWidget(
        const MixTestWidget(
          child: CustomWidget(Icons.bolt),
        ),
      );

      final icon = tester.widget<Icon>(find.byType(Icon));

      expect(icon.color, Colors.green);
      expect(icon.size, 23);
      expect(icon.icon, Icons.bolt);

      expect(icon.textDirection, TextDirection.rtl);
    });

    testWidgets('TextField', (tester) async {
      await tester.pumpWidget(
        MixTestWidget(
          child: CustomWidget(
            Icons.bolt,
            variants: [activated],
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byType(Icon));

      expect(icon.color, Colors.blue);
      expect(icon.size, 23);
      expect(icon.icon, Icons.bolt);

      expect(icon.textDirection, TextDirection.rtl);
    });
  });

  group("TextField attribute extension with variant", () {
    testWidgets('custom icon mix attribute extension', (tester) async {
      await tester.pumpWidget(
        const MixTestWidget(
          child: MaterialApp(
            home: Material(
              child: TextFieldWidget(
                Icons.bolt,
                variants: [],
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.decoration!.fillColor, Colors.red);
    });

    testWidgets('TextField', (tester) async {
      await tester.pumpWidget(
        MixTestWidget(
          child: MaterialApp(
            home: Scaffold(
              body: TextFieldWidget(
                Icons.bolt,
                variants: [activated],
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.decoration!.fillColor, Colors.green);
    });
  });
}
