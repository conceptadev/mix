import 'package:flutter/material.dart';

import '../../mix.dart';
import '../attributes/box/box.mixer.dart';
import '../attributes/common/attribute.dart';
import '../attributes/flex/flex.mixer.dart';
import '../attributes/icon/icon.mixer.dart';
import '../attributes/shared/shared.mixer.dart';
import '../attributes/text/text.mixer.dart';
import 'mix_factory.dart';

class MixContext {
  final BuildContext context;
  final Mix source;

  final List<VariantAttribute> variants;
  final List<DirectiveAttribute> directives;
  final List<WidgetDecorator> decorators;

  final BoxMixer boxMixer;
  final TextMixer textMixer;
  final SharedMixer sharedMixer;
  final IconMixer iconMixer;
  final FlexMixer flexMixer;

  MixContext._({
    required this.context,
    required this.boxMixer,
    required this.textMixer,
    required this.sharedMixer,
    required this.iconMixer,
    required this.flexMixer,
    required this.source,
    this.directives = const [],
    this.variants = const [],
    this.decorators = const [],
  });

  factory MixContext.create(
    BuildContext context,
    Mix mix, {
    bool inherit = false,
  }) {
    var attributes = [...mix.attributes];
    if (inherit) {
      /// Get ancestor context
      final ancestor = context.ancestorMixContext;
      if (ancestor != null) {
        attributes.addAll(ancestor.source.attributes);
      }
    }
    return _build(context, attributes);
  }

  static MixContext _build<T extends Attribute>(
      BuildContext context, List<T> attributes) {
    final _attributes = _applyNestedAttributes(context, attributes);
    BoxAttributes? boxAttributes;
    IconAttributes? iconAttributes;
    FlexAttributes? flexAttributes;
    SharedAttributes? sharedAttributes;
    TextAttributes? textAttributes;

    final source = Mix.fromAttributes(_attributes);
    final directives = <DirectiveAttribute>[];
    final variants = <VariantAttribute>[];
    final decorators = <WidgetDecorator>[];

    for (final attribute in _attributes) {
      if (attribute is VariantAttribute) {
        variants.add(attribute);
      }

      if (attribute is DirectiveAttribute) {
        directives.add(attribute);
      }

      if (attribute is WidgetDecorator) {
        decorators.add(attribute);
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
      source: source,
      boxMixer: BoxMixer.fromContext(context, boxAttributes),
      textMixer: TextMixer.fromContext(
        context,
        textAttributes,
        directives.whereType<TextDirectiveAttribute>(),
      ),
      sharedMixer: SharedMixer.fromContext(context, sharedAttributes),
      iconMixer: IconMixer.fromContext(context, iconAttributes),
      flexMixer: FlexMixer.fromContext(context, flexAttributes),
      directives: directives,
      variants: variants,
      decorators: decorators,
    );
  }

  /// Expands `VariantAttributes` based on context
  static List<T> _applyNestedAttributes<T extends Attribute>(
      BuildContext context, List<T> attributes) {
    final spreaded = <T>[];

    bool hasNested = false;

    for (final attribute in attributes) {
      if (attribute is VariantAttribute<T>) {
        if (attribute.shouldApply(context)) {
          // If its selected, add it to the list
          spreaded.addAll(attribute.attributes);
          hasNested = true;
        } else {
          // If not selected, add it to the list for future use
          spreaded.add(attribute);
        }
      } else if (attribute is NestedAttribute<T>) {
        spreaded.addAll(attribute.attributes);
        hasNested = true;
      } else {
        spreaded.add(attribute);
      }
    }

    if (hasNested) {
      return _applyNestedAttributes(
        context,
        spreaded,
      );
    } else {
      return spreaded;
    }
  }

  /// Applies all [WidgetDecorator]s to a [Widget]
  Widget applyWidgetDecorators(Widget widget) {
    var current = widget;
    final attributeMap = <Type, WidgetDecorator>{};

    for (final attribute in decorators) {
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
      source: other.source,
    );
  }

  MixContext copyWith({
    BuildContext? context,
    Mix? source,
  }) {
    return MixContext.create(
      this.context,
      Mix.combine(this.source, source),
    );
  }
}
