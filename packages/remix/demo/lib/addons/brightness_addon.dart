import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class BrightnessAddon extends WidgetbookAddon<Brightness> {
  final Brightness initialBrightness;

  BrightnessAddon({
    this.initialBrightness = Brightness.light,
  }) : super(name: 'Brightness');

  @override
  Widget buildUseCase(
    BuildContext context,
    Widget child,
    Brightness setting,
  ) {
    return Theme(
      data: ThemeData(
        brightness: setting,
      ),
      child: child,
    );
  }

  @override
  List<Field<Brightness>> get fields {
    return [
      ListField<Brightness>(
        name: 'brightness',
        initialValue: initialBrightness,
        values: [
          Brightness.light,
          Brightness.dark,
        ],
      )
    ];
  }

  @override
  Brightness valueFromQueryGroup(Map<String, String> group) {
    return valueOf<Brightness>('brightness', group)!;
  }
}
