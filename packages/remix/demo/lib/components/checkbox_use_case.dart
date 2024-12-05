import 'package:demo/helpers/knob_builder.dart';
import 'package:demo/helpers/use_case_state.dart';
import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';
import 'package:remix/themes/fortaleza.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Checkbox Component',
  type: Checkbox,
)
Widget buildCheckboxUseCase(BuildContext context) {
  final knobState = WidgetbookState.of(context);

  return Scaffold(
    body: KeyedSubtree(
      key: _key,
      child: Center(
        child: Checkbox(
          label: context.knobs.string(label: 'Label', initialValue: 'Label'),
          variants: [context.knobs.variant(FortalezaCheckboxStyle.variants)],
          disabled:
              context.knobs.boolean(label: 'Disabled', initialValue: false),
          value: context.knobs.boolean(label: 'Checked', initialValue: true),
          onChanged: (value) => knobState.updateKnob('Checked', value),
        ),
      ),
    ),
  );
}
