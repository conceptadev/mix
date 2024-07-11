import 'package:flutter/material.dart';
import 'package:remix/components/callout/callout_variants.dart';
import 'package:remix/components/callout/callout_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Callout Component',
  type: RxCallout,
)
Widget buildCalloutUseCase(BuildContext context) {
  Widget buildCallout(CalloutVariant variant) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(variant.label),
        const SizedBox(height: 10),
        RxCallout(
          icon: context.knobs.list(
            label: 'Icon',
            options: [
              Icons.info,
              Icons.warning,
              Icons.error,
              Icons.check_circle,
            ],
            initialOption: Icons.info,
            labelBuilder: (value) => value.toString().split('.').last,
          ),
          variant: variant,
          text: context.knobs.string(
            label: 'Text',
            initialValue: 'Content for the callout goes here',
          ),
        ),
      ],
    );
  }

  return KeyedSubtree(
    key: _key,
    child: Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: CalloutVariant.values.map(buildCallout).toList(),
        ),
      ],
    ),
  );
}
