import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.mixer.dart';
import 'package:mix/src/attributes/flex/flex.mixer.dart';
import 'package:mix/src/attributes/icon/icon.mixer.dart';
import 'package:mix/src/attributes/shared/shared.mixer.dart';
import 'package:mix/src/attributes/text/text.mixer.dart';

import '../../mix.dart';
import '../attributes/common/attribute.dart';
import 'mix_factory.dart';

class MixContext {
  final BuildContext context;

  final BoxAttributes? boxAttribute;
  final TextAttributes? textAttribute;
  final SharedAttributes? sharedAttribute;
  final IconAttributes? iconAttribute;
  final FlexAttributes? flexAttribute;
  final List<VariantAttribute> variantAttributes;

  final List<DirectiveAttribute> directives;
  final List<WidgetDecorator> widgetDecorators;

  BoxMixer? _boxMixer;
  TextMixer? _textMixer;
  SharedMixer? _sharedMixer;
  IconMixer? _iconMixer;
  FlexMixer? _flexMixer;

  MixContext._({
    required this.context,
    required this.boxAttribute,
    required this.textAttribute,
    required this.sharedAttribute,
    required this.iconAttribute,
    required this.flexAttribute,
    this.directives = const [],
    this.variantAttributes = const [],
    this.widgetDecorators = const [],
  });

  BoxMixer get boxMixer {
    _boxMixer ??= BoxMixer.fromContext(this);
    return _boxMixer!;
  }

  TextMixer get textMixer {
    _textMixer ??= TextMixer.fromContext(withAncestorContext());
    return _textMixer!;
  }

  IconMixer get iconMixer {
    _iconMixer ??= IconMixer.fromContext(withAncestorContext());
    return _iconMixer!;
  }

  FlexMixer get flexMixer {
    _flexMixer ??= FlexMixer.fromContext(this);
    return _flexMixer!;
  }

  SharedMixer get sharedMixer {
    _sharedMixer ??= SharedMixer.fromContext(withAncestorContext());
    return _sharedMixer!;
  }

  factory MixContext.create(BuildContext context, Mix mix) {
    final attributes = _applyNestedAttributes(context, mix.attributes);
    BoxAttributes? boxAttributes;
    IconAttributes? iconAttributes;
    FlexAttributes? flexAttributes;
    SharedAttributes? sharedAttributes;
    TextAttributes? textAttributes;

    final directiveAttributes = <DirectiveAttribute>[];
    final variantAttributes = <VariantAttribute>[];
    final widgetDecorators = <WidgetDecorator>[];

    for (final attribute in attributes) {
      if (attribute is VariantAttribute) {
        variantAttributes.add(attribute);
      }

      if (attribute is DirectiveAttribute) {
        directiveAttributes.add(attribute);
      }

      if (attribute is WidgetDecorator) {
        widgetDecorators.add(attribute);
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

    return MixContext._(
      context: context,
      boxAttribute: boxAttributes,
      textAttribute: textAttributes,
      sharedAttribute: sharedAttributes,
      directives: directiveAttributes,
      iconAttribute: iconAttributes,
      flexAttribute: flexAttributes,
      variantAttributes: variantAttributes,
      widgetDecorators: widgetDecorators,
    );
  }

  /// Expands `VariantAttributes` based on context
  static List<T> _applyNestedAttributes<T extends Attribute>(
    BuildContext context,
    List<T> attributes,
  ) {
    final spreaded = <T>[];

    bool hasNested = false;

    for (final attribute in attributes) {
      if (attribute is VariantAttribute<T>) {
        if (attribute.shouldApply(context)) {
          spreaded.addAll(attribute.attributes);
          hasNested = true;
        }
      } else if (attribute is TokenRefAttribute<T>) {
        // Get token from context and expand
        final tokenAttributes = attribute.getToken(context);
        spreaded.add(tokenAttributes);
        hasNested = true;
      } else if (attribute is NestedAttribute<T>) {
        spreaded.addAll(attribute.attributes);
        hasNested = true;
      } else {
        spreaded.add(attribute);
      }
    }

    if (hasNested) {
      return _applyNestedAttributes(context, spreaded);
    } else {
      return spreaded;
    }
  }

  MixContext withAncestorContext() {
    final ancestorContext = context.ancestorMixer;

    if (ancestorContext != null) {
      return merge(ancestorContext);
    } else {
      return this;
    }
  }

  /// Applies all [WidgetDecorator]s to a [Widget]
  Widget applyWidgetDecorators(Widget widget) {
    var current = widget;
    final attributeMap = <Type, WidgetDecorator>{};

    for (final attribute in widgetDecorators) {
      final existing = attributeMap[attribute.runtimeType];
      if (existing != null) {
        attributeMap[attribute.runtimeType] = existing.merge(attribute);
      } else {
        attributeMap[attribute.runtimeType] = attribute;
      }
    }

    // Apply widget attributes
    attributeMap.forEach(
      (key, value) => current = value.render(this, current),
    );

    return current;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixContext &&
        other.boxMixer == boxMixer &&
        other.textMixer == textMixer &&
        other.iconMixer == iconMixer &&
        other.flexMixer == flexMixer &&
        other.sharedMixer == sharedMixer;
  }

  @override
  int get hashCode =>
      boxMixer.hashCode ^
      textMixer.hashCode ^
      iconMixer.hashCode ^
      flexMixer.hashCode ^
      sharedMixer.hashCode;

  MixContext merge(MixContext? other) {
    if (other == null) return this;

    return copyWith(
      context: other.context,
      boxAttribute: other.boxAttribute,
      textAttribute: other.textAttribute,
      iconAttribute: other.iconAttribute,
      sharedAttribute: other.sharedAttribute,
      directives: other.directives,
      variantAttributes: other.variantAttributes,
      flexAttribute: other.flexAttribute,
      widgetAttributes: other.widgetDecorators,
    );
  }

  MixContext copyWith({
    BuildContext? context,
    BoxAttributes? boxAttribute,
    TextAttributes? textAttribute,
    SharedAttributes? sharedAttribute,
    IconAttributes? iconAttribute,
    FlexAttributes? flexAttribute,
    List<DirectiveAttribute> directives = const [],
    List<VariantAttribute> variantAttributes = const [],
    List<WidgetDecorator> widgetAttributes = const [],
  }) {
    return MixContext._(
      context: context ?? this.context,
      directives: [...this.directives, ...directives],
      variantAttributes: [...this.variantAttributes, ...variantAttributes],
      widgetDecorators: [...this.widgetDecorators, ...widgetAttributes],
      boxAttribute: this.boxAttribute?.merge(boxAttribute) ?? boxAttribute,
      textAttribute: this.textAttribute?.merge(textAttribute) ?? textAttribute,
      sharedAttribute:
          this.sharedAttribute?.merge(sharedAttribute) ?? sharedAttribute,
      iconAttribute: this.iconAttribute?.merge(iconAttribute) ?? iconAttribute,
      flexAttribute: this.flexAttribute?.merge(flexAttribute) ?? flexAttribute,
    );
  }
}
