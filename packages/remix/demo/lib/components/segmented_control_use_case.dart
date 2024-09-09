import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'SegmentedControl Component',
  type: XSegmentedControl,
)
Widget buildAccordionUseCase(BuildContext context) {
  return const Center(
    child: _WidgetDemo(),
  );
}

class _WidgetDemo extends StatefulWidget {
  const _WidgetDemo({
    super.key,
  });

  @override
  State<_WidgetDemo> createState() => _WidgetDemoState();
}

class _WidgetDemoState extends State<_WidgetDemo> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return XSegmentedControl(
      index: index,
      buttons: const [
        XSegmentButton(
          text: 'Apple',
        ),
        XSegmentButton(
          text: 'Pear',
        ),
        XSegmentButton(
          text: 'Banana',
        ),
      ],
      onIndexChanged: (i) {
        setState(() {
          index = i;
        });
      },
    );
  }
}
