import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Select Component',
  type: Select,
)
Widget buildSelect(BuildContext context) {
  return const SelectDemo();
}

class SelectDemo extends StatefulWidget {
  const SelectDemo({
    super.key,
  });

  @override
  State<SelectDemo> createState() => _SelectDemoState();
}

class _SelectDemoState extends State<SelectDemo> {
  String selectedValue = 'Apple';

  final List<String> items = ['Apple Fiji', 'Banana', 'Orange'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 200,
            child: Select<String>(
              disabled:
                  context.knobs.boolean(label: 'disabled', initialValue: false),
              variants: [context.knobs.variant(FortalezaSelectStyle.variants)],
              value: selectedValue,
              onChanged: (value) => setState(() => selectedValue = value),
              button: (spec) => spec(
                text: selectedValue,
                trailingIcon: Icons.keyboard_arrow_down_rounded,
              ),
              items: List.generate(
                items.length,
                (index) => SelectMenuItem<String>(
                  value: items[index],
                  child: XSelectMenuItemWidget(
                    text: items[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
