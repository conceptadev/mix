import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Progress Component',
  type: XProgress,
)
Widget buildProgressUseCase(BuildContext context) {
  return SizedBox(
    width: 200,
    child: XProgress(
      variants: [
        context.knobs.variant(XProgressThemeVariant.values),
      ],
      value: context.knobs.double.slider(
        label: 'value',
        min: 0,
        max: 1,
        initialValue: 0.5,
      ),
    ),
  );
}
