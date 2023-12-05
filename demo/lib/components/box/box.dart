import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

StyleMix get boxDecoration {
  return StyleMix(
    text.style.of($textStyles.bodyMedium),
    text.style.bold(),
    text.style(fontSize: 16.0),
    backgroundColor.red.shade100(),
    onHover(
      backgroundColor.black(),
    ),
    padding.horizontal(15.0),
    padding.vertical(8.0),
    borderRadius(5),
  );
}

@widgetbook.UseCase(
  name: 'Box with BoxDecoration',
  type: Box,
)
Widget boxDecorationContainer(BuildContext context) {
  return const Column(
    children: [
      Box(
        child: SizedBox.square(
          dimension: 100,
        ),
      ),
    ],
  );
}
