import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Spinner Component',
  type: XSpinner,
)
Widget buildSpinnerUseCase(BuildContext context) {
  Widget buildSpinner(SpinnerStyle style) {
    return Column(
      children: [
        Text(style.name),
        const SizedBox(height: 10),
        XSpinner(
          variants: [context.knobs.variant(XSpinnerThemeVariant.values)],
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
  // return Center(
  //   child: XSpinner(
  //     style: Style(
  //       context.knobs.
  //       $spinner.style.dotted(),
  //     ),
  //     variants: [context.knobs.variant(XSpinnerThemeVariant.values)],
  //   ),
  // );
}
