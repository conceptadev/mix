import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../helpers/label_variant_builder.dart';

@widgetbook.UseCase(
  name: 'Badge Component',
  type: RxBadge,
)
Widget buildAvatarUseCase(BuildContext context) {
  return RxBadge(
    label: 'New',
    size: context.knobs.list(
      label: 'Size',
      options: BadgeSize.values,
      labelBuilder: variantLabelBuilder,
    ),
    variant: context.knobs.list(
      label: 'Variant',
      options: BadgeVariant.values,
      labelBuilder: variantLabelBuilder,
    ),
    radius: context.knobs.list(
      label: 'Radius',
      options: BadgeRadius.values,
      labelBuilder: variantLabelBuilder,
    ),
  );
}
