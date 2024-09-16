import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Callout Component',
  type: Callout,
)
Widget buildCalloutUseCase(BuildContext context) {
  return KeyedSubtree(
    key: _key,
    child: Center(
      child: SizedBox(
        width: 300,
        child: Callout(
          variants: [
            context.knobs.variant(FortalezaCalloutStyle.variants),
          ],
          icon: Icons.info_outline,
          text: 'Lucas',
        ),
      ),
    ),
  );
}
