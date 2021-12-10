import 'package:flutter/material.dart';
import 'package:mix/src/attributes/exports.dart';
import 'package:mix/src/helpers/extensions.dart';

import '../attributes/box/box.props.dart';
import '../attributes/common/attribute.dart';
import '../attributes/flex/flex.props.dart';
import '../attributes/icon/icon.props.dart';
import '../attributes/shared/shared.props.dart';
import '../attributes/text/text.props.dart';
import 'mix_factory.dart';

class MixContext {
  final BuildContext context;
  final Mix sourceMix;
  final Mix originalMix;
  final Mix descendentMix;

  final List<VariantAttribute> variants;
  final List<DirectiveAttribute> directives;
  final List<WidgetDecorator> decorators;

  final BoxProps boxMixer;
  final TextProps textMixer;
  final SharedProps sharedMixer;
  final IconProps iconMixer;
  final FlexProps flexMixer;

  MixContext._({
    required this.context,
    required this.sourceMix,
    required this.originalMix,
    required this.descendentMix,
    required this.boxMixer,
    required this.textMixer,
    required this.sharedMixer,
    required this.iconMixer,
    required this.flexMixer,
    required this.directives,
    required this.variants,
    required this.decorators,
  });

  factory MixContext.create(
    BuildContext context,
    Mix mix, {
    bool inherit = false,
    List<Variant>? customVariants,
  }) {
    Mix _mix = mix;
    if (inherit) {
      /// Get ancestor context
      final inheritedMix = context.inheritedMix;
      if (inheritedMix != null) {
        _mix = Mix.combine(mix, inheritedMix);
      }
    }
    return _build(
      context,
      _mix,
      customVariants: customVariants ?? [],
    );
  }

  static MixContext _build<T extends Attribute>(
    BuildContext context,
    Mix<T> mix, {
    required List<Variant> customVariants,
  }) {
    final _attributes = _expandAttributes(
      context,
      mix.attributes,
      customVariants: customVariants,
    );
    BoxAttributes? boxAttributes;
    IconAttributes? iconAttributes;
    FlexAttributes? flexAttributes;
    SharedAttributes? sharedAttributes;
    TextAttributes? textAttributes;

    final source = Mix.fromList(_attributes);
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
      sourceMix: source,
      originalMix: mix,
      descendentMix: Mix.fromMaybeList([
        textAttributes,
        iconAttributes,
        sharedAttributes,
        ...variants,
        ...directives
      ]),
      boxMixer: BoxProps.fromContext(context, boxAttributes),
      textMixer: TextProps.fromContext(
        context,
        textAttributes,
        directives.whereType<TextDirectiveAttribute>(),
      ),
      sharedMixer: SharedProps.fromContext(context, sharedAttributes),
      iconMixer: IconProps.fromContext(context, iconAttributes),
      flexMixer: FlexProps.fromContext(context, flexAttributes),
      directives: directives,
      variants: variants,
      decorators: decorators,
    );
  }

  /// Expands `VariantAttribute` and `NestedAttribute` based on context
  static List<T> _expandAttributes<T extends Attribute>(
    BuildContext context,
    List<T> attributes, {
    required List<Variant> customVariants,
  }) {
    final spreaded = <T>[];

    bool hasNested = false;

    for (final attribute in attributes) {
      if (attribute is VariantAttribute<T>) {
        if (customVariants.contains(attribute.variant) ||
            attribute.shouldApply(context)) {
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
      return _expandAttributes(
        context,
        spreaded,
        customVariants: customVariants,
      );
    } else {
      return spreaded;
    }
  }

  /// Applies all [WidgetDecorator] of [type] to a [Widget]
  Widget _applyWidgetDecorators(
    Widget widget, {
    required WidgetDecoratorType type,
  }) {
    var current = widget;

    final decoratorMap = <Type, WidgetDecorator>{};

    final selectedDecorators = decorators.where(
      (decorator) => decorator.type == type,
    );

    if (selectedDecorators.isEmpty) {
      return current;
    }

    for (final attribute in selectedDecorators) {
      final existing = decoratorMap[attribute.runtimeType];
      if (existing != null) {
        decoratorMap[attribute.runtimeType] = existing.merge(attribute);
      } else {
        decoratorMap[attribute.runtimeType] = attribute;
      }
    }

    // Apply widget attributes
    decoratorMap.forEach(
      (key, value) => current = value.render(this, current),
    );

    return current;
  }

  Widget renderParentDecorators(Widget widget) {
    return _applyWidgetDecorators(widget, type: WidgetDecoratorType.parent);
  }

  Widget renderChildDecorators(Widget widget) {
    return _applyWidgetDecorators(widget, type: WidgetDecoratorType.child);
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
      sourceMix: other.sourceMix,
    );
  }

  MixContext copyWith({
    BuildContext? context,
    Mix? sourceMix,
  }) {
    return MixContext.create(
      this.context,
      Mix.combine(this.sourceMix, sourceMix),
    );
  }
}

class MixContextNotifier extends InheritedWidget {
  const MixContextNotifier(
    this.mixContext, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final MixContext? mixContext;

  static MixContext? of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<MixContextNotifier>();
    return widget?.mixContext;
  }

  @override
  bool updateShouldNotify(MixContextNotifier oldWidget) {
    return mixContext != oldWidget.mixContext;
  }
}
