import 'package:flutter/material.dart';
import 'package:mix/src/attributes/widgets/icon/icon.attributes.dart';
import 'package:mix/src/attributes/widgets/text/text.attributes.dart';

import '../../mix.dart';
import '../attributes/attribute.dart';
import '../attributes/directives/directive.attributes.dart';
import '../attributes/widgets/box/box.attributes.dart';
import '../attributes/widgets/common/common.attributes.dart';
import '../attributes/widgets/flex/flex.attributes.dart';

/// Recipe
class Mixer {
  BoxAttributes box;
  TextAttributes text;
  CommonAttributes common;
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
        propsToApply.add(attr.attribute);
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
    CommonAttributes commonProps = const CommonAttributes(),
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
    var commonAttributes = const CommonAttributes();
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
