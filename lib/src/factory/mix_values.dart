import 'package:flutter/widgets.dart';

import '../attributes/variant_attribute.dart';
import '../core/attribute.dart';
import '../core/decorators/decorator.dart';
import '../helpers/attributes_map.dart';
import '../helpers/compare_mixin.dart';

class MixValues with Comparable {
  /// An empty [MixValues] instance with no attributes, decorators, variants, or directives.
  static const empty = MixValues(
    styles: AttributeMap.empty,
    variants: VariantAttributeMap.empty,
  );

  final AttributeMap styles;

  final VariantAttributeMap variants;

  const MixValues({required this.styles, required this.variants});

  /// Creates a new [MixValues] instance from the provided [Iterable] of [Attribute]s.
  /// No longer expands nested attributes.
  factory MixValues.create(Iterable<Attribute> attributes) {
    final variantList = <VariantAttribute>[];

    final styleList = <VisualAttribute>[];

    for (final attribute in attributes) {
      if (attribute is VisualAttribute) {
        styleList.add(attribute);
      } else if (attribute is VariantAttribute) {
        variantList.add(attribute);
      }
    }

    return MixValues(
      styles: AttributeMap.from(styleList),
      variants: VariantAttributeMap.from(variantList),
    );
  }

  @visibleForTesting
  bool get hasVariants => variants.isNotEmpty;

  bool get hasContextVariants => _contextVariants.isNotEmpty;

  bool get hasStyles => styles.isNotEmpty;

  bool get hasDecorators => _decorators.isNotEmpty;

  bool get isEmpty => !hasVariants && !hasStyles;

  bool get isNotEmpty => !isEmpty;

  int get length {
    return variants.length + styles.length;
  }

  List<ContextVariantAttribute> get _contextVariants {
    return variants.whereType<ContextVariantAttribute>().toList();
  }

  List<Decorator> get _decorators {
    return styles.whereType<Decorator>().toList();
  }

  /// Returns an instance of the specified [VisualAttribute] type from the [MixData].
  A? stylesOfType<A extends VisualAttribute>() {
    return styles.whereType<A>() as A?;
  }

  /// Returns an [Iterable] of [Attribute]s containing all attributes, variants, and directives.

  Iterable<Attribute> toValues() {
    return [...styles.values, ...variants.values];
  }

  /// Creates a new [MixValues] instance by replacing the specified attributes with new values.
  MixValues copyWith({AttributeMap? styles, VariantAttributeMap? variants}) {
    return MixValues(
      styles: this.styles.merge(styles),
      variants: this.variants.merge(variants),
    );
  }

  /// Merges the current [MixValues] instance with another [MixValues] instance.
  MixValues merge(MixValues? other) {
    if (other == null || other.isEmpty) return this;

    return copyWith(styles: other.styles, variants: other.variants);
  }

  @override
  get props => [styles, variants];
}
