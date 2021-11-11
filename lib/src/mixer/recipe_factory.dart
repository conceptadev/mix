import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.attributes.dart';
import 'package:mix/src/attributes/common/common.attributes.dart';
import 'package:mix/src/attributes/directives/text_directive.dart';
import 'package:mix/src/attributes/flex/flex.attributes.dart';
import 'package:mix/src/attributes/icon/icon.attributes.dart';
import 'package:mix/src/attributes/text/text.attributes.dart';

import '../../mix.dart';
import '../attributes/attribute.dart';

/// Recipe
class Recipe {
  BoxAttributes box;
  TextAttributes text;
  CommonAttributes animation;
  IconAttributes icon;
  FlexAttributes flex;

  List<DynamicAttribute> dynamicProps;
  List<DirectiveAttribute> directives;

  Recipe._({
    required this.box,
    required this.text,
    required this.animation,
    required this.directives,
    required this.dynamicProps,
    required this.icon,
    required this.flex,
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
      boxProps: other.box,
      textProps: other.text,
      dynamicProps: other.dynamicProps,
    );
  }

  Recipe copyWith({
    BoxAttributes boxProps = const BoxAttributes(),
    TextAttributes textProps = const TextAttributes(),
    CommonAttributes animationProps = const CommonAttributes(),
    IconAttributes iconProps = const IconAttributes(),
    FlexAttributes flexProps = const FlexAttributes(),
    List<DynamicAttribute> dynamicProps = const [],
    List<DirectiveAttribute> directives = const [],
  }) {
    return Recipe._(
      box: box.merge(boxProps),
      text: text.merge(textProps),
      animation: animation.merge(animationProps),
      dynamicProps: this.dynamicProps..addAll(dynamicProps),
      directives: this.directives..addAll(directives),
      icon: icon.merge(iconProps),
      flex: flex.merge(flexProps),
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

  factory Recipe.fromList(List<Attribute> attributes) {
    var boxAttributes = const BoxAttributes();
    var textAttributes = const TextAttributes();
    var iconAttributes = const IconAttributes();
    var flexAttributes = const FlexAttributes();
    const animationAttributes = CommonAttributes();
    final dynamicAttributes = <DynamicAttribute>[];
    final directiveAttributes = <DirectiveAttribute>[];

    for (final attribute in attributes) {
      if (attribute is DynamicAttribute) {
        dynamicAttributes.add(attribute);
      }

      if (attribute is DirectiveAttribute) {
        directiveAttributes.add(attribute);
      }

      if (attribute is CommonAttributes) {
        animationAttributes.merge(attribute);
      }

      if (attribute is TextAttributes) {
        textAttributes = textAttributes.merge(attribute);
      }

      if (attribute is BoxAttributes) {
        boxAttributes = boxAttributes.merge(attribute);
      }

      if (attribute is IconAttributes) {
        iconAttributes = iconAttributes.merge(attribute);
      }

      if (attribute is FlexAttributes) {
        flexAttributes = flexAttributes.merge(attribute);
      }
    }

    return Recipe._(
      box: boxAttributes,
      text: textAttributes,
      dynamicProps: dynamicAttributes,
      animation: animationAttributes,
      directives: directiveAttributes,
      icon: iconAttributes,
      flex: flexAttributes,
    );
  }
}
