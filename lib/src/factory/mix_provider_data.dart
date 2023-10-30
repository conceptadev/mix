// Necessary packages are imported at the start of the file.
import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../core/decorators/decorator.dart';
import '../helpers/attributes_map.dart';
import '../helpers/compare_mixin.dart';
import '../helpers/extensions/iterable_ext.dart';
import '../theme/mix_theme.dart';

/// This class is used for encapsulating all [MixData] related operations.
/// It contains a mixture of properties and methods useful for handling different attributes,
/// decorators and token resolvers.
@immutable
class MixData with Comparable {
  // Instance variables for widget attributes, widget decorators and token resolver.
  final AttributeMap _attributes;

  final BuildContextResolver _resolver;

  /// A Private constructor for the [MixData] class that initializes its main variables.
  ///
  /// It takes in [styles], [decorators] and [resolver] as required parameters.
  MixData({
    required BuildContextResolver resolver,
    required AttributeMap styles,
  })  : _attributes = styles,
        _resolver = resolver;

  /// Getter method for [BuildContextResolver].
  ///
  /// Returns current [_resolver].
  BuildContextResolver get resolver => _resolver;

  List<Decorator> get decorators {
    return _attributes.whereType<Decorator>().toList();
  }

  /// A getter method for [_decorators].
  ///
  /// Returns a list of all [Decorator].
  List<T> whereDecoratorsOfType<T extends Decorator>() {
    return _attributes.whereType<T>().toList();
  }

  /// Retrieves an instance of the specified [StyleAttribute] type from the [MixData].
  ///
  /// Accepts a type parameter [Attr] which extends [StyleAttribute].
  /// Returns the instance of type [Attr] if found, else returns null.
  Attr? attributeOfType<Attr extends Attribute>() {
    return _attributes.whereType<Attr>().firstMaybeNull;
  }

  R? get<Attr extends StyleAttribute<R>, R>() {
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
      styles: other._attributes.merge(_attributes),
    );
  }

  /// Overrides the getter function of [props] from [Comparable] to specify properties necessary for distinguishing instances.
  ///
  /// Returns a list of properties [_attributes] & [_decorators].
  @override
  get props => [_attributes];
}
