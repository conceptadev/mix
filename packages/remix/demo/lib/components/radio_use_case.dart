import 'package:demo/helpers/string.dart';
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

enum Theme {
  dark,
  light,
  system,
}

@widgetbook.UseCase(
  name: 'Radio Component',
  type: XRadio,
)
Widget buildRadioUseCase(BuildContext context) {
  return const RadioExample();
}

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  Theme _theme = Theme.dark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        key: _key,
        children: <Widget>[
          for (var theme in Theme.values) ...[
            Row(
              children: [
                XRadio<Theme>(
                  value: theme,
                  groupValue: _theme,
                  onChanged: (Theme? value) {
                    setState(() {
                      _theme = value!;
                    });
                  },
                  disabled: context.knobs.boolean(
                    label: 'Disabled',
                    initialValue: false,
                  ),
                  text: theme.name.capitalize(),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ]
        ],
      ),
    );
  }
}
