import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RXButton,
)
Widget buildButtonUseCase(BuildContext context) {
  Widget buildButton(ButtonType type) {
    return RXButton(
      label: context.knobs.string(
        label: 'Title',
        initialValue: 'Title',
      ),
      onPressed: () {},
      loading: context.knobs.boolean(
        label: 'Is loading',
        initialValue: false,
      ),
      loadingLabel: context.knobs.string(
        label: 'Loading label',
        initialValue: 'Loading',
      ),
      disabled: context.knobs.boolean(
        label: 'Disabled',
        initialValue: false,
      ),
      size: context.knobs.list(
        label: 'Size',
        options: ButtonSize.values,
        labelBuilder: (value) => value.name.split('.').last,
      ),
      type: type,
    );
  }

  return Center(
    child: Wrap(children: ButtonType.values.map(buildButton).toList()),
  );
}
