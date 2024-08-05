import 'package:demo/helpers/label_variant_builder.dart';
import 'package:flutter/material.dart';
import 'package:remix/components/progress/progress.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Progress Component',
  type: RxProgress,
)
Widget buildProgressUseCase(BuildContext context) {
  return SizedBox(
    width: 200,
    child: RxProgress(
      radius: context.knobs.list(
        label: 'Radius',
        options: ProgressRadius.values,
        initialOption: ProgressRadius.medium,
        labelBuilder: variantLabelBuilder,
      ),
      size: context.knobs.list(
        label: 'Size',
        options: ProgressSize.values,
        initialOption: ProgressSize.size2,
        labelBuilder: variantLabelBuilder,
      ),
      variant: context.knobs.list(
        label: 'Type',
        options: ProgressVariant.values,
        initialOption: ProgressVariant.surface,
        labelBuilder: variantLabelBuilder,
      ),
      value: context.knobs.double.slider(
        label: 'value',
        min: 0,
        max: 1,
        initialValue: 0.5,
      ),
    ),
  );
}
