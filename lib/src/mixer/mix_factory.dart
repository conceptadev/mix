import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/dynamic/variant.attributes.dart';
import 'package:mix/src/attributes/helpers/helper.utils.dart';
import 'package:mix/src/helpers/utils.dart';
import 'package:mix/src/mixer/mixer.dart';

/// Defines a mix
class Mix<T extends Attribute> {
  final BoxAttributes? boxAttribute;
  final TextAttributes? textAttribute;
  final SharedAttributes? sharedAttribute;
  final IconAttributes? iconAttribute;
  final FlexAttributes? flexAttribute;
  final List<VariantAttribute> variantAttributes;
  final List<DynamicAttribute> dynamicAttributes;
  final List<TokenRefAttribute> tokenAttributes;
  final List<DirectiveAttribute> directives;
  final List<WidgetAttribute> widgetAttributes;

  const Mix._({
    this.boxAttribute,
    this.textAttribute,
    this.sharedAttribute,
    this.iconAttribute,
    this.flexAttribute,
    this.variantAttributes = const [],
    this.directives = const [],
    this.dynamicAttributes = const [],
    this.tokenAttributes = const [],
    this.widgetAttributes = const [],
  });

  /// Define mix with parameters
  factory Mix([
    T? p1,
    T? p2,
    T? p3,
    T? p4,
    T? p5,
    T? p6,
    T? p7,
    T? p8,
    T? p9,
    T? p10,
    T? p11,
    T? p12,
  ]) {
    final params = <T>[];
    if (p1 != null) params.add(p1);
    if (p2 != null) params.add(p2);
    if (p3 != null) params.add(p3);
    if (p4 != null) params.add(p4);
    if (p5 != null) params.add(p5);
    if (p6 != null) params.add(p6);
    if (p7 != null) params.add(p7);
    if (p8 != null) params.add(p8);
    if (p9 != null) params.add(p9);
    if (p10 != null) params.add(p10);
    if (p11 != null) params.add(p11);
    if (p12 != null) params.add(p12);

    return Mix.fromList(params);
  }

