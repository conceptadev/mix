import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../helpers/knob_builder.dart';

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Button Component',
  type: IconButton,
)
Widget buildButtonUseCase(BuildContext context) {
  return KeyedSubtree(
    key: _key,
    child: Wrap(
      spacing: 12,
      children: [
        RepaintBoundary(
          child: IconButton(
            m.Icons.add,
            variants: [
              context.knobs.variant(FortalezaIconButtonStyle.variants),
            ],
            onPressed: () {},
            disabled: context.knobs.boolean(
              label: 'Disabled',
              initialValue: false,
            ),
            loading: context.knobs.boolean(
              label: 'loading',
              initialValue: false,
            ),
          ),
        )
      ],
    ),
  );
}
