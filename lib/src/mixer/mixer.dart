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
  BoxAttributes? box;
  TextAttributes? text;
  SharedAttributes? shared;
  IconAttributes? icon;
  FlexAttributes? flex;

  List<DynamicAttribute> dynamicProps;
  List<TokenRefAttribute> tokens;
  List<DirectiveAttribute> directives;

  Mixer._({
    this.box,
    this.text,
    this.shared,
    this.icon,
    this.flex,
    this.directives = const [],
    this.dynamicProps = const [],
    this.tokens = const [],
  });

  /// Applies `DynamicAttribute` based on context
  Mixer _applyDynamicAttributes(BuildContext context) {
    final dynamicList = dynamicProps;

    if (dynamicList.isEmpty) {
      return this;
    }

    final attributesToApply = <Attribute>[];

    for (final attr in dynamicList) {
      if (attr.shouldApply(context)) {
        attributesToApply.addAll(attr.attributes);
      }
    }

    final dynamicMixer = Mixer.fromList(context, attributesToApply);

    return merge(dynamicMixer);
  }

  /// Applies [MixTheme] data
  Mixer _applyThemeData(BuildContext context) {
    return copyWith(
      boxProps: box?.applyContext(context),
    );
  }

  /// Applies `TokenAttribute` based on context
  Mixer _applyTokenAttributes(BuildContext context) {
    final tokenList = tokens;

    if (tokenList.isEmpty) {
      return this;
    }

    final attributesToApply = <Attribute>[];

    for (final attr in tokenList) {
      final mix = attr.getToken(context);
      attributesToApply.addAll(mix.attributes);
    }

    final tokenMixer = Mixer.fromList(context, attributesToApply);

    return merge(tokenMixer);
  }

  Mixer merge(Mixer other) {
    return copyWith(
      boxProps: other.box,
      textProps: other.text,
      iconProps: other.icon,
      sharedProps: other.shared,
      dynamicProps: other.dynamicProps,
      tokens: other.tokens,
      directives: other.directives,
      flexProps: other.flex,
    );
  }

  Mixer copyWith({
    BoxAttributes? boxProps,
    TextAttributes? textProps,
    SharedAttributes? sharedProps,
    IconAttributes? iconProps,
    FlexAttributes? flexProps,
    List<DynamicAttribute> dynamicProps = const [],
    List<DirectiveAttribute> directives = const [],
    List<TokenRefAttribute> tokens = const [],
  }) {
    return Mixer._(
      dynamicProps: this.dynamicProps..addAll(dynamicProps),
      directives: this.directives..addAll(directives),
      tokens: this.tokens..addAll(tokens),
      box: box?.merge(boxProps) ?? boxProps,
      text: text?.merge(textProps) ?? textProps,
      shared: shared?.merge(sharedProps) ?? sharedProps,
      icon: icon?.merge(iconProps) ?? iconProps,
      flex: flex?.merge(flexProps) ?? flexProps,
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
    return Mixer.fromList(context, mix.attributes);
  }

  factory Mixer.fromList(BuildContext context, List<Attribute> attributes) {
    BoxAttributes? boxAttributes;
    IconAttributes? iconAttributes;
    FlexAttributes? flexAttributes;
    var sharedAttributes = context.sharedAttributes();
    var textAttributes = context.textAttributes();
    final dynamicAttributes = <DynamicAttribute>[];
    final directiveAttributes = <DirectiveAttribute>[];
    final tokenRefAttributes = <TokenRefAttribute>[];

    for (final attribute in attributes) {
      if (attribute is DynamicAttribute) {
        dynamicAttributes.add(attribute);
      }

      if (attribute is DirectiveAttribute) {
        directiveAttributes.add(attribute);
      }

      if (attribute is TokenRefAttribute) {
        tokenRefAttributes.add(attribute);
      }

      if (attribute is SharedAttributes) {
        sharedAttributes ??= const SharedAttributes();
        sharedAttributes = sharedAttributes.merge(attribute);
      }

      if (attribute is TextAttributes) {
        textAttributes ??= const TextAttributes();
        textAttributes = textAttributes.merge(attribute);
      }

      if (attribute is BoxAttributes) {
        boxAttributes ??= const BoxAttributes();
        boxAttributes = boxAttributes.merge(attribute);
      }

      if (attribute is IconAttributes) {
        iconAttributes ??= const IconAttributes();
        iconAttributes = iconAttributes.merge(attribute);
      }

      if (attribute is FlexAttributes) {
        flexAttributes ??= const FlexAttributes();
        flexAttributes = flexAttributes.merge(attribute);
      }
    }

    final mixer = Mixer._(
      box: boxAttributes,
      text: textAttributes,
      dynamicProps: dynamicAttributes,
      shared: sharedAttributes,
      directives: directiveAttributes,
      icon: iconAttributes,
      flex: flexAttributes,
      tokens: tokenRefAttributes,
    );

    return mixer
        ._applyDynamicAttributes(context)
        ._applyTokenAttributes(context)
        ._applyThemeData(context);
  }
}
