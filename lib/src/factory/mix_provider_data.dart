// Necessary packages are imported at the start of the file.
import 'package:flutter/material.dart';

import '../core/decorators/decorator.dart';
import '../core/directives/directive_attribute.dart';
import '../core/style_attribute.dart';
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
  final StylesMap _styles;
  final List<Directive> _directives;

  final BuildContextResolver _resolver;

  /// A Private constructor for the [MixData] class that initializes its main variables.
  ///
  /// It takes in [styles], [decorators] and [resolver] as required parameters.
  MixData({
    required BuildContextResolver resolver,
    required StylesMap styles,
    required List<Directive> directives,
  })  : _styles = styles,
        _directives = directives,
        _resolver = resolver;

  /// Getter method for [BuildContextResolver].
  ///
  /// Returns current [_resolver].
  BuildContextResolver get resolver => _resolver;

  TextDirection get directionality => _resolver.directionality;

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
  /// Accepts a type parameter [Attr] which extends [StyleAttribute].
  /// Returns the instance of type [Attr] if found, else returns null.
  Attr? attributeOfType<Attr extends StyleAttribute>() {
    return _styles.whereType<Attr>().firstMaybeNull;
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
      styles: other._styles.merge(_styles),
    );
  }

  /// Overrides the getter function of [props] from [Comparable] to specify properties necessary for distinguishing instances.
  ///
  /// Returns a list of properties [_styles] & [_decorators].
  @override
  get props => [_styles];
}
