import '../../mix.dart';
import '../attributes/nested_attribute.dart';
import '../helpers/equality_mixin/equality_mixin.dart';
import '../helpers/mergeable_map.dart';
import '../variants/variant_attribute.dart';
import '../widgets/box/box.decorator.dart';

class MixValues with EqualityMixin {
  final MergeableMap<WidgetStyleAttributes>? attributes;
  final MergeableMap<WidgetDecorator>? decorators;
  final List<VariantAttribute> variants;
  final List<ContextVariantAttribute> contextVariants;

  const MixValues({
    required this.attributes,
    required this.decorators,
    required this.variants,
    required this.contextVariants,
  });

  /// Creates a new [MixValues] instance from the provided [Iterable] of [StyleAttribute]s.
  factory MixValues.create(Iterable<StyleAttribute> attributes) {
    //TODO: Remove expansion of nested attributes later
    final expanded = _expandNestedAttributes(attributes);

    final variantList = <VariantAttribute>[];
    final contextVariantList = <ContextVariantAttribute>[];
    final attributeList = <WidgetStyleAttributes>[];
    final decoratorList = <WidgetDecorator>[];

    for (final attribute in expanded) {
      if (attribute is WidgetStyleAttributes) {
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

    return MixValues(
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

  /// Returns an instance of the specified [WidgetStyleAttributes] type from the [MixData].
  A? attributesOfType<A extends WidgetStyleAttributes>() {
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

  /// Creates a new [MixValues] instance by replacing the specified attributes with new values.
  MixValues copyWith({
    MergeableMap<WidgetStyleAttributes>? attributes,
    MergeableMap<WidgetDecorator>? decorators,
    List<VariantAttribute>? variants,
    List<ContextVariantAttribute>? contextVariants,
  }) {
    return MixValues(
      attributes: this.attributes?.merge(attributes) ?? attributes,
      decorators: this.decorators?.merge(decorators) ?? decorators,
      variants: [...this.variants, ...?variants],
      contextVariants: [...this.contextVariants, ...?contextVariants],
    );
  }

  /// Merges the current [MixValues] instance with another [MixValues] instance.
  MixValues merge(MixValues? other) {
    if (other == null || other.isEmpty) return this;

    return copyWith(
      attributes: other.attributes,
      decorators: other.decorators,
      variants: other.variants,
      contextVariants: other.contextVariants,
    );
  }

  /// Creates a new [MixValues] instance with the same attributes, variants, and directives.
  MixValues clone() {
    return MixValues(
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

  /// An empty [MixValues] instance with no attributes, decorators, variants, or directives.
  const MixValues.empty()
      : attributes = null,
        decorators = null,
        variants = const [],
        contextVariants = const [];

  @override
  get props => [attributes, decorators, variants, contextVariants];
}
