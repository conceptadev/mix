import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/attributes/nested_attribute.dart';
import 'package:mix/src/attributes/shared/shared.props.dart';
import 'package:mix/src/directives/directive.dart';
import 'package:mix/src/mixer/mix_attributes.dart';
import 'package:mix/src/mixer/mix_context_notifier.dart';
import 'package:mix/src/mixer/mix_factory.dart';
import 'package:mix/src/variants/variant_attribute.dart';
import 'package:mix/src/variants/variants.dart';
import 'package:mix/src/widgets/box/box.props.dart';
import 'package:mix/src/widgets/flex/flex.props.dart';
import 'package:mix/src/widgets/icon/icon.props.dart';
import 'package:mix/src/widgets/image/image.props.dart';
import 'package:mix/src/widgets/text/text.props.dart';
import 'package:mix/src/widgets/zbox/zbox.props.dart';

class MixContext {
  final BuildContext context;
  final Mix sourceMix;
  final MixAttributes attributes;

  MixContext._({
    required this.context,
    required this.sourceMix,
    required this.attributes,
  });

  factory MixContext.create({
    required BuildContext context,
    required Mix mix,
    List<Variant> variants = const [],
    bool inherit = false,
  }) {
    Mix combinedMix;

    if (inherit) {
      /// Get ancestor context
      final inheritedMixContext = MixContextNotifier.of(context);

      final inheritedMix = inheritedMixContext?.sourceMix;
      combinedMix = inheritedMix?.apply(mix) ?? mix;
    } else {
      combinedMix = mix;
    }

    return _build(
      context: context,
      mix: combinedMix,
      variants: variants,
    );
  }

  static MixContext _build<T extends Attribute>({
    required BuildContext context,
    required Mix<T> mix,
    required List<Variant> variants,
  }) {
    final _selectedAttributes = _selectAttributes(
      context,
      mix.attributes.source,
      variants,
    );

    final source = Mix.fromList(_selectedAttributes);

    return MixContext._(
      context: context,
      sourceMix: source,
      attributes: MixAttributes.fromList(_selectedAttributes),
    );
  }

  MixContext merge(MixContext other) {
    return MixContext._(
      context: context,
      sourceMix: sourceMix,
      attributes: attributes,
    );
  }

  Iterable<T> directivesWhereType<T extends DirectiveAttribute>() {
    return attributes.directives.whereType<T>();
  }

  T? attributesWhereType<T extends InheritedAttribute>() {
    return attributes.attributes.fromType<T>();
  }

  /// Expands `VariantAttribute` and `NestedAttribute` based on context
  static List<Attribute> _selectAttributes(
    BuildContext context,
    List<Attribute> attributes,
    List<Variant> variants,
  ) {
    List<Attribute> spreaded = [];

    bool hasNested = false;

    for (final attribute in attributes) {
      if (attribute is VariantAttribute) {
        final bool shouldApply = variants.contains(attribute.variant) ||
            attribute.shouldApply(context);

        // If it's inverse (from `not(variant)`), only apply if [willApply] is
        // false. Otherwise, apply only when [willApply]
        final willApply =
            attribute.variant.inverse ? !shouldApply : shouldApply;

        if (willApply) {
          // If its selected, add it to the list
          spreaded.addAll(attribute.attributes);
          hasNested = true;
        } else {
          // If not selected, add it to the list for future use
          spreaded.add(attribute);
        }
      } else if (attribute is NestedAttribute) {
        spreaded.addAll(attribute.attributes);
        hasNested = true;
      } else {
        spreaded.add(attribute);
      }
    }

    if (hasNested) {
      spreaded = _selectAttributes(context, spreaded, variants);
    }

    return spreaded;
  }

  /// Used to obtain a [InheritedAttribute] from [MixInheritedAttributes].
  ///
  /// Obtain with `mixContext.fromType<MyInheritedAttribute>()`.
  T? fromType<T extends InheritedAttribute>() {
    return attributesWhereType<T>();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixContext &&
        other.context == context &&
        other.sourceMix == sourceMix &&
        other.attributes == attributes;
  }

  @override
  int get hashCode {
    return context.hashCode ^ sourceMix.hashCode ^ attributes.hashCode;
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
