// Necessary packages are imported at the start of the file.
import 'package:flutter/material.dart';

import '../attributes/variant_attribute.dart';
import '../core/attribute.dart';
import '../core/decorators/decorator.dart';
import '../helpers/attributes_map.dart';
import '../helpers/compare_mixin.dart';
import '../theme/mix_theme.dart';
import 'style_mix.dart';

/// This class is used for encapsulating all [MixData] related operations.
/// It contains a mixture of properties and methods useful for handling different attributes,
/// decorators and token resolvers.
@immutable
class MixData with Comparable {
  // Instance variables for widget attributes, widget decorators and token resolver.
  final VisualAttributeMap _style;

  final BuildContextResolver _resolver;

  /// A Private constructor for the [MixData] class that initializes its main variables.
  ///
  /// It takes in [styles], [decorators] and [resolver] as required parameters.
  MixData({
    required BuildContextResolver resolver,
    required VisualAttributeMap styles,
  })  : _style = styles,
        _resolver = resolver;

  /// Getter method for [BuildContextResolver].
  ///
  /// Returns current [_resolver].
  BuildContextResolver get resolver => _resolver;

  List<Decorator> get decorators {
    return _style.whereType<Decorator>().toList();
  }

  /// A getter method for [_decorators].
  ///
  /// Returns a list of all [Decorator].
  List<T> decoratorOfType<T extends Decorator>() {
    return _style.whereType<T>().toList();
  }

  /// Retrieves an instance of the specified [VisualAttribute] type from the [MixData].
  ///
  /// Accepts a type parameter [Attr] which extends [VisualAttribute].
  /// Returns the instance of type [Attr] if found, else returns null.
  Attr? attributeOfType<Attr extends VisualAttribute>() {
    return _style.attributeOfType<Attr>();
  }

  R? get<Attr extends VisualAttribute<R>, R>() {
    return attributeOfType<Attr>()?.resolve(this);
  }

  /// This is similar to a merge behavior however it prioritizes the current properties
  /// over the other properties, essentially using [MixData] `other` as the base for this instance.
  ///
  /// [other] is the other [MixData] instance that is to be merged with current instance.
  /// Returns a new instance of [MixData] which is actually a merge of current and other instance.
  MixData merge(MixData other) {
    return MixData(resolver: _resolver, styles: other._style.merge(_style));
  }

  /// Overrides the getter function of [props] from [Comparable] to specify properties necessary for distinguishing instances.
  ///
  /// Returns a list of properties [_style] & [_decorators].
  @override
  get props => [_style];
}

class ResolvedStyleMix with Comparable {
  final VisualAttributeMap _attributes;
  const ResolvedStyleMix(VisualAttributeMap styles) : _attributes = styles;

  factory ResolvedStyleMix.from(StyleMix mix, BuildContext context) {
    StyleMix mergedMix = mix;

    final contextVariants = mix.variants.contextVariants;

    // Once there are no more context variants to apply, return the mix
    if (contextVariants.isEmpty) {
      return ResolvedStyleMix(mix.styles);
    }

    for (ContextVariantAttribute variant in contextVariants) {
      if (variant.when(context)) {
        mergedMix = mergedMix.merge(variant.value);
      }
    }

    return ResolvedStyleMix.from(mergedMix, context);
  }
  VisualAttributeMap get values => _attributes;

  ResolvedStyleMix merge(ResolvedStyleMix other) {
    return ResolvedStyleMix(_attributes.merge(other._attributes));
  }

  @override
  get props => [_attributes];
}
