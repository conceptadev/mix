import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/src/attributes/exports.dart';
import 'package:mix/src/helpers/extensions.dart';

import '../attributes/box/box.props.dart';
import '../attributes/common/attribute.dart';
import '../attributes/flex/flex.props.dart';
import '../attributes/icon/icon.props.dart';
import '../attributes/shared/shared.props.dart';
import '../attributes/text/text.props.dart';
import '../attributes/zbox/zbox.props.dart';
import 'mix_factory.dart';

typedef DecoratorMap = Map<DecoratorType, List<Decorator>>;

extension DecoratorMapExtension on DecoratorMap {
  List<Decorator> get parents {
    return _getOrDefault(DecoratorType.parent);
  }

  List<Decorator> get children {
    return _getOrDefault(DecoratorType.child);
  }

  List<Decorator> _getOrDefault(DecoratorType type) {
    return this[type] ?? [];
  }
}

class MixContext {
  final BuildContext context;
  final Mix sourceMix;
  final Mix originalMix;
  final Mix descendentMix;

  final List<VariantAttribute> variants;
  final List<DirectiveAttribute> directives;
  final DecoratorMap decorators;

  final BoxProps boxProps;
  final TextProps textProps;
  final SharedProps sharedProps;
  final IconProps iconProps;
  final FlexProps flexProps;
  final ZBoxProps zBoxProps;

  MixContext._({
    required this.context,
    required this.sourceMix,
    required this.originalMix,
    required this.descendentMix,
    required this.boxProps,
    required this.textProps,
    required this.sharedProps,
    required this.iconProps,
    required this.flexProps,
    required this.zBoxProps,
    required this.directives,
    required this.variants,
    required this.decorators,
  });

  factory MixContext.create({
    required BuildContext context,
    required Mix mix,
    bool inherit = false,
  }) {
    Mix _mix = mix;
    if (inherit) {
      /// Get ancestor context
      final inheritedMix = context.inheritedMix;
      if (inheritedMix != null) {
        _mix = Mix.combine(inheritedMix, mix);
      }
    }

    return _build(
      context: context,
      mix: _mix,
      variantsToApply: mix.variantToApply,
    );
  }

  static MixContext _build<T extends Attribute>({
    required BuildContext context,
    required Mix<T> mix,
    required List<Variant> variantsToApply,
  }) {
    final _attributes = _expandAttributes(
      context,
      mix.attributes,
      variantsToApply: variantsToApply,
    );
    BoxAttributes? boxAttributes;
    IconAttributes? iconAttributes;
    FlexAttributes? flexAttributes;
    SharedAttributes? sharedAttributes;
    TextAttributes? textAttributes;
    ZBoxAttributes? zBoxAttributes;

    final source = Mix.fromList(_attributes);
    final directives = <DirectiveAttribute>[];
    final variants = <VariantAttribute>[];
    final decorators = <Decorator>[];

    for (final attribute in _attributes) {
      if (attribute is VariantAttribute) {
        variants.add(attribute);
      }

      if (attribute is DirectiveAttribute) {
        directives.add(attribute);
      }

      if (attribute is Decorator) {
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

      if (attribute is ZBoxAttributes) {
        zBoxAttributes ??= const ZBoxAttributes();
        zBoxAttributes = zBoxAttributes.merge(attribute);
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
      boxProps: BoxProps.fromContext(context, boxAttributes),
      textProps: TextProps.fromContext(
        context,
        textAttributes,
        directives.whereType<TextDirectiveAttribute>(),
      ),
      sharedProps: SharedProps.fromContext(context, sharedAttributes),
      iconProps: IconProps.fromContext(context, iconAttributes),
      flexProps: FlexProps.fromContext(context, flexAttributes),
      zBoxProps: ZBoxProps.fromContext(context, zBoxAttributes),
      directives: directives,
      variants: variants,
      decorators: _getDecoratorMap(decorators),
    );
  }

  /// Expands `VariantAttribute` and `NestedAttribute` based on context
  static List<T> _expandAttributes<T extends Attribute>(
    BuildContext context,
    List<T> attributes, {
    required List<Variant> variantsToApply,
  }) {
    final spreaded = <T>[];

    bool hasNested = false;

    for (final attribute in attributes) {
      if (attribute is VariantAttribute<T>) {
        if (variantsToApply.contains(attribute.variant) ||
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
        variantsToApply: variantsToApply,
      );
    } else {
      return spreaded;
    }
  }

  static DecoratorMap _getDecoratorMap(List<Decorator> decorators) {
    final DecoratorMap decoratorMap = {};
    final mergedDecorators = <Type, Decorator>{};

    for (final attribute in decorators) {
      final existing = mergedDecorators[attribute.runtimeType];
      if (existing != null) {
        mergedDecorators[attribute.runtimeType] = existing.merge(attribute);
      } else {
        mergedDecorators[attribute.runtimeType] = attribute;
      }
    }

    mergedDecorators.forEach((_, decorator) {
      decoratorMap[decorator.type] ??= [];
      // Add to decorator map and sort to guarantee order consistency
      decoratorMap[decorator.type]!
        ..add(decorator)
        ..sort((a, b) => a.key.hashCode - b.key.hashCode);
    });

    return decoratorMap;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixContext &&
        other.context == context &&
        other.sourceMix == sourceMix &&
        other.originalMix == originalMix &&
        other.descendentMix == descendentMix &&
        listEquals(other.variants, variants) &&
        listEquals(other.directives, directives) &&
        other.decorators == decorators &&
        other.boxProps == boxProps &&
        other.textProps == textProps &&
        other.sharedProps == sharedProps &&
        other.iconProps == iconProps &&
        other.flexProps == flexProps &&
        other.zBoxProps == zBoxProps;
  }

  @override
  int get hashCode {
    return context.hashCode ^
        sourceMix.hashCode ^
        originalMix.hashCode ^
        descendentMix.hashCode ^
        variants.hashCode ^
        directives.hashCode ^
        decorators.hashCode ^
        boxProps.hashCode ^
        textProps.hashCode ^
        sharedProps.hashCode ^
        iconProps.hashCode ^
        flexProps.hashCode ^
        zBoxProps.hashCode;
  }

  MixContext merge(MixContext? other) {
    if (other == null) return this;

    return copyWith(
      sourceMix: other.sourceMix,
    );
  }

  MixContext copyWith({
    Mix? sourceMix,
  }) {
    return MixContext.create(
      context: context,
      mix: Mix.combine(this.sourceMix, sourceMix),
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
