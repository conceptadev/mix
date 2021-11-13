import 'package:flutter/material.dart';
import 'package:mix/src/attributes/icon/icon.attributes.dart';
import 'package:mix/src/attributes/text/text.attributes.dart';

import '../../mix.dart';
import '../attributes/box/box.attributes.dart';
import '../attributes/common/attribute.dart';
import '../attributes/directives/directive.attributes.dart';
import '../attributes/flex/flex.attributes.dart';
import '../attributes/shared/shared.attributes.dart';

/// Recipe
class Mixer {
  BoxAttributes box;
  TextAttributes text;
  SharedAttributes common;
  IconAttributes icon;
  FlexAttributes flex;

  List<DynamicAttribute> dynamicProps;
  List<DirectiveAttribute> directives;

  Mixer._({
    required this.box,
    required this.text,
    required this.common,
    required this.directives,
    required this.dynamicProps,
    required this.icon,
    required this.flex,
  });

  /// Applies `DynamicAttribute` based on context
  Mixer _applyDynamicProperties(BuildContext context) {
    final dynamicList = dynamicProps;

    if (dynamicList.isEmpty) {
      return this;
    }

    final propsToApply = <Attribute>[];

    for (final attr in dynamicList) {
      if (attr.shouldApply(context)) {
        propsToApply.addAll(attr.attributes);
      }
    }

    final dynamicMixer = Mixer.fromList(propsToApply);

    return merge(dynamicMixer);
  }

  Mixer merge(Mixer other) {
    return copyWith(
      boxProps: other.box,
      textProps: other.text,
      dynamicProps: other.dynamicProps,
    );
  }

  Mixer copyWith({
    BoxAttributes boxProps = const BoxAttributes(),
    TextAttributes textProps = const TextAttributes(),
    SharedAttributes commonProps = const SharedAttributes(),
    IconAttributes iconProps = const IconAttributes(),
    FlexAttributes flexProps = const FlexAttributes(),
    List<DynamicAttribute> dynamicProps = const [],
    List<DirectiveAttribute> directives = const [],
  }) {
    return Mixer._(
      box: box.merge(boxProps),
      text: text.merge(textProps),
      common: common.merge(commonProps),
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

  factory Mixer.build(BuildContext context, Mix mix) {
    final mixer = Mixer.fromList(mix.attributes);
    return mixer._applyDynamicProperties(context);
  }

  factory Mixer.fromList(List<Attribute> attributes) {
    var boxAttributes = const BoxAttributes();
    var textAttributes = const TextAttributes();
    var iconAttributes = const IconAttributes();
    var flexAttributes = const FlexAttributes();
    var commonAttributes = const SharedAttributes();
    final dynamicAttributes = <DynamicAttribute>[];
    final directiveAttributes = <DirectiveAttribute>[];

    for (final attribute in attributes) {
      if (attribute is DynamicAttribute) {
        dynamicAttributes.add(attribute);
      }

      if (attribute is DirectiveAttribute) {
        directiveAttributes.add(attribute);
      }

      if (attribute is SharedAttributes) {
        commonAttributes = commonAttributes.merge(attribute);
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

    return Mixer._(
      box: boxAttributes,
      text: textAttributes,
      dynamicProps: dynamicAttributes,
      common: commonAttributes,
      directives: directiveAttributes,
      icon: iconAttributes,
      flex: flexAttributes,
    );
  }
}
