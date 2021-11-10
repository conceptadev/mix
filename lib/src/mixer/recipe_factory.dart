import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.attributes.dart';
import 'package:mix/src/attributes/directives/text_directive.dart';
import 'package:mix/src/attributes/text/text.attributes.dart';
import 'package:mix/src/attributes/widget_attributes.dart';

import '../../mix.dart';
import '../attributes/attribute.dart';

/// Recipe
class Recipe {
  BoxAttributes boxProps;
  TextAttributes textProps;
  WidgetAttributes widgetProps;

  List<DynamicAttribute> dynamicProps;
  List<DirectiveAttribute> directives;

  Recipe._({
    required this.boxProps,
    required this.textProps,
    required this.widgetProps,
    required this.directives,
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
    BoxAttributes boxProps = const BoxAttributes(),
    TextAttributes textProps = const TextAttributes(),
    WidgetAttributes widgetProps = const WidgetAttributes(),
    List<DynamicAttribute> dynamicProps = const [],
    List<DirectiveAttribute> directives = const [],
  }) {
    return Recipe._(
      boxProps: this.boxProps.merge(boxProps),
      textProps: this.textProps.merge(textProps),
      widgetProps: this.widgetProps.merge(widgetProps),
      dynamicProps: this.dynamicProps..addAll(dynamicProps),
      directives: this.directives..addAll(directives),
    );
  }

  /// Applies all [TextDirectiveAttribute] to [text]
  String applyTextDirectives(String text) {
    final textDirectives = directives.whereType<TextDirectiveAttribute>();

    if (textDirectives.isEmpty) {
      return text;
    }

    String modifiedText = text;

    for (final attr in textDirectives) {
      modifiedText = attr.modify(modifiedText);
    }

    return modifiedText;
  }

  factory Recipe.build(BuildContext context, Mix mix) {
    final mixer = Recipe.fromList(mix.props);
    return mixer._applyDynamicProperties(context);
  }

  factory Recipe.fromList(List<Attribute> props) {
    var boxProps = const BoxAttributes();
    var textProps = const TextAttributes();
    const widgetProps = WidgetAttributes();
    final dynamicProps = <DynamicAttribute>[];
    final directives = <DirectiveAttribute>[];

    for (final prop in props) {
      if (prop is DynamicAttribute) {
        dynamicProps.add(prop);
      }

      if (prop is DynamicAttribute) {
        dynamicProps.add(prop);
      }

      if (prop is WidgetAttributes) {
        widgetProps.merge(prop);
      }

      if (prop is TextAttributes) {
        textProps = textProps.merge(prop);
      }

      if (prop is BoxAttributes) {
        boxProps = boxProps.merge(prop);
      }
    }

    return Recipe._(
      boxProps: boxProps,
      textProps: textProps,
      dynamicProps: dynamicProps,
      widgetProps: widgetProps,
      directives: directives,
    );
  }
}
