import 'package:flutter/material.dart';
import 'package:remix/components/spinner/spinner.variants.dart';
import 'package:remix/components/spinner/spinner_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Spinner Component',
  type: RxSpinner,
)
Widget buildSpinnerUseCase(BuildContext context) {
  Widget buildSpinner(SpinnerVariant variant) {
    return Column(
      children: [
        Text(variant.label),
        const SizedBox(height: 10),
        RxSpinner(
          size: context.knobs.list(
            label: 'Size',
            options: SpinnerSize.values,
            initialOption: SpinnerSize.medium,
            labelBuilder: (value) => value.label,
          ),
          variant: variant,
        ),
      ],
    );
  }

  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: SpinnerVariant.values.map(buildSpinner).toList(),
  );
}
