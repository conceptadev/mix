import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixDivider,
)
Widget buildCheckboxUseCase(BuildContext context) {
  return const Center(
    child: RemixDivider(),
  );
}
