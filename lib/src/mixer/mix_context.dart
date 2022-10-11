import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/attributes/shared/shared.props.dart';
import 'package:mix/src/directives/directive_attribute.dart';
import 'package:mix/src/mixer/mix_factory.dart';
import 'package:mix/src/mixer/mix_values.dart';
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
  final Mix mix;

  MixContext._({
    required this.context,
    required this.mix,
  });

  factory MixContext.create({
    required BuildContext context,
    required Mix mix,
    List<Variant> variants = const [],
  }) {
    return _build(
      context: context,
      mix: mix,
      selectedVariants: variants,
    );
  }

  static MixContext _build<T extends Attribute>({
    required BuildContext context,
    required Mix mix,
    required List<Variant> selectedVariants,
  }) {
    // Tracks the values selected and does not allow for
    // attributes already expended to be expended again.
    MixValues values = MixValues(
      attributes: mix.values.attributes,
      decorators: mix.values.decorators,
      directives: mix.values.directives,
      variants: [],
    );

    final variants = mix.values.variants;

    final attributes = _selectVariantsToApply(
      context,
      selectedVariants,
      variants,
    );

    final appliedValues = values.merge(MixValues.fromList(attributes));

    return MixContext._(
      context: context,
      mix: Mix.fromValues(appliedValues),
    );
  }

  static List<Attribute> _selectVariantsToApply(
    BuildContext context,
    List<Variant> selectedVariants,
    List<Attribute> attributes,
  ) {
    List<Attribute> _expanded = [];

    for (final attribute in attributes) {
      if (attribute is VariantAttribute) {
        final shouldApply = selectedVariants.contains(attribute.variant) ||
            attribute.shouldApply(context);
        // If it's inverse (from `not(variant)`), only apply if [willApply] is
        // false. Otherwise, apply only when [willApply]
        final willApply =
            attribute.variant.inverse ? !shouldApply : shouldApply;
        if (willApply) {
          // If its selected, add it to the list
          _expanded.addAll(_selectVariantsToApply(
            context,
            selectedVariants,
            attribute.values,
          ));
        } else {
          // If not selected, add it to the list for future use
          _expanded.add(attribute);
        }
      } else {
        _expanded.add(attribute);
      }
    }
    return _expanded;
  }

  MixValues get attributes {
    return mix.values;
  }

  MixContext merge(MixContext other) {
    return MixContext._(
      context: context,
      mix: mix,
    );
  }

  /// Used to obtain a [InheritedAttribute] from [MixInheritedAttributes].
  ///
  /// Obtain with `mixContext.fromType<MyInheritedAttribute>()`.
  T? fromType<T extends InheritedAttribute>() {
    return attributes.attributes.fromType<T>();
  }

  Iterable<T> directivesWhereType<T extends DirectiveAttribute>() {
    return attributes.directives.whereType<T>();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixContext &&
        other.context == context &&
        other.mix == mix &&
        other.attributes == attributes;
  }

  @override
  int get hashCode {
    return context.hashCode ^ mix.hashCode ^ attributes.hashCode;
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
