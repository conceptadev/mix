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

  return const NewWidget();
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
  });

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  String selectedValue = 'Apple';
  final List<String> items = ['Apple', 'Banana', 'Orange'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: XSelect<String>(
            value: selectedValue,
            onChanged: (value) => setState(() => selectedValue = value),
            button: (context, spec) => spec(
                  text: selectedValue,
                  trailingIcon: Icons.keyboard_arrow_down_rounded,
                ),
            items: (context, spec) {
              return List.generate(
                items.length,
                (index) => XSelectMenuItem<String>(
                  value: items[index],
                  child: XSelectMenuItemSpecWidget(
                    spec: spec,
                    text: items[index],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
