import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../attributes/box/box.props.dart';
import '../attributes/flex/flex.props.dart';
import '../attributes/icon/icon.props.dart';
import '../attributes/shared/shared.props.dart';
import '../attributes/text/text.props.dart';
import '../attributes/zbox/zbox.props.dart';

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

  // factory MixContext.fromContext(BuildContext context) {
  //   return MixContext.create(
  //     context: context,
  //     inherit: true,
  //     mix: Mix.constant,
  //   );
  // }

  factory MixContext.create({
    required BuildContext context,
    required Mix mix,
    bool inherit = false,
  }) {
    Mix _mix = mix;

    MixContext? inheritedMixContext;

    if (inherit) {
      /// Get ancestor context
      inheritedMixContext = context.inheritedMixContext;
    }

    MixContext mixContext;
    mixContext = _build(
      context: context,
      mix: _mix,
    );

    if (inheritedMixContext != null) {
      mixContext = inheritedMixContext.merge(mixContext);
    }

    return mixContext;
  }

  // ignore: long-method
  static MixContext _build<T extends Attribute>({
    required BuildContext context,
    required Mix<T> mix,
  }) {
    final _attributes = _expandAttributes(context, mix);
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
        if (sharedAttributes == null) {
          sharedAttributes = attribute;
        } else {
          sharedAttributes = sharedAttributes.merge(attribute);
        }
      }

      if (attribute is TextAttributes) {
        if (textAttributes == null) {
          textAttributes = attribute;
        } else {
          textAttributes = textAttributes.merge(attribute);
        }
      }

      if (attribute is BoxAttributes) {
        if (boxAttributes == null) {
          boxAttributes = attribute;
        } else {
          boxAttributes = boxAttributes.merge(attribute);
        }
      }

      if (attribute is IconAttributes) {
        if (iconAttributes == null) {
          iconAttributes = attribute;
        } else {
          iconAttributes = iconAttributes.merge(attribute);
        }
      }

      if (attribute is FlexAttributes) {
        if (flexAttributes == null) {
          flexAttributes = attribute;
        } else {
          flexAttributes = flexAttributes.merge(attribute);
        }
      }

      if (attribute is ZBoxAttributes) {
        if (zBoxAttributes == null) {
          zBoxAttributes = attribute;
        } else {
          zBoxAttributes = zBoxAttributes.merge(attribute);
        }
      }
    }

    final boxProps = BoxProps.fromContext(context, boxAttributes);

    final textProps =
        TextProps.fromContext(context, textAttributes, directives);

    final sharedProps = SharedProps.fromContext(context, sharedAttributes);

    final iconProps = IconProps.fromContext(context, iconAttributes);

    final flexProps = FlexProps.fromContext(context, flexAttributes);
    final zBoxProps = ZBoxProps.fromContext(context, zBoxAttributes);
    final decoratorMap = _getDecoratorMap(decorators);

    return MixContext._(
      context: context,
      sourceMix: source,
      originalMix: mix,
      boxProps: boxProps,
      textProps: textProps,
      sharedProps: sharedProps,
      iconProps: iconProps,
      flexProps: flexProps,
      zBoxProps: zBoxProps,
      directives: directives,
      variants: variants,
      decorators: decoratorMap,
    );
  }

  /// Expands `VariantAttribute` and `NestedAttribute` based on context
  static List<T> _expandAttributes<T extends Attribute>(
    BuildContext context,
    Mix<T> mix,
  ) {
    List<T> spreaded = <T>[];

    bool hasNested = false;

    for (final attribute in mix.attributes) {
      if (attribute is VariantAttribute<T>) {
        final bool willApply = mix.variantToApply.contains(attribute.variant) ||
            attribute.shouldApply(context);
        // If it's inverse (from `not(variant)`), only apply if [willApply] is
        // false. Otherwise, apply only when [willApply]
        if (attribute.variant.inverse ? !willApply : willApply) {
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
      spreaded = _expandAttributes(
        context,
        Mix.fromList(
          spreaded,
          variantToApply: mix.variantToApply,
        ),
      );
    }

    return spreaded;
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
      inherit: false,
    );
  }
}
