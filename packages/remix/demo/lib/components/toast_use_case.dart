import 'package:demo/addons/icon_data_knob.dart';
import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Toast Component',
  type: Toast,
)
Widget buildButtonUseCase(BuildContext context) {
  return KeyedSubtree(
    key: _key,
    child: Scaffold(
      body: Builder(builder: (context) {
        return Center(
          child: Button(
            variants: [
              context.knobs.variant(FortalezaButtonStyle.variants),
            ],
            label: 'Show toast',
            onPressed: () {
              showToast(
                context: context,
                entry: ToastEntry(
                  showDuration: const Duration(seconds: 2),
                  alignment: Alignment.topCenter,
                  builder: (context, entry) => const Toast(
                    title: 'Toast',
                  ),
                ),
              );
            },
          ),
        );
      }),
    ),
  );
}
