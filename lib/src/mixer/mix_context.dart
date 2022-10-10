import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/attributes/nested_attribute.dart';
import 'package:mix/src/attributes/shared/shared.props.dart';
import 'package:mix/src/decorators/decorator_attributes.dart';
import 'package:mix/src/directives/directive.dart';
import 'package:mix/src/mixer/mix_context_notifier.dart';
import 'package:mix/src/mixer/mix_factory.dart';
import 'package:mix/src/variants/variant_attribute.dart';
import 'package:mix/src/widgets/box/box.props.dart';
import 'package:mix/src/widgets/flex/flex.props.dart';
import 'package:mix/src/widgets/icon/icon.props.dart';
import 'package:mix/src/widgets/image/image.props.dart';
import 'package:mix/src/widgets/text/text.props.dart';
import 'package:mix/src/widgets/zbox/zbox.props.dart';

class MixContext {
  final BuildContext context;
  final Mix sourceMix;
  final Mix originalMix;

  final MixInheritedAttributes attributes;
  final MixDecoratorAttributes decorators;
  final List<VariantAttribute> variants;
  final List<DirectiveAttribute> directives;

  MixContext._({
    required this.context,
    required this.sourceMix,
    required this.originalMix,
    required this.directives,
    required this.variants,
    required this.decorators,
    required this.attributes,
  });

  factory MixContext.create({
    required BuildContext context,
    required Mix mix,
    bool inherit = false,
  }) {
    MixContext? inheritedMixContext;

    if (inherit) {
      /// Get ancestor context
      inheritedMixContext = MixContextNotifier.of(context);
    }

    Mix combinedMix;
    final inheritedMix = inheritedMixContext?.sourceMix;

    if (inheritedMix != null) {
      combinedMix = inheritedMix.apply(mix);
    } else {
      combinedMix = mix;
    }

    return _build(
      context: context,
      mix: combinedMix,
    );
  }

  static MixContext _build<T extends Attribute>({
    required BuildContext context,
    required Mix<T> mix,
  }) {
    final _attributes = _expandAttributes(context, mix);

    final source = Mix.fromList(_attributes);
    final directives = <DirectiveAttribute>[];
    final variants = <VariantAttribute>[];
    final decorators = <DecoratorAttribute>[];
    final attributes = <InheritedAttribute>[];

    for (final attribute in _attributes) {
      if (attribute is InheritedAttribute) {
        attributes.add(attribute);
      }

      if (attribute is VariantAttribute) {
        variants.add(attribute);
      }

      if (attribute is DirectiveAttribute) {
        directives.add(attribute);
      }

      if (attribute is DecoratorAttribute) {
        decorators.add(attribute);
      }
    }

    return MixContext._(
      context: context,
      sourceMix: source,
      originalMix: mix,
      directives: directives,
      variants: variants,
      decorators: MixDecoratorAttributes.fromList(decorators),
      attributes: MixInheritedAttributes.fromList(attributes),
    );
  }

  MixContext merge(MixContext other) {
    return MixContext._(
      context: context,
      sourceMix: sourceMix,
      originalMix: originalMix,
      directives: directives,
      variants: variants,
      decorators: decorators,
      attributes: attributes,
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

  /// Used to obtain a [InheritedAttribute] from [MixInheritedAttributes].
  ///
  /// Obtain with `mixContext.fromType<MyInheritedAttribute>()`.
  T? fromType<T extends InheritedAttribute>() {
    return attributes.fromType<T>();
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
        other.attributes == attributes;
  }

  @override
  int get hashCode {
    return context.hashCode ^
        sourceMix.hashCode ^
        originalMix.hashCode ^
        variants.hashCode ^
        directives.hashCode ^
        decorators.hashCode ^
        attributes.hashCode;
  }
}

extension MixContextExtensions on MixContext {
  SharedProps get sharedProps => SharedProps.fromContext(this);
  BoxProps get boxProps => BoxProps.fromContext(this);
  // Cache this value
  FlexProps get flexProps => FlexProps.fromContext(this);

  ZBoxProps get zBoxProps => ZBoxProps.fromContext(this);
  IconProps get iconProps => IconProps.fromContext(this);
  TextProps get textProps => TextProps.fromContext(this);
  ImageProps get imageProps => ImageProps.fromContext(this);
}
