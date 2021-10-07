import 'package:flutter/material.dart';
import 'package:mix/src/attributes/base_attribute.dart';

import '../../../mix.dart';

class DarkModeUtility {
  const DarkModeUtility();
  DarkModeAttribute call(Attribute attribute) => DarkModeAttribute(attribute);
}

class DarkModeAttribute extends DynamicAttribute {
  const DarkModeAttribute(Attribute attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    return mixTheme.brightness == Brightness.dark;
    // return context.isDarkMode;
  }
}
