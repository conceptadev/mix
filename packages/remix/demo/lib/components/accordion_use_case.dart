import 'package:demo/addons/icon_data_knob.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Accordion Component',
  type: XAccordion,
)
Widget buildAccordionUseCase(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 300,
      child: XAccordion(
        header: (context, spec) => RxAccordionHeaderSpecWidget(
          title: context.knobs.string(
            label: 'Title',
            initialValue: 'Title',
          ),
          leadingIcon: context.knobs.iconData(
            label: 'Leading Icon',
          ),
          trailingIcon: context.knobs.list(
            label: 'Trailing Icon',
            initialOption: Icons.keyboard_arrow_down_rounded,
            options: [
              Icons.keyboard_arrow_down_rounded,
            ],
          ),
          spec: spec,
        ),
        initiallyExpanded: true,
        content: (_, spec) => TextSpecWidget(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
          spec: spec,
        ),
      ),
    ),
  );
}
