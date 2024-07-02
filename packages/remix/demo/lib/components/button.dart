import 'package:demo/addons/icon_data_knob.dart';
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RxButton,
)
Widget buildButtonUseCase(BuildContext context) {
  Widget buildButton(ButtonVariant type) {
    return RxButton(
      label: context.knobs.string(
        label: 'Title',
        initialValue: 'Button',
      ),
      onPressed: () {},
      loading: context.knobs.boolean(
        label: 'Is loading',
        initialValue: false,
      ),
      disabled: context.knobs.boolean(
        label: 'Disabled',
        initialValue: false,
      ),
      iconLeft: context.knobs.iconData(
        label: 'Icon left',
        initialValue: null,
      ),
      iconRight: context.knobs.iconData(
        label: 'Icon right',
        initialValue: null,
      ),
      size: context.knobs.list(
        label: 'Size',
        options: ButtonSize.values,
        initialOption: ButtonSize.medium,
        labelBuilder: (value) => value.name.split('.').last,
      ),
      type: type,
    );
  }

  return Wrap(
    spacing: 12,
    children: ButtonVariant.values.map(buildButton).toList(),
  );
}
