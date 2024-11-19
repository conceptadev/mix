import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';
import 'package:remix/themes/fortaleza.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Badge Component',
  type: Badge,
)
Widget buildAvatarUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Badge(
        label: context.knobs.string(
          label: 'Label',
          initialValue: 'New',
        ),
        variants: [
          context.knobs.variant(FortalezaBadgeStyle.variants),
        ],
      ),
    ),
  );
}
