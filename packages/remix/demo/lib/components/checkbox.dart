import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixCheckbox,
)
Widget buildCheckboxUseCase(BuildContext context) {
  return Center(
    child: Row(
      children: [
        Box(
          style: Style(
            $box.color.grey(),
            $box.height(20),
            $box.width(20),
            $box.borderRadius(4),
          ),
        ),
        RemixCheckbox(
          label: context.knobs.stringOrNull(
            label: 'Title',
            initialValue: 'Title',
          ),
          onChanged: (value) {},
          value: context.knobs.boolean(
            label: 'Checked',
            initialValue: false,
          ),
          disabled: context.knobs.boolean(
            label: 'Disabled',
            initialValue: false,
          ),
        ),
      ],
    ),
  );
}
