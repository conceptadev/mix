import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Divider Component',
  type: Divider,
)
Widget buildDivider(BuildContext context) {
  return Center(
    child: SizedBox(
      height: 200,
      width: 200,
      child: Center(
        child: Divider(
          axis: context.knobs.list(
            label: 'Axis',
            options: [Axis.horizontal, Axis.vertical],
          ),
          child: const StyledText('Divider'),
        ),
      ),
    ),
  );
}
