import 'package:flutter/material.dart';
import 'package:remix/remix.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Callout Component',
  type: XCallout,
)
Widget buildCalloutUseCase(BuildContext context) {
  return KeyedSubtree(
    key: _key,
    child: const Center(
      child: SizedBox(
        width: 300,
        child: XCallout(
          icon: Icons.info,
          text: 'Lucas',
        ),
      ),
    ),
  );
}
