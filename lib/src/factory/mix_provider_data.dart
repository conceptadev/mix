// Necessary packages are imported at the start of the file.
import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../core/decorators/decorator.dart';
import '../helpers/attributes_map.dart';
import '../helpers/compare_mixin.dart';
import '../theme/mix_theme.dart';

/// This class is used for encapsulating all [MixData] related operations.
/// It contains a mixture of properties and methods useful for handling different attributes,
/// decorators and token resolvers.
@immutable
class MixData with Comparable {
  // Instance variables for widget attributes, widget decorators and token resolver.
  final VisualAttributeMap _attributes;

  final BuildContextResolver _resolver;

  /// A Private constructor for the [MixData] class t hat initializes its main variables.
  ///
  /// It takes in [attributes], [decorators] and [resolver] as required parameters.
  MixData({
    required BuildContextResolver resolver,
    required VisualAttributeMap attributes,
  })  : _attributes = attributes,
        _resolver = resolver;

  /// Getter method for [BuildContextResolver].
  ///
  /// Returns current [_resolver].
  BuildContextResolver get resolver => _resolver;

  /// A getter method for [_decorators].
  ///
  /// Returns a list of all [Decorator].
  List<T> decoratorOfType<T extends Decorator>() =>
      _attributes.whereType<T>().toList();

  /// Retrieves an instance of the specified [VisualAttribute] type from the [MixData].
  /// d
  /// Accepts a type parameter [Attr] which extends [VisualAttribute].
  /// Returns the instance of type [Attr] if found, else returns null.
  T? attributeOfType<T extends VisualAttribute>() {
    return _attributes.attributeOfType<T>();
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
    return MixData(
      resolver: _resolver,
      attributes: other._attributes.merge(_attributes),
    );
  }

  /// Overrides the getter function of [props] from [Comparable] to specify properties necessary for distinguishing instances.
  ///
  /// Returns a list of properties [_attributes] & [_decorators].
  @override
  get props => [_attributes];
}
