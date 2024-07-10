import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';
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
          children: const [StyledText('Hi'), StyledText('This is a test')],
        ),
        const SizedBox(height: 10),
        RxButton(
          label: 'Click me',
          onPressed: () {},
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
