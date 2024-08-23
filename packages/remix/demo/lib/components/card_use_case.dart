import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Card Component',
  type: XCard,
)
Widget buildCard(BuildContext context) {
  return const Center(
    child: XCard(
      children: [
        SizedBox(
          height: 50,
          width: 50,
        )
      ],
    ),
  );
}
