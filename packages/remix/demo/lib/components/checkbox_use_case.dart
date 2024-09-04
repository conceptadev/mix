import 'package:demo/helpers/knob_builder.dart';
import 'package:demo/helpers/use_case_state.dart';
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Checkbox Component',
  type: XCheckbox,
)
Widget buildCheckboxUseCase(BuildContext context) {
  final knobState = WidgetbookState.of(context);

  return KeyedSubtree(
    key: _key,
    child: Center(
      child: XCheckbox(
        variants: [context.knobs.variant(XCheckboxThemeVariant.values)],
        disabled: context.knobs.boolean(label: 'Disabled', initialValue: false),
        value: context.knobs.boolean(label: 'Checked', initialValue: true),
        onChanged: (value) => knobState.updateKnob('Checked', value),
      ),
    ),
  );
}
