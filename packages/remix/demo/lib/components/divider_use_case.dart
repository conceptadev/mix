import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Divider Component',
  type: XDivider,
)
Widget buildDivider(BuildContext context) {
  return Center(
    child: SizedBox(
      height: 100,
      width: 100,
      child: Center(
        child: XDivider(
          axis: context.knobs.list(
            label: 'Axis',
            options: [Axis.horizontal, Axis.vertical],
          ),
        ),
      ),
    ),
  );
}
