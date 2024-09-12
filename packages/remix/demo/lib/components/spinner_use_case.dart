import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Spinner Component',
  type: Spinner,
)
Widget buildSpinnerUseCase(BuildContext context) {
  Widget buildSpinner(SpinnerTypeStyle style) {
    return Column(
      children: [
        Text(style.name),
        const SizedBox(height: 10),
        Spinner(
          variants: [context.knobs.variant(FortalezaSpinnerStyle.variants)],
          style: const FortalezaSpinnerStyle(),
        ),
      ],
    );
  }

  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: SpinnerTypeStyle.values.map(buildSpinner).toList(),
  );
}
