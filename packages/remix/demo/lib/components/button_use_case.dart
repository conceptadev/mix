import 'package:demo/addons/icon_data_knob.dart';
import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Button Component',
  type: XButton,
)
Widget buildButtonUseCase(BuildContext context) {
  return KeyedSubtree(
    key: _key,
    child: RemixTheme(
      tokens: light,
      components: RemixComponentTheme(
        button: XButtonThemeStyle.value,
      ),
      child: Wrap(
        spacing: 12,
        children: [
          XButton(
            variants: [
              context.knobs.variant(ButtonThemeVariant.values),
            ],
            label: context.knobs.string(
              label: 'Title',
              initialValue: 'Button',
            ),
            onPressed: () {},
            disabled: context.knobs.boolean(
              label: 'Disabled',
              initialValue: false,
            ),
            loading: context.knobs.boolean(
              label: 'loading',
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
          )
        ],
      ),
    ),
  );
}
