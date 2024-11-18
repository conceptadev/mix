import 'package:demo/addons/icon_data_knob.dart';
import 'package:demo/helpers/knob_builder.dart';
import 'package:demo/helpers/use_case_state.dart';
import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';
import 'package:remix/themes/fortaleza.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Chip Component',
  type: Chip,
)
Widget buildChipUseCase(BuildContext context) {
  final knobState = WidgetbookState.of(context);

  return KeyedSubtree(
    key: _key,
    child: Scaffold(
      body: Center(
        child: Chip(
          value: context.knobs.boolean(label: 'Checked', initialValue: true),
          onChanged: (value) => knobState.updateKnob('Checked', value),
          variants: [
            context.knobs.variant(FortalezaChipStyle.variants),
          ],
          label: context.knobs.string(
            label: 'Label',
            initialValue: 'Chip',
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
        ),
      ),
    ),
  );
}
