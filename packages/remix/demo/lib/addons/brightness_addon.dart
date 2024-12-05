import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class WidgetBookBrightness {
  static const light = 'light';
  static const dark = 'dark';
}

class BrightnessAddon extends WidgetbookAddon<String> {
  final String initialBrightness;

  BrightnessAddon({
    this.initialBrightness = WidgetBookBrightness.light,
  }) : super(name: 'brightness');

  @override
  Widget buildUseCase(
    BuildContext context,
    Widget child,
    String setting,
  ) {
    return MediaQuery(
      data: MediaQueryData(
        platformBrightness: setting == WidgetBookBrightness.light
            ? Brightness.light
            : Brightness.dark,
      ),
      child: child,
    );
  }

  @override
  List<Field<String>> get fields {
    return [
      ListField<String>(
        name: 'brightness',
        initialValue: initialBrightness,
        values: [
          WidgetBookBrightness.light,
          WidgetBookBrightness.dark,
        ],
      )
    ];
  }

  @override
  String valueFromQueryGroup(Map<String, String> group) {
    return valueOf<String>('brightness', group)!;
  }
}

class BrightnessAddonConfig extends AddonConfig {
  const BrightnessAddonConfig(String value)
      : super(
          'brightness',
          'brightness:$value',
        );
}