  factory Mix.fromList(List<T> attributes) {
    final combined = spreadNestedAttributes(attributes);
    BoxAttributes? boxAttributes;
    IconAttributes? iconAttributes;
    FlexAttributes? flexAttributes;
    SharedAttributes? sharedAttributes;
    TextAttributes? textAttributes;

    final dynamicAttributes = <DynamicAttribute>[];
    final directiveAttributes = <DirectiveAttribute>[];
    final tokenRefAttributes = <TokenRefAttribute>[];
    final variantAttributes = <VariantAttribute>[];
    final widgetAttributes = <WidgetAttribute>[];

    for (final attribute in combined) {
      if (attribute is DynamicAttribute) {
        dynamicAttributes.add(attribute);
      }
      if (attribute is VariantAttribute) {
        variantAttributes.add(attribute);
      }

      if (attribute is DirectiveAttribute) {
        directiveAttributes.add(attribute);
      }

      if (attribute is WidgetAttribute) {
        widgetAttributes.add(attribute);
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

    return Mix._(
      boxAttribute: boxAttributes,
      textAttribute: textAttributes,
      dynamicAttributes: dynamicAttributes,
      sharedAttribute: sharedAttributes,
      directives: directiveAttributes,
      iconAttribute: iconAttributes,
      flexAttribute: flexAttributes,
      tokenAttributes: tokenRefAttributes,
      variantAttributes: variantAttributes,
      widgetAttributes: widgetAttributes,
    );
  }

  List<T> get attributes {
    final attributes = <Attribute>[];

    if (boxAttribute != null) attributes.add(boxAttribute!);
    if (textAttribute != null) attributes.add(textAttribute!);
    if (iconAttribute != null) attributes.add(iconAttribute!);
    if (sharedAttribute != null) attributes.add(sharedAttribute!);
    if (flexAttribute != null) attributes.add(flexAttribute!);
    if (directives.isNotEmpty) attributes.addAll(directives);
    if (dynamicAttributes.isNotEmpty) attributes.addAll(dynamicAttributes);
    if (tokenAttributes.isNotEmpty) attributes.addAll(tokenAttributes);
    if (variantAttributes.isNotEmpty) attributes.addAll(variantAttributes);
    if (widgetAttributes.isNotEmpty) attributes.addAll(widgetAttributes);

    return attributes.whereType<T>().toList();
  }

  Mix<T> getVariant(String variant) {
    final variantsTypes = attributes.whereType<VariantAttribute>();

    final variants =
        variantsTypes.where((element) => element.variant == variant);

    final newAttributes = variants.expand((e) => e.attributes).toList();

    return addAll(newAttributes as List<T>);
  }

  Mix copyWith({
    BoxAttributes? boxAttribute,
    TextAttributes? textAttribute,
    SharedAttributes? sharedAttribute,
    IconAttributes? iconAttribute,
    FlexAttributes? flexAttribute,
    List<DynamicAttribute> dynamicAttributes = const [],
    List<DirectiveAttribute> directives = const [],
    List<TokenRefAttribute> tokenAttributes = const [],
    List<VariantAttribute> variantAttributes = const [],
    List<WidgetAttribute> widgetAttributes = const [],
  }) {
    return Mix._(
      dynamicAttributes: [...this.dynamicAttributes, ...dynamicAttributes],
      directives: [...this.directives, ...directives],
      tokenAttributes: [...this.tokenAttributes, ...tokenAttributes],
      variantAttributes: [...this.variantAttributes, ...variantAttributes],
      widgetAttributes: [...this.widgetAttributes, ...widgetAttributes],
      boxAttribute: this.boxAttribute?.merge(boxAttribute) ?? boxAttribute,
      textAttribute: this.textAttribute?.merge(textAttribute) ?? textAttribute,
      sharedAttribute:
          this.sharedAttribute?.merge(sharedAttribute) ?? sharedAttribute,
      iconAttribute: this.iconAttribute?.merge(iconAttribute) ?? iconAttribute,
      flexAttribute: this.flexAttribute?.merge(flexAttribute) ?? flexAttribute,
    );
  }

  Mix merge(Mix other) {
    return copyWith(
      boxAttribute: other.boxAttribute,
      textAttribute: other.textAttribute,
      iconAttribute: other.iconAttribute,
      sharedAttribute: other.sharedAttribute,
      dynamicAttributes: other.dynamicAttributes,
      tokenAttributes: other.tokenAttributes,
      directives: other.directives,
      variantAttributes: other.variantAttributes,
      flexAttribute: other.flexAttribute,
      widgetAttributes: other.widgetAttributes,
    );
  }

  /// Merges many mixes into one
  static Mix<T> combineAll<T extends Attribute>(List<Mix<T>> mixes) {
    final attributes = mixes.expand((element) => element.attributes).toList();
    return Mix.fromList(attributes);
  }

  /// Merges many mixes into one
  static Mix<T> combine<T extends Attribute>([
    Mix<T>? mix1,
    Mix<T>? mix2,
    Mix<T>? mix3,
    Mix<T>? mix4,
    Mix<T>? mix5,
    Mix<T>? mix6,
  ]) {
    final list = <T>[];
    if (mix1 != null) list.addAll(mix1.attributes);
    if (mix2 != null) list.addAll(mix2.attributes);
    if (mix3 != null) list.addAll(mix3.attributes);
    if (mix4 != null) list.addAll(mix4.attributes);
    if (mix5 != null) list.addAll(mix5.attributes);
    if (mix6 != null) list.addAll(mix6.attributes);

    return Mix.fromList(list);
  }

  /// Chooses mix based on condition
  static Mix chooser<T extends Attribute>({
    required bool condition,
    required Mix<T> trueMix,
    required Mix<T> falseMix,
  }) {
    if (condition) {
      return trueMix;
    } else {
      return falseMix;
    }
  }

  MixContext createContext(BuildContext context) {
    return MixContext.create(context, this);
  }

  /// Used for const constructor widgets
  static const Mix constant = Mix._();
}

extension MixExtension<T extends Attribute> on Mix<T> {
  /// Adds more properties to a mix
  PositionalParamFn<T, Mix<T>> get add {
    return WrapFunction(addAll).withPositionalToList;
  }

  Mix<T> addAll(List<T> attributes) {
    return Mix.fromList([...this.attributes, ...attributes]);
  }

  Mix mix(Mix mix) {
    return Mix.combineAll([this, mix]);
  }

  Mix maybeMix(Mix? mix) {
    if (mix == null) return this;
    return Mix.combineAll([this, mix]);
  }

  Box box({
    required Widget child,
    Mix? mix,
  }) {
    final mx = Mix.combine(this, mix);
    return Box(mix: mx, child: child);
  }

  HBox row({
    Mix? mix,
    required List<Widget> children,
  }) {
    final mx = Mix.combine(this, mix);
    return HBox(mx, children: children);
  }

  TextMix text(
    String text, {
    Mix? mix,
    Key? key,
  }) {
    final mx = Mix.combine(this, mix);
    return TextMix(mix: mx, text: text, key: key);
  }

  VBox column({
    Mix? mix,
    required List<Widget> children,
  }) {
    final mx = Mix.combine(this, mix);
    return VBox(mx, children: children);
  }

  IconMix icon(
    IconData icon, {
    Mix? mix,
    String? semanticLabel,
  }) {
    final mx = Mix.combine(this, mix);
    return IconMix(
      mix: mx,
      icon: icon,
      semanticLabel: semanticLabel,
    );
  }
}
