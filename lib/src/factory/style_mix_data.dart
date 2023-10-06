import '../attributes/exports.dart';
import '../decorators/decorator.dart';
import '../helpers/attributes_map.dart';
import '../helpers/compare_mixin/compare_mixin.dart';
import '../variants/variant_attribute.dart';

class StyleMixData with CompareMixin {
  final AttributesMap<WidgetDecorator>? _decorators;
  final AttributesMap<ContextVariantAttribute>? _contextVariants;

  final AttributesMap<VariantAttribute>? _variants;
  final AttributesMap<StyledWidgetAttributes>? _attributes;

  const StyleMixData({
    required AttributesMap<StyledWidgetAttributes>? attributes,
    required AttributesMap<VariantAttribute>? variants,
    required AttributesMap<WidgetDecorator>? decorators,
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
    final attributeList = <StyledWidgetAttributes>[];
    final decoratorList = <WidgetDecorator>[];

    for (final attribute in attributes) {
      if (attribute is StyledWidgetAttributes) {
        attributeList.add(attribute);
      } else if (attribute is WidgetDecorator) {
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

  AttributesMap<StyledWidgetAttributes> get attributes {
    return _attributes ?? const AttributesMap.empty();
  }

  AttributesMap<VariantAttribute> get variants {
    return _variants ?? const AttributesMap.empty();
  }

  AttributesMap<WidgetDecorator> get decorators {
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

  /// Returns an instance of the specified [StyledWidgetAttributes] type from the [MixData].
  A? attributesOfType<A extends StyledWidgetAttributes>() {
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
    AttributesMap<StyledWidgetAttributes>? attributes,
    AttributesMap<WidgetDecorator>? decorators,
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
