import 'package:flutter/material.dart';
import 'package:themed_button/button/button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'button/button.variants.dart';

@widgetbook.UseCase(name: 'Default', type: ThemedButton)
Widget buildCoolButtonUseCase(BuildContext context) {
  return Center(
    child: ThemedButton(
      label: 'Cool Button',
      onPressed: () {},
      size: context.knobs.list(
        label: 'size',
        options: ButtonSize.values,
        labelBuilder: (value) => value.name,
      ),
      type: context.knobs.list(
        label: 'type',
        options: ButtonType.values,
        labelBuilder: (value) => value.name,
      ),
    ),
  );
}
