import 'package:flutter/material.dart';
import 'package:mix/src/attributes/dynamic/pressable_attributes.dart';
import 'package:mix/src/attributes/primitives/box/box_attributes.dart';
import 'package:mix/src/attributes/primitives/text/text_attributes.dart';
import 'package:mix/src/directives/text_directive.dart';

import '../../mix.dart';
import '../attributes/base_attribute.dart';

/// Mixer
class Mixer {
  BoxAttribute boxAttribute;
  List<DynamicAttribute> dynamicAttributes;
  List<TextDirectiveAttribute> textDirectiveAttributes;
  TextAttribute textAttribute;
  List<FocusedAttribute> focusedAttributes;
  List<HoveringAttribute> hoveringAttributes;
  List<PressingAttribute> pressingAttributes;
  List<DisabledAttribute> disabledAttribute;

  Mixer._({
    this.boxAttribute = const BoxAttribute(),
    this.textAttribute = const TextAttribute(),
    this.textDirectiveAttributes = const [],
    this.dynamicAttributes = const [],
    this.focusedAttributes = const [],
    this.hoveringAttributes = const [],
    this.pressingAttributes = const [],
    this.disabledAttribute = const [],
  });

  /// Applies `DynamicAttribute` based on context
  Mixer _applyDynamicAttributes(BuildContext context) {
    final dynamicList = dynamicAttributes;

    if (dynamicList.isEmpty) {
      return this;
    }

    final attributesToApply = <Attribute>[];

    for (final attr in dynamicList) {
      if (attr.shouldApply(context)) {
        attributesToApply.add(attr.value);
      }
    }

    final dynamicMixer = Mixer.fromList(attributesToApply);

    return merge(dynamicMixer);
  }

  Mixer merge(Mixer other) {
    return copyWith(
      boxAttribute: other.boxAttribute,
      textAttribute: other.textAttribute,
      textDirectiveAttributes: other.textDirectiveAttributes,
      dynamicAttributes: other.dynamicAttributes,
    );
  }

  Mixer copyWith({
    BoxAttribute boxAttribute = const BoxAttribute(),
    TextAttribute textAttribute = const TextAttribute(),
    List<DynamicAttribute> dynamicAttributes = const [],
    List<TextDirectiveAttribute> textDirectiveAttributes = const [],
  }) {
    return Mixer._(
      boxAttribute: this.boxAttribute.merge(boxAttribute),
      textAttribute: this.textAttribute.merge(textAttribute),
      textDirectiveAttributes: this.textDirectiveAttributes
        ..addAll(textDirectiveAttributes),
      dynamicAttributes: this.dynamicAttributes..addAll(dynamicAttributes),
    );
  }

  /// Applies all [TextModifierAttributes] to [text]
  String applyTextModifiers(String text) {
    final modifierList = textDirectiveAttributes;

    if (modifierList.isEmpty) {
      return text;
    }

    String modifiedText = text;

    for (final attr in modifierList) {
      modifiedText = attr.modify(modifiedText);
    }

    return modifiedText;
  }

  factory Mixer.build(BuildContext context, Mix mix) {
    final mixer = Mixer.fromList(mix.params);
    return mixer._applyDynamicAttributes(context);
  }

  factory Mixer.fromList(List<Attribute> attributes) {
    var boxAttribute = const BoxAttribute();
    var textAttribute = const TextAttribute();
    final dynamicAttributes = <DynamicAttribute>[];
    final textDirectiveAttributes = <TextDirectiveAttribute>[];

    final focusedAttributes = <FocusedAttribute>[];
    final hoveringAttributes = <HoveringAttribute>[];
    final pressingAttributes = <PressingAttribute>[];
    final disabledAttribute = <DisabledAttribute>[];

    for (final attribute in attributes) {
      if (attribute is DynamicAttribute) {
        dynamicAttributes.add(attribute);
      }

      if (attribute is TextDirectiveAttribute) {
        textDirectiveAttributes.add(attribute);
      }

      if (attribute is TextAttribute) {
        textAttribute = textAttribute.merge(attribute);
      }

      if (attribute is BoxAttribute) {
        boxAttribute = boxAttribute.merge(attribute);
      }
      if (attribute is FocusedAttribute) {
        focusedAttributes.add(attribute);
      }

      if (attribute is HoveringAttribute) {
        hoveringAttributes.add(attribute);
      }

      if (attribute is PressingAttribute) {
        pressingAttributes.add(attribute);
      }

      if (attribute is DisabledAttribute) {
        disabledAttribute.add(attribute);
      }
    }

    return Mixer._(
      boxAttribute: boxAttribute,
      textAttribute: textAttribute,
      textDirectiveAttributes: textDirectiveAttributes,
      dynamicAttributes: dynamicAttributes,
    );
  }
}
