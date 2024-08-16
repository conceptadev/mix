import 'package:demo/helpers/label_variant_builder.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/select/select.dart';
// import 'package:remix/components/dropdown/dropdown_widget.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Card Component',
  type: RxCard,
)
Widget buildCard(BuildContext context) {
  Widget buildCard(CardVariant variant) {
    return Column(
      children: [
        Text(variant.label),
        const SizedBox(height: 10),
        RxCard(
          variant: variant,
          size: context.knobs.list(
            label: 'Size',
            options: CardSize.values,
            initialOption: CardSize.size2,
            labelBuilder: variantLabelBuilder,
          ),
          children: const [StyledText('Hi'), StyledText('This is a test')],
        ),
      ],
    );
  }

  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: CardVariant.values.map(buildCard).toList(),
  );
}

@widgetbook.UseCase(
  name: 'With button',
  type: RxCard,
)
Widget buildRadioUseCase(BuildContext context) {
  Widget buildCard(CardVariant variant) {
    return Column(
      children: [
        Text(variant.label),
        const SizedBox(height: 10),
        RxCard(
          variant: variant,
          size: context.knobs.list(
            label: 'Size',
            options: CardSize.values,
            initialOption: CardSize.size2,
            labelBuilder: variantLabelBuilder,
          ),
          children: const [
            StyledText('Hi'),
            StyledText('This is a test'),
          ],
        ),
        const SizedBox(height: 10),
        // XButton(
        //   label: 'Click me',
        //   onPressed: () {},
        // ),
      ],
    );
  }

  return Center(
    child: SizedBox(
      width: 200,
      child: XSelect(
        button: (context, spec) => XSelectButtonSpecWidget(
          spec: spec,
          text: 'Select a fruit',
          trailingIcon: Icons.keyboard_arrow_down_rounded,
        ),
        menu: (context, spec) => XSelectMenuSpecWidget(
            spec: spec,
            children: (context, spec) {
              return List.generate(
                4,
                (index) => XSelectMenuItemSpecWidget(
                  spec: spec,
                  icon: Icons.apple_rounded,
                  text: 'Apple',
                  onPress: () {
                    print(index);
                  },
                ),
              );
            }),
      ),
    ),
  );
}
