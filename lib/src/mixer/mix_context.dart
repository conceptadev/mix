import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../attributes/shared/shared.props.dart';
import '../decorators/decorator_attribute.dart';
import '../directives/directive_attribute.dart';
import '../variants/variant_attribute.dart';
import '../variants/variants.dart';
import '../widgets/box/box.props.dart';
import '../widgets/flex/flex.props.dart';
import '../widgets/icon/icon.props.dart';
import '../widgets/image/image.props.dart';
import '../widgets/text/text.props.dart';
import '../widgets/zbox/zbox.props.dart';
import 'mix_factory.dart';
import 'mix_values.dart';

class MixContext {
  final BuildContext context;
  final MixValues _mixValues;

  MixContext._({
    required this.context,
    required MixValues mixValues,
  }) : _mixValues = mixValues;

  factory MixContext.create({
    required BuildContext context,
    required Mix mix,
    List<Variant> variants = const [],
  }) {
    return _build(
      context: context,
      mix: mix.values,
      selectedVariants: variants,
    );
  }

  static MixContext _build<T extends Attribute>({
    required BuildContext context,
    required MixValues mix,
    required List<Variant> selectedVariants,
  }) {
    // Tracks the values selected and does not allow for
    // attributes already expended to be expended again.
    MixValues values = MixValues(
      attributes: mix.attributes,
      decorators: mix.decorators,
      directives: mix.directives,
      variants: [],
    );

    final variants = mix.variants;

    final attributes = _selectVariantsToApply(
      context,
      selectedVariants,
      variants,
    );

    final appliedValues = values.merge(MixValues.create(attributes));

    return MixContext._(
      context: context,
      mixValues: appliedValues,
    );
  }

  static List<Attribute> _selectVariantsToApply(
    BuildContext context,
    List<Variant> selectedVariants,
    List<Attribute> attributes,
  ) {
    List<Attribute> expanded = [];

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
          expanded.addAll(_selectVariantsToApply(
            context,
            selectedVariants,
            attribute.value.toList(),
          ));
        } else {
          // If not selected, add it to the list for future use
          expanded.add(attribute);
        }
      } else {
        expanded.add(attribute);
      }
    }

    return expanded;
  }

  /// Used to obtain a [InheritedAttribute] from [MixInheritedAttributes].
  ///
  /// Obtain with `mixContext.attributesOfType<MyInheritedAttribute>()`.
  T? attributesOfType<T extends InheritedAttribute>() {
    return _mixValues.attributesOfType<T>();
  }

  T dependOnAttributesOfType<T extends InheritedAttribute>() {
    final attribute = _mixValues.attributesOfType<T>();

    if (attribute is! T) {
      throw '''
      No $T could be found starting from MixContext 
      when call mixContext.attributesOfType<$T>(). This can happen because you 
      have not create a Mix with $T.
      ''';
    }

    return attribute;
  }

  Iterable<T> directivesOfType<T extends DirectiveAttribute>() {
    return _mixValues.directivesOfType<T>();
  }

  List<DecoratorAttribute> decoratorsOfLocation(
    DecoratorLocation location,
  ) {
    return _mixValues.decoratorsOfLocation(location);
  }

  Mix toMix() {
    return Mix.fromValues(_mixValues);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixContext &&
        other.context == context &&
        other._mixValues == _mixValues;
  }

  @override
  int get hashCode {
    return context.hashCode ^ _mixValues.hashCode;
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
