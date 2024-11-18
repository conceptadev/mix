import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';
import 'package:remix/themes/fortaleza.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Progress Component',
  type: Progress,
)
Widget buildProgressUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: SizedBox(
        width: 200,
        child: Progress(
          variants: [
            context.knobs.variant(FortalezaProgressStyle.variants),
          ],
          value: context.knobs.double.slider(
            label: 'value',
            min: 0,
            max: 1,
            initialValue: 0.5,
          ),
        ),
      ),
    ),
  );
}
