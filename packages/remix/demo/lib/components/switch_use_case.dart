import 'package:demo/helpers/knob_builder.dart';
import 'package:demo/helpers/use_case_state.dart';
import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';
import 'package:remix/themes/fortaleza.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Switch Component',
  type: Switch,
)
Widget buildSwitchUseCase(BuildContext context) {
  final knobState = WidgetbookState.of(context);

  return KeyedSubtree(
    key: _key,
    child: Scaffold(
      body: Center(
        child: Switch(
          variants: [context.knobs.variant(FortalezaSwitchStyle.variants)],
          value: context.knobs.boolean(label: 'Toggle', initialValue: true),
          disabled:
              context.knobs.boolean(label: 'Disabled', initialValue: false),
          onChanged: (value) => knobState.updateKnob('Toggle', value),
        ),
      ),
    ),
  );
}
