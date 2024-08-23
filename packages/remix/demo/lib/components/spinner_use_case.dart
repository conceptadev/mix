import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Spinner Component',
  type: RxSpinner,
)
Widget buildSpinnerUseCase(BuildContext context) {
  Widget buildSpinner(SpinnerStyle style) {
    return Column(
      children: [
        Text(style.name),
        const SizedBox(height: 10),
        RxSpinner(
          style: Style(
            SpinnerSpecUtility.self.style(style),
          ),
        ),
      ],
    );
  }

  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: SpinnerStyle.values.map(buildSpinner).toList(),
  );
}
