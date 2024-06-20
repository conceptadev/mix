import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixAlert,
)
Widget buildCheckboxUseCase(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 300,
      child: RemixAlert(
        title: context.knobs.string(
          label: 'Title',
          initialValue: 'Error',
        ),
        subtitle: context.knobs.string(
          label: 'Subtitle',
          initialValue: 'Your session has expired. Please log in again.',
        ),
        icon: context.knobs.boolean(
          label: 'icon',
          initialValue: false,
        )
            ? Icons.warning_amber_rounded
            : null,
      ),
    ),
  );
}
