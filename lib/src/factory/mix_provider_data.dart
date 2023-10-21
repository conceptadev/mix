// Necessary packages are imported at the start of the file.
import 'package:flutter/material.dart';

import '../attributes/common_attribute.dart';
import '../attributes/style_attribute.dart';
import '../core/decorators/decorator.dart';
import '../helpers/attributes_map.dart';
import '../helpers/compare_mixin.dart';
import '../theme/mix_theme.dart';
import 'exports.dart';

/// This class is used for encapsulating all [MixData] related operations.
/// It contains a mixture of properties and methods useful for handling different attributes,
/// decorators and token resolvers.
@immutable
class MixData with Comparable {
  final bool animated;

  // Instance variables for widget attributes, widget decorators and token resolver.
  final StylesMap _styles;

  final BuildContextResolver _resolver;

  /// A Private constructor for the [MixData] class that initializes its main variables.
  ///
  /// It takes in [styles], [decorators] and [resolver] as required parameters.
  MixData._({
    required BuildContextResolver resolver,
    required StylesMap styles,
    required this.animated,
  })  : _styles = styles,
        _resolver = resolver;

  /// Factory constructor that uses the provided [context] and [style]
  /// to create an instance of [MixData].
  factory MixData.create({
    required BuildContext context,
    required StyleMix style,
    bool animated = false,
  }) {
    final values = applyContextVariants(style.values, context);

    return MixData._(
      resolver: BuildContextResolver(context),
      styles: values.styles,
      animated: animated,
    );
  }

  /// Getter method for [BuildContextResolver].
  ///
  /// Returns current [_resolver].
  BuildContextResolver get resolver => _resolver;

  TextDirection get directionality => _resolver.directionality;

  CommonSpec get commonSpec {
    return maybeGet<CommonAttributes, CommonSpec>() ?? CommonSpec.defaults;
  }

  List<Decorator> get decorators {
    return _styles.whereType<Decorator>().toList();
  }

  /// A getter method for [_decorators].
  ///
  /// Returns a list of all [Decorator].
  List<T> whereDecoratorsOfType<T extends Decorator>() {
    return _styles.whereType<T>().toList();
  }

  /// Retrieves an instance of the specified [StyleAttribute] type from the [MixData].
  ///
  /// Accepts a type parameter [A] which extends [StyleAttribute].
  /// Returns the instance of type [A] if found, else returns null.
  A? attributeOf<A extends StyleAttribute>() {
    return _styles.whereType<A>() as A?;
  }

  R? maybeGet<Attr extends StyleAttribute<R>, R>() {
    return attributeOf<Attr>()?.resolve(this);
  }

  R get<Attr extends StyleAttribute<R>, R>(R defaultValue) {
    final attribute = attributeOf<Attr>();

    return attribute?.resolve(this) ?? defaultValue;
  }

  S spec<S extends Spec<S>>() {
    final attribute = attributeOf<StyleAttribute<S>>();

    return (attribute as SpecAttribute<S>).resolve(this);
  }

  /// Retrieves an instance of attributes based on the type provided.
  ///
  /// The type [T] here refers to the type extending [StyleAttribute].
  /// An exception is thrown if no attribute of the required type is found.
  T dependOnAttributesOf<T extends StyleAttribute>() {
    final attribute = attributeOf<T>();

    if (attribute is! T) {
      throw Exception(
        'No $T could be found starting from MixContext '
        'when call mixContext.attributesOfType<$T>(). This can happen because you '
        'have not create a Mix with $T.',
      );
    }

    return attribute;
  }

  /// This is similar to a merge behavior however it prioritizes the current properties
  /// over the other properties, essentially using [MixData] `other` as the base for this instance.
  ///
  /// [other] is the other [MixData] instance that is to be merged with current instance.
  /// Returns a new instance of [MixData] which is actually a merge of current and other instance.
  MixData merge(MixData other) {
    return MixData._(
      resolver: _resolver,
      styles: other._styles.merge(_styles),
      animated: animated,
    );
  }

  /// Overrides the getter function of [props] from [Comparable] to specify properties necessary for distinguishing instances.
  ///
  /// Returns a list of properties [_styles] & [_decorators].
  @override
  get props => [_styles, animated];
}
