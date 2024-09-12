import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Badge Component',
  type: Badge,
)
Widget buildAvatarUseCase(BuildContext context) {
  return Center(
    child: Badge(
      variants: [
        context.knobs.variant(XBadgeThemeVariant.values),
      ],
      label: context.knobs.string(
        label: 'Label',
        initialValue: 'New',
      ),
    ),
  );
}
