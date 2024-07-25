import 'package:demo/addons/icon_data_knob.dart';
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();
@widgetbook.UseCase(
  name: 'Button Component',
  type: CustomButton,
)
Widget buildButtonUseCase(BuildContext context) {
  Widget buildButton(ButtonVariant type) {
    return CustomButton(
      label: context.knobs.string(
        label: 'Title',
        initialValue: 'Button',
      ),
      onPressed: () {},
      disabled: context.knobs.boolean(
        label: 'Disabled',
        initialValue: false,
      ),
      icon: context.knobs.iconData(
        label: 'Icon left',
        initialValue: null,
      ),
      variant: type,
    );
  }

  return KeyedSubtree(
    key: _key,
    child: Wrap(
      spacing: 12,
      children: ButtonVariant.values.map(buildButton).toList(),
    ),
  );
}
