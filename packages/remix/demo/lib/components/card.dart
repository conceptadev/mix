import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixCard,
)
Widget buildCheckboxUseCase(BuildContext context) {
  return const Center(
    child: SizedBox(
      width: 300,
      child: RemixCard(
        child: RemixListTile(
          leading: RemixAvatar(
            fallbackLabel: 'LF',
          ),
          title: 'Title',
          subtitle: 'Subtitle',
        ),
      ),
    ),
  );
}
