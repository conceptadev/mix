import 'package:flutter/material.dart';
import 'package:remix/components/radio/radio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

enum RadioType {
  solid,
  outline,
  soft,
  surface;

  RadioVariant get variant {
    switch (this) {
      case RadioType.solid:
        return RadioVariant.solid;
      case RadioType.outline:
        return RadioVariant.outline;
      case RadioType.soft:
        return RadioVariant.soft;
      case RadioType.surface:
        return RadioVariant.surface;
    }
  }
}

@widgetbook.UseCase(
  name: 'Radio Component',
  type: RxRadio,
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
  RadioType? _type = RadioType.outline;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        key: _key,
        children: <Widget>[
          for (var type in RadioType.values)
            Row(
              children: [
                RxRadio<RadioType>(
                  value: type,
                  groupValue: _type,
                  variant: type.variant,
                  onChanged: (RadioType? value) {
                    setState(() {
                      _type = value;
                    });
                  },
                  size: context.knobs.list(
                    label: 'Size',
                    options: RadioSize.values,
                    initialOption: RadioSize.medium,
                    labelBuilder: (value) => value.label,
                  ),
                  disabled: context.knobs.boolean(
                    label: 'Disabled',
                    initialValue: false,
                  ),
                ),
                const SizedBox(width: 16, height: 30),
                Text(
                  type.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
