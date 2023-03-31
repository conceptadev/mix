import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart' hide border, onEnabled, icon, iconColor;
import 'package:mix/src/attributes/common/common.descriptor.dart';
import 'package:mix/src/helpers/equatable_mixin.dart';

import '../helpers/testing_utils.dart';

const activated = Variant("activated");

const customIcon = InheritedIconAttribute.icon;
const withSize = InheritedIconAttribute.withSize;
const withColor = InheritedIconAttribute.withColor;

const inputDecoration = InputDecorationThemeAttribute.inputDecoration;

class InheritedIconAttribute extends WidgetAttributes {
  const InheritedIconAttribute({
    this.color,
    this.size,
  });

  final Color? color;
  final double? size;

  @override
  InheritedIconAttribute merge(InheritedIconAttribute other) {
    return InheritedIconAttribute(
      color: other.color ?? color,
      size: other.size ?? size,
    );
  }

  static InheritedIconAttribute icon({
    required Color color,
    required double size,
  }) {
    return InheritedIconAttribute(
      size: size,
      color: color,
    );
  }

  static InheritedIconAttribute withColor(Color color) {
    return InheritedIconAttribute(
      color: color,
    );
  }

  static InheritedIconAttribute withSize(double size) {
    return InheritedIconAttribute(
      size: size,
    );
  }

  @override
  get props => [color, size];
}

class InputDecorationThemeAttribute
    with EquatableMixin
    implements WidgetAttributes {
  final Color? iconColor;
  final Color? fillColor;
  final InputBorder? border;
  const InputDecorationThemeAttribute({
    this.iconColor,
    this.fillColor,
    this.border,
  });

  @override
  InputDecorationThemeAttribute merge(InputDecorationThemeAttribute other) {
    return InputDecorationThemeAttribute(
      iconColor: other.iconColor ?? iconColor,
      fillColor: other.fillColor ?? fillColor,
      border: other.border ?? border,
    );
  }

  InputDecorationTheme resolve() {
    return InputDecorationTheme(
      iconColor: iconColor,
      fillColor: fillColor,
      border: border,
    );
  }

  static InputDecorationThemeAttribute inputDecoration({
    Color? iconColor,
    Color? fillColor,
    InputBorder? border,
  }) {
    return InputDecorationThemeAttribute(
      iconColor: iconColor,
      fillColor: fillColor,
      border: border,
    );
  }

  @override
  get props => [iconColor, fillColor, border];
}

final mix = Mix(
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
  const CommonAttributes(textDirection: TextDirection.rtl),
);

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
    return MixContextBuilder(
      variants: variants,
      mix: mix,
      builder: (context, mixContext) {
        final attribute =
            mixContext.attributesOfType<InheritedIconAttribute>()!;

        final sharedProps = CommonDescriptor.fromContext(context);

        return Semantics(
          label: semanticLabel,
          child: Column(
            children: [
              Icon(
                icon,
                color: attribute.color,
                size: attribute.size,
                textDirection: sharedProps.textDirection,
              ),
            ],
          ),
        );
      },
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
    return MixContextBuilder(
      mix: mix,
      variants: variants,
      builder: (context, mixContext) {
        final decorationTheme = mixContext
            .dependOnAttributesOfType<InputDecorationThemeAttribute>();

        return Semantics(
          label: semanticLabel,
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration()
                    .applyDefaults(decorationTheme.resolve()),
              ),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  group("inherited icon attribute", () {
    testWidgets('without variants', (tester) async {
      await tester.pumpWidget(
        const TestMixWidget(
          child: CustomWidget(Icons.bolt),
        ),
      );

      final icon = tester.widget<Icon>(find.byType(Icon));

      expect(icon.color, Colors.green);
      expect(icon.size, 23);
      expect(icon.icon, Icons.bolt);

      expect(icon.textDirection, TextDirection.rtl);
    });

    testWidgets('with variant', (tester) async {
      await tester.pumpWidget(
        const TestMixWidget(
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

  group("inherited input theme attribute", () {
    testWidgets('without variants', (tester) async {
      await tester.pumpWidget(
        const TestMixWidget(
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

    testWidgets('with variants', (tester) async {
      await tester.pumpWidget(
        const TestMixWidget(
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
