import '../../mix.dart';
import '../attributes/nested_attribute.dart';
import '../decorators/decorator.dart';
import '../helpers/equality_mixin/equality_mixin.dart';
import '../helpers/mergeable_map.dart';
import '../variants/variant_attribute.dart';

class StyleMixData with EqualityMixin {
  final MergeableMap<StyledWidgetAttributes>? attributes;
  final MergeableMap<WidgetDecorator>? decorators;
  final List<VariantAttribute> variants;
  final List<ContextVariantAttribute> contextVariants;

  const StyleMixData({
    required this.attributes,
    required this.decorators,
    required this.variants,
    required this.contextVariants,
  });

  /// Creates a new [StyleMixData] instance from the provided [Iterable] of [StyleAttribute]s.
  /// No longer expands nested attributes.
  factory StyleMixData.create(Iterable<StyleAttribute> attributes) {
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
        // Breakdown different types of variant attributes
        if (attribute is ContextVariantAttribute) {
          contextVariantList.add(attribute);
        } else {
          variantList.add(attribute);
        }
      }
    }

    return StyleMixData(
      attributes: MergeableMap(attributeList),
      decorators: MergeableMap(decoratorList),
      variants: variantList,
      contextVariants: contextVariantList,
    );
  }

  bool get hasVariants => variants.isNotEmpty;

  bool get hasContextVariants => contextVariants.isNotEmpty;

  bool get hasAttributes => attributes?.isNotEmpty == true;

  bool get isEmpty => !hasVariants && !hasContextVariants && !hasAttributes;

  bool get isNotEmpty => !isEmpty;

  int get length {
    return variants.length + contextVariants.length + (attributes?.length ?? 0);
  }

  /// Returns an instance of the specified [StyledWidgetAttributes] type from the [MixData].
  A? attributesOfType<A extends StyledWidgetAttributes>() {
    return attributes?[A] as A?;
  }

  /// Returns an [Iterable] of [StyleAttribute]s containing all attributes, variants, and directives.
  Iterable<StyleAttribute> toAttributes() {
    return [
      ...?attributes?.values,
      ...variants,
      ...contextVariants,
    ];
  }

  /// Creates a new [StyleMixData] instance by replacing the specified attributes with new values.
  StyleMixData copyWith({
    MergeableMap<StyledWidgetAttributes>? attributes,
    MergeableMap<WidgetDecorator>? decorators,
    List<VariantAttribute>? variants,
    List<ContextVariantAttribute>? contextVariants,
  }) {
    return StyleMixData(
      attributes: this.attributes?.merge(attributes) ?? attributes,
      decorators: this.decorators?.merge(decorators) ?? decorators,
      variants: [...this.variants, ...?variants],
      contextVariants: [...this.contextVariants, ...?contextVariants],
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

  /// Creates a new [StyleMixData] instance with the same attributes, variants, and directives.
  StyleMixData clone() {
    return StyleMixData(
      attributes: attributes?.clone(),
      decorators: decorators?.clone(),
      variants: [...variants],
      contextVariants: [...contextVariants],
    );
  }

  /// Expands nested attributes from the provided [Iterable] of [StyleAttribute]s.
  static Iterable<StyleAttribute> _expandNestedAttributes(
    Iterable<StyleAttribute> attributes,
  ) {
    return attributes.expand((attribute) {
      if (attribute is NestedStyleAttribute) {
        final nestedMix = attribute.style;

        return _expandNestedAttributes(nestedMix.toAttributes());
      } else {
        return [attribute];
      }
    });
  }

  /// An empty [StyleMixData] instance with no attributes, decorators, variants, or directives.
  const StyleMixData.empty()
      : attributes = null,
        decorators = null,
        variants = const [],
        contextVariants = const [];

  @override
  get props => [attributes, decorators, variants, contextVariants];
}
