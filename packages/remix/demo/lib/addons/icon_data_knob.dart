import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

enum IconDataEnum {
  none,
  home,
  settings,
  favorite,
  add,
  delete,
}

class IconDataKnob extends Knob<IconData?> {
  IconDataKnob({
    required super.label,
    super.initialValue,
  });

  @override
  List<Field> get fields => [
        ListField<IconDataEnum>(
          name: label,
          initialValue: IconDataEnum.none,
          labelBuilder: (value) => value.name,
          values: IconDataEnum.values,
        ),
      ];

  @override
  IconData? valueFromQueryGroup(Map<String, String> group) {
    final iconDataString = group[label];
    if (iconDataString != null) {
      final iconDataEnum = IconDataEnum.values.firstWhere(
        (e) => e.toString() == 'IconDataEnum.$iconDataString',
        orElse: () => IconDataEnum.home,
      );
      return _iconDataFromEnum(iconDataEnum);
    }
    return null;
  }

  IconData? _iconDataFromEnum(IconDataEnum iconDataEnum) {
    return switch (iconDataEnum) {
      IconDataEnum.home => Icons.home,
      IconDataEnum.settings => Icons.settings,
      IconDataEnum.favorite => Icons.favorite,
      IconDataEnum.add => Icons.add,
      IconDataEnum.delete => Icons.delete,
      IconDataEnum.none => null,
    };
  }
}

extension IconDataKnobBuilder on KnobsBuilder {
  IconData? iconData({
    required String label,
    IconData? initialValue,
  }) =>
      onKnobAdded(
        IconDataKnob(
          label: label,
          initialValue: initialValue,
        ),
      );
}
