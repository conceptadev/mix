import 'package:flutter/widgets.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/attributes/nested_attribute.dart';
import 'package:mix/src/variants/variant_attribute.dart';
import 'package:mix/src/variants/variants.dart';

List<Attribute> expandNestedAttributes(List<Attribute> attributes) {
  List<Attribute> _expanded = [];

  for (final attribute in attributes) {
    if (attribute is NestedAttribute) {
      _expanded.addAll(
        expandNestedAttributes(attribute.values),
      );
    } else if (attribute is VariantAttribute) {
      _expanded.add(
        VariantAttribute(
          attribute.variant,
          expandNestedAttributes(attribute.values),
        ),
      );
    } else {
      _expanded.add(attribute);
    }
  }

  return _expanded;
}

List<Attribute> selectVariantsToApply(
  BuildContext context,
  List<Variant> selectedVariants,
  List<Attribute> attributes,
) {
  List<Attribute> _expanded = [];

  for (final attribute in attributes) {
    if (attribute is VariantAttribute) {
      final shouldApply = selectedVariants.contains(attribute.variant) ||
          attribute.shouldApply(context);
      // If it's inverse (from `not(variant)`), only apply if [willApply] is
      // false. Otherwise, apply only when [willApply]
      final willApply = attribute.variant.inverse ? !shouldApply : shouldApply;
      if (willApply) {
        // If its selected, add it to the list
        _expanded.addAll(selectVariantsToApply(
          context,
          selectedVariants,
          attribute.values,
        ));
      } else {
        // If not selected, add it to the list for future use
        _expanded.add(attribute);
      }
    } else {
      _expanded.add(attribute);
    }
  }
  return _expanded;
}
