import 'package:flutter/material.dart';
import 'package:mix/src/attributes/primitives/box/box.properties.dart';
import 'package:mix/src/attributes/primitives/text/text.properties.dart';
import 'package:mix/src/attributes/primitives/widget_attributes.dart';
import 'package:mix/src/directives/text_directive.dart';

import '../../mix.dart';
import '../attributes/base_attribute.dart';

/// Recipe
class Recipe {
  BoxProperties boxProps;
  TextProperties textProps;
  WidgetProperties widgetProps;
  List<DynamicAttribute> dynamicProps;
  // List<TextDirectiveAttribute> textDirectiveAttributes;

  Recipe._({
    required this.boxProps,
    required this.textProps,
    required this.widgetProps,
    // required this.textDirectiveAttributes,
    required this.dynamicProps,
  });

  /// Applies `DynamicAttribute` based on context
  Recipe _applyDynamicProperties(BuildContext context) {
    final dynamicList = dynamicProps;

    if (dynamicList.isEmpty) {
      return this;
    }

    final propsToApply = <Attribute>[];

    for (final attr in dynamicList) {
      if (attr.shouldApply(context)) {
        propsToApply.add(attr.attribute);
      }
    }

    final dynamicMixer = Recipe.fromList(propsToApply);

    return merge(dynamicMixer);
  }

  Recipe merge(Recipe other) {
    return copyWith(
      boxProps: other.boxProps,
      textProps: other.textProps,
      dynamicProps: other.dynamicProps,
    );
  }

  Recipe copyWith({
    BoxProperties boxProps = const BoxProperties(),
    TextProperties textProps = const TextProperties(),
    WidgetProperties widgetProps = const WidgetProperties(),
    List<DynamicAttribute> dynamicProps = const [],
    List<TextDirectiveAttribute> textDirectiveAttributes = const [],
  }) {
    return Recipe._(
      boxProps: this.boxProps.merge(boxProps),
      textProps: this.textProps.merge(textProps),
      widgetProps: this.widgetProps.merge(widgetProps),
      dynamicProps: this.dynamicProps..addAll(dynamicProps),
    );
  }

  // /// Applies all [TextModifierAttributes] to [text]
  // String applyTextModifiers(String text) {
  //   final modifierList = textDirectiveAttributes;

  //   if (modifierList.isEmpty) {
  //     return text;
  //   }

  //   String modifiedText = text;

  //   for (final attr in modifierList) {
  //     modifiedText = attr.modify(modifiedText);
  //   }

  //   return modifiedText;
  // }

  factory Recipe.build(BuildContext context, Mix mix) {
    final mixer = Recipe.fromList(mix.props);
    return mixer._applyDynamicProperties(context);
  }

  factory Recipe.fromList(List<Attribute> props) {
    var boxProps = const BoxProperties();
    var textProps = const TextProperties();
    const widgetProps = WidgetProperties();
    final dynamicProps = <DynamicAttribute>[];

    for (final prop in props) {
      if (prop is DynamicAttribute) {
        dynamicProps.add(prop);
      }

      if (prop is WidgetProperties) {
        widgetProps.merge(prop);
      }

      if (prop is TextProperties) {
        textProps = textProps.merge(prop);
      }

      if (prop is BoxProperties) {
        boxProps = boxProps.merge(prop);
      }
    }

    return Recipe._(
      boxProps: boxProps,
      textProps: textProps,
      dynamicProps: dynamicProps,
      widgetProps: widgetProps,
    );
  }
}
