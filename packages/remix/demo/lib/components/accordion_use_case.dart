import 'package:demo/addons/icon_data_knob.dart';
import 'package:demo/helpers/use_case_state.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _accordionKey = GlobalKey();

@widgetbook.UseCase(
  name: 'Accordion Component',
  type: Accordion,
)
Widget buildAccordionUseCase(BuildContext context) {
  final knobState = WidgetbookState.of(context);

  return Scaffold(
    body: Center(
      child: SizedBox(
        width: 300,
        child: Accordion(
          key: _accordionKey,
          header: (spec) => AccordionHeaderSpecWidget(
            title: context.knobs.string(
              label: 'Title',
              initialValue: 'Title',
            ),
            leadingIcon: context.knobs.iconData(
              label: 'Leading Icon',
            ),
            trailingIcon: context.knobs.list(
              label: 'Trailing Icon',
              initialOption: m.Icons.keyboard_arrow_down_rounded,
              options: [
                m.Icons.keyboard_arrow_down_rounded,
              ],
            ),
            spec: spec,
          ),
          expanded:
              context.knobs.boolean(label: 'Expanded', initialValue: true),
          content: const StyledText(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
          ),
          onChanged: (value) {
            knobState.updateKnob('Expanded', !value);
          },
        ),
      ),
    ),
  );
}
