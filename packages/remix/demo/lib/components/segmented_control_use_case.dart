import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'SegmentedControl Component',
  type: XSegmentedControl,
)
Widget buildAccordionUseCase(BuildContext context) {
  return Center(
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
      style: XSegmentedControlStyle.base,
      buttons: const [
        SegmentedControlItemWidget(
          text: 'Apple',
        ),
        SegmentedControlItemWidget(
          text: 'Pear',
        ),
        SegmentedControlItemWidget(
          text: 'Banana',
        ),
      ],
      onIndexChanged: (i) {
        print(i);
        setState(() {
          index = i;
        });
      },
    );
  }
}
