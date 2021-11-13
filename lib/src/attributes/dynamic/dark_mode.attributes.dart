import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/helpers/extensions.dart';

class DarkModeAttribute extends DynamicAttribute {
  const DarkModeAttribute(List<Attribute> attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    return context.isDarkMode();
  }
}
