import '../attributes/attribute.dart';
import '../attributes/decorators/decorator.dart';
import '../attributes/style_attribute.dart';
import '../attributes/variants/variant_attribute.dart';
import '../helpers/attributes_map.dart';
import '../helpers/compare_mixin/compare_mixin.dart';

class StyleMixData with Comparable {
  final AttributesMap<Decorator>? _decorators;
  final AttributesMap<ContextVariantAttribute>? _contextVariants;

  final AttributesMap<VariantAttribute>? _variants;
  final AttributesMap<StyleAttribute>? _attributes;

  const StyleMixData({
    required AttributesMap<StyleAttribute>? attributes,
    required AttributesMap<VariantAttribute>? variants,
    required AttributesMap<Decorator>? decorators,
    required AttributesMap<ContextVariantAttribute>? contextVariants,
  })  : _attributes = attributes,
        _variants = variants,
        _decorators = decorators,
        _contextVariants = contextVariants;

  /// Creates a new [StyleMixData] instance from the provided [Iterable] of [Attribute]s.
  /// No longer expands nested attributes.
  factory StyleMixData.create(Iterable<Attribute> attributes) {
    final variantList = <VariantAttribute>[];
    final contextVariantList = <ContextVariantAttribute>[];
    final attributeList = <StyleAttribute>[];
    final decoratorList = <Decorator>[];

    for (final attribute in attributes) {
      if (attribute is StyleAttribute) {
        attributeList.add(attribute);
      } else if (attribute is Decorator) {
        decoratorList.add(attribute);
      } else if (attribute is VariantAttribute) {
        if (attribute is ContextVariantAttribute) {
          contextVariantList.add(attribute);
        } else {
          variantList.add(attribute);
        }
      }
    }

    return StyleMixData(
      attributes: AttributesMap.fromIterable(attributeList),
      variants: AttributesMap.fromIterable(variantList),
      decorators: AttributesMap.fromIterable(decoratorList),
      contextVariants: AttributesMap.fromIterable(contextVariantList),
    );
  }

  /// An empty [StyleMixData] instance with no attributes, decorators, variants, or directives.
  const StyleMixData.empty()
      : _attributes = null,
        _decorators = null,
        _variants = null,
        _contextVariants = null;

  AttributesMap<StyleAttribute> get attributes {
    return _attributes ?? const AttributesMap.empty();
  }

  AttributesMap<VariantAttribute> get variants {
    return _variants ?? const AttributesMap.empty();
  }

  AttributesMap<Decorator> get decorators {
    return _decorators ?? const AttributesMap.empty();
  }

  AttributesMap<ContextVariantAttribute> get contextVariants {
    return _contextVariants ?? const AttributesMap.empty();
  }

  bool get hasVariants => variants.isNotEmpty;

  bool get hasContextVariants => contextVariants.isNotEmpty;

  bool get hasAttributes => attributes.isNotEmpty;

  bool get isEmpty => !hasVariants && !hasContextVariants && !hasAttributes;

  bool get isNotEmpty => !isEmpty;

  int get length {
    return variants.length + contextVariants.length + attributes.length;
  }

  /// Returns an instance of the specified [StyleAttribute] type from the [MixData].
  A? attributesOfType<A extends StyleAttribute>() {
    return attributes.ofType<A>() as A?;
  }

  /// Returns an [Iterable] of [Attribute]s containing all attributes, variants, and directives.
  /// TODO: Review if shoudl return decorartors
  Iterable<Attribute> toAttributes() {
    return [
      ...attributes.toList(),
      ...variants.toList(),
      ...contextVariants.toList(),
    ];
  }

  /// Creates a new [StyleMixData] instance by replacing the specified attributes with new values.
  StyleMixData copyWith({
    AttributesMap<StyleAttribute>? attributes,
    AttributesMap<Decorator>? decorators,
    AttributesMap<VariantAttribute>? variants,
    AttributesMap<ContextVariantAttribute>? contextVariants,
  }) {
    return StyleMixData(
      attributes: this.attributes.merge(attributes),
      variants: this.variants.merge(variants),
      decorators: this.decorators.merge(decorators),
      contextVariants: this.contextVariants.merge(contextVariants),
    );
  }

  /// Creates a new [StyleMixData] instance with the same attributes, variants, and directives.
  StyleMixData clone() {
    return StyleMixData(
      attributes: attributes.clone(),
      variants: variants.clone(),
      decorators: decorators.clone(),
      contextVariants: contextVariants.clone(),
    );
  }

  /// Merges the current [StyleMixData] instance with another [StyleMixData] instance.
  StyleMixData merge(StyleMixData? other) {
    if (other == null || other.isEmpty) return this;

    return copyWith(
      attributes: other.attributes,
      decorators: other.decorators,
      variants: other.variants,
      contextVariants: other.contextVariants,
    );
  }

  @override
  get props => [attributes, decorators, variants, contextVariants];
}
