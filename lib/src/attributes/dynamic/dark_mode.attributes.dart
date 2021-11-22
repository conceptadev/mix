import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/dynamic/variant.attributes.dart';
import 'package:mix/src/helpers/extensions.dart';

class DarkModeAttribute extends VariantAttribute {
  const DarkModeAttribute(List<Attribute> attribute) : super('dark', attribute);
  @override
  bool shouldApply(BuildContext context) {
    return context.isDarkMode;
  }
}
