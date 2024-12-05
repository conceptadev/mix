import 'package:demo/addons/icon_data_knob.dart';
import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/widgets.dart';
import 'package:remix/remix.dart';
import 'package:remix/themes/fortaleza.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Button Component',
  type: Button,
)
Widget buildButtonUseCase(BuildContext context) {
  return KeyedSubtree(
    key: _key,
    child: Scaffold(
      body: Center(
        child: Builder(builder: (context) {
          return Button(
            variants: [
              context.knobs.variant(FortalezaButtonStyle.variants),
            ],
            label: context.knobs.string(
              label: 'Title',
              initialValue: 'Button',
            ),
            onPressed: () {
              showToast(
                context: context,
                entry: ToastEntry(
                  showDuration: const Duration(milliseconds: 800),
                  builder: (context, actions) => const Toast(
                    title: 'Button pressed',
                  ),
                ),
              );
            },
            disabled: context.knobs.boolean(
              label: 'Disabled',
              initialValue: false,
            ),
            loading: context.knobs.boolean(
              label: 'loading',
              initialValue: false,
            ),
            iconLeft: context.knobs.iconData(
              label: 'Icon left',
              initialValue: null,
            ),
            iconRight: context.knobs.iconData(
              label: 'Icon right',
              initialValue: null,
            ),
          );
        }),
      ),
    ),
  );
}
