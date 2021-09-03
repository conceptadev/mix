import 'package:flutter/material.dart';
import 'package:mix/src/attributes/base_attribute.dart';
import 'package:mix/src/helpers/extensions.dart';

class DarkModeUtility {
  const DarkModeUtility();
  DarkModeAttribute call(Attribute attribute) => DarkModeAttribute(attribute);
}

class DarkModeAttribute extends DynamicAttribute {
  const DarkModeAttribute(Attribute attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    return context.isDarkMode;
  }
}
