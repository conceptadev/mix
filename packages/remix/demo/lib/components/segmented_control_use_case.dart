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
      style: Style(
        $segmentedControl.chain
          ..flex.row()
          ..flex.mainAxisSize.min()
          ..container.color.white.withAlpha(30)
          ..container.padding.all(4)
          ..container.borderRadius.all(8),
        $segmentedControl.item.chain
          ..label.style.color.white()
          ..label.style.fontSize(12)
          ..icon.color.white()
          ..icon.size(20)
          ..container.padding.vertical(6)
          ..container.padding.horizontal(12)
          ..container.borderRadius.all(6),
        // $on.hover(
        //   $segmentedControl.item.chain
        //     ..container.color.black.withAlpha(180)
        //     ..label.style.color.white()
        //     ..icon.color.white(),
        // ),
        selectedItem(
          $segmentedControl.item.chain
            ..container.color.black()
            ..label.style.color.white(),
        ),
      ),
      buttons: const [
        SegmentedControlItemWidget(
          icon: CupertinoIcons.bold,
        ),
        SegmentedControlItemWidget(
          icon: CupertinoIcons.italic,
        ),
        SegmentedControlItemWidget(
          icon: CupertinoIcons.underline,
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
