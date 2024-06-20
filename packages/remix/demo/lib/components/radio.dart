import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixRadio,
)
Widget buildRadioUseCase(BuildContext context) {
  return Center(
    child: RemixRadio(
      active: context.knobs.boolean(
        label: 'active',
        initialValue: true,
      ),
      label: context.knobs.string(
        label: 'label',
        initialValue: 'Radio',
      ),
      disabled: context.knobs.boolean(
        label: 'disabled',
        initialValue: false,
      ),
      onChanged: (value) {},
    ),
  );
}
