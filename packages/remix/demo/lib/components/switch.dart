import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixSwitch,
)
Widget buildRadioUseCase(BuildContext context) {
  return Center(
    child: RemixSwitch(
      active: context.knobs.boolean(
        label: 'active',
        initialValue: true,
      ),
      disabled: context.knobs.boolean(
        label: 'disabled',
        initialValue: false,
      ),
      onChanged: (value) {},
    ),
  );
}
