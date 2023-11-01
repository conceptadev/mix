// ignore_for_file: non_constant_identifier_names, constant_identifier_names, long-parameter-list

import '../attributes/variant_attribute.dart';
import '../attributes/wrapped_attribute.dart';
import '../core/attribute.dart';
import '../core/variants/variant.dart';

/// A utility class for managing a collection of styling attributes and variants.
///
/// The `StyleMix` class is used to encapsulate a set of styling attributes and
/// variants which can be applied to a widget. This class provides several
/// factory constructors and utility methods to help create, manipulate, and
/// merge collections of styling attributes and variants.
///
/// Example:
/// ```dart
/// final style = StyleMix.create([...]);
/// final updatedStyle = style.selectVariant(myVariant);
/// ```
class StyleMix {
  /// A constant, empty mix for use with const constructor widgets.
  ///
  /// This can be used as a default or initial value where a `StyleMix` is required.
  static const empty = StyleMix._(styles: [], variants: []);

  /// A map of visual attributes contained in this mix.
  final List<VisualAttribute> styles;

  /// A map of variant attributes contained in this mix.
  final List<VariantAttribute> variants;

  const StyleMix._({required this.styles, required this.variants});

  /// Creates a new `StyleMix` instance with a specified list of [Attribute]s.
  ///
  /// This factory constructor initializes a `StyleMix` with a list of
  /// attributes provided as individual parameters. Only non-null attributes
  /// are included in the resulting `StyleMix`.
  ///
  /// There is no specific reason for only 20 parameters. This is just a
  /// reasonable number of parameters to support. If you need more than 20,
  /// consider breaking up your mixes into many style mixes that can be applied
  ///
  /// Example:
  /// ```dart
  /// final style = StyleMix(attribute1, attribute2, attribute3);
  /// ```
  factory StyleMix([
    Attribute? p1,
    Attribute? p2,
    Attribute? p3,
    Attribute? p4,
    Attribute? p5,
    Attribute? p6,
    Attribute? p7,
    Attribute? p8,
    Attribute? p9,
    Attribute? p10,
    Attribute? p11,
    Attribute? p12,
    Attribute? p13,
    Attribute? p14,
    Attribute? p15,
    Attribute? p16,
    Attribute? p17,
    Attribute? p18,
    Attribute? p19,
    Attribute? p20,
  ]) {
    final params = [
      p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, //
      p11, p12, p13, p14, p15, p16, p17, p18, p19, p20,
    ];

    final nonNullParams = params.where((p) => p != null) as Iterable<Attribute>;

    return StyleMix.create(nonNullParams);
  }

  /// Constructs a `StyleMix` from an iterable of [Attribute] instances.
  ///
  /// This factory constructor segregates the attributes into visual and variant
  /// attributes, initializing a new `StyleMix` with these segregated collections.
  ///
  /// Example:
  /// ```dart
  /// final style = StyleMix.create([attribute1, attribute2]);
  /// ```
  factory StyleMix.create(Iterable<Attribute> attributes) {
    final variantList = <VariantAttribute>[];
    final styleList = <VisualAttribute>[];

    for (final attribute in attributes) {
      if (attribute is VisualAttribute) {
        styleList.add(attribute);
      } else if (attribute is VariantAttribute) {
        variantList.add(attribute);
      } else if (attribute is WrappedStyleAttribute) {
        variantList.addAll(attribute.value.variants);
        styleList.addAll(attribute.value.styles);
      } else {
        assert(false, 'Unsupported attribute type: $attribute');
      }
    }

    return StyleMix._(styles: styleList, variants: variantList);
  }

  /// Selects a mix based on a [condition].
  ///
  /// Returns [ifTrue] if the [condition] is true, otherwise returns [ifFalse].
  ///
  /// Example:
  /// ```dart
  /// final style = StyleMix.chooser(condition: isItTrue, ifTrue: trueStyle, ifFalse: falseStyle);
  /// ```
  factory StyleMix.chooser({
    required bool condition,
    required StyleMix ifFalse,
    required StyleMix ifTrue,
  }) {
    return condition ? ifTrue : ifFalse;
  }

  /// Combines a list of [mixes] into a single `StyleMix`.
  ///
  /// This factory constructor iterates through the list of [mixes], merging
  /// each mix with the previous mix and returning the final combined `StyleMix`.
  ///
  /// Example:
  /// ```dart
  /// final combinedStyle = StyleMix.combine([style1, style2, style3]);
  /// ```
  factory StyleMix.combine(List<StyleMix> mixes) {
    return mixes.reduce((combinedStyle, mix) => combinedStyle.merge(mix));
  }

  /// Returns a list of all attributes contained in this mix.
  ///
  /// This includes both visual and variant attributes.
  Iterable<Attribute> get values => [...styles, ...variants];

  /// Returns true if this StyleMix does not contain any attributes or variants.
  bool get isEmpty => styles.isEmpty && variants.isEmpty;

  /// Returns false if this StyleMix contains any attributes or variants.
  bool get isNotEmpty => !isEmpty;

  /// Returns a new `StyleMix` with the provided [styles] and [variants] merged with this mix's values.
  ///
  /// If [styles] or [variants] is null, the corresponding attribute map of this mix is used.
  StyleMix copyWith({
    List<VisualAttribute>? styles,
    List<VariantAttribute>? variants,
  }) {
    return StyleMix._(
      styles: [...this.styles, ...?styles],
      variants: [...this.variants, ...?variants],
    );
  }

  /// Merges this mix with the provided [mix] and returns the resulting `StyleMix`.
  ///
  /// This method combines the visual and variant attributes of this mix and the provided [mix].
  StyleMix merge(StyleMix mix) => StyleMix.combine([this, mix]);

  /// Merges this mix with the provided list of [mixes] and returns the resulting `StyleMix`.
  ///
  /// This method combines the visual and variant attributes of this mix and the provided list of [mixes].
  StyleMix mergeMany(List<StyleMix> mixes) =>
      StyleMix.combine([this, ...mixes]);

  /// Merges this mix with the provided nullable [style] and returns the resulting `StyleMix`.
  ///
  /// If [style] is null, returns this `StyleMix`. Otherwise, merges [style] with this `StyleMix`.
  StyleMix mergeNullable(StyleMix? style) =>
      style == null ? this : merge(style);

  /// Selects a single [Variant] and returns a new `StyleMix` with the selected variant.
  ///
  /// If the [variant] is not initially part of the `StyleMix`, this method returns this mix without any changes.
  /// Otherwise, the method merges the attributes of the selected [variant] into a new `StyleMix` instance.
  ///
  /// Example:
  /// ```dart
  /// final outlined = Variant('outlined-button');
  /// final style = StyleMix(
  ///   attr1,
  ///   attr2,
  ///   outlined(attr4, attr5),
  /// );
  /// final updatedStyle = style.selectVariant(outlined);
  /// ```
  ///
  /// In this example:
  /// - An `outlined` instance `outlined` is created to represent an outlined button styling.
  /// - An initial `StyleMix` instance `style` is created with `attr1` and `attr2`, along with the `outlined`.
  /// - The `selectVariant` method is called on the `StyleMix` instance with `outlined` as the argument.
  /// - The `selectVariant` method returns a new `StyleMix` instance `updatedStyle` with the attributes of the selected variant merged.
  /// - The resulting `updatedStyle` is equivalent to `StyleMix(attr1, attr2, attr4, attr5)`.
  ///
  /// Note:
  /// The attributes from the selected variant (`attr4` and `attr5`) are not applied to the `StyleMix` instance until the `selectVariant` method is called.
  StyleMix selectVariant(Variant variant) => selectManyVariants([variant]);

  /// Selects multiple [Variant] instances and returns a new `StyleMix` with the selected variants.
  ///
  /// If the [selectedVariants] list is empty, returns this mix without any changes.
  /// Otherwise, the method merges the attributes of the selected variants into a new `StyleMix` instance.
  ///
  /// Example:
  /// final outlinedVariant = Variant('outlined');
  /// final smallVariant = Variant('small');
  /// final style = StyleMix(
  ///   attr1,
  ///   attr2,
  ///   outlinedVariant(attr3, attr4),
  ///   smallVariant(attr5),
  /// );
  /// final outlinedSmallMix = style.selectVariants([outlinedVariant, smallVariant]);
  /// ```
  ///
  /// In this example:
  /// - Two `Variant` instances `outlinedVariant` and `smallVariant` are created.
  /// - An initial `StyleMix` instance `style` is created with `attr1` and `attr2`, along with the two variants.
  /// - The `selectVariants` method is called on the `StyleMix` instance with a list of `outlinedVariant` and `smallVariant` as the argument.
  /// - The `selectVariants` method returns a new `StyleMix` instance `outlinedSmallMix` with the attributes of the selected variants merged.
  /// - The resulting `outlinedSmallMix` is equivalent to `StyleMix(attr1, attr2, attr3, attr4, attr5)`.
  ///
  /// Note:
  /// The attributes from the selected variants (`attr3`, `attr4`, and `attr5`) are not applied to the `StyleMix` instance until the `selectVariants` method is called.
  StyleMix selectManyVariants(List<Variant> selectedVariants) {
    if (selectedVariants.isEmpty) {
      return this;
    }

    final matchedVariants = <VariantAttribute>[];
    final remainingVariants = <VariantAttribute>[];

    for (final v in selectedVariants) {
      for (VariantAttribute existingVariant in variants) {
        if (existingVariant.variant == v) {
          matchedVariants.add(existingVariant);
        } else {
          remainingVariants.add(existingVariant);
        }
      }
    }

    // Return the current mix if no variants were matched.
    if (matchedVariants.isEmpty) {
      return this;
    }

    // Create a mix from the matched variants.
    final styleToApply = StyleMix.create(matchedVariants);

    // Create a mix with the existing values.
    final updatedStyle = StyleMix._(
      styles: styles,
      variants: remainingVariants,
    ).merge(styleToApply);

    // Make sure to apply all nested variants
    return updatedStyle.selectManyVariants(selectedVariants);
  }

  /// Picks and applies only the attributes within the specified [Variant] instances, and returns a new `StyleMix`.
  ///
  /// Unlike `selectVariants`, `pickVariants` ignores all other attributes initially present in the `StyleMix`.
  ///
  /// If the list of [pickVariants] is empty, returns a new empty `StyleMix`.
  ///
  /// Example:
  /// ```dart
  /// final outlinedVariant = Variant('outlined');
  /// final smallVariant = Variant('small');
  /// final style = StyleMix(attr1, attr2, outlinedVariant(buttonAttr1, buttonAttr2), smallVariant(buttonAttr3));
  /// final pickedMix = style.pickVariants([outlinedVariant, smallVariant]);
  /// ```
  ///
  /// In this example:
  /// - Two `Variant` instances `outlinedVariant` and `smallVariant` are created.
  /// - An initial `StyleMix` instance `style` is created with `attr1` and `attr2`, along with the two variants.
  /// - The `pickVariants` method is called on the `StyleMix` instance with a list of `outlinedVariant` and `smallVariant` as the argument.
  /// - The `pickVariants` method returns a new `StyleMix` instance `pickedMix` with only the attributes of the selected variants, ignoring `attr1` and `attr2`.
  /// - The resulting `pickedMix` is equivalent to `StyleMix(buttonAttr1, buttonAttr2, buttonAttr3)`.
  ///
  /// Note:
  /// The attributes `attr1` and `attr2` from the initial `StyleMix` are ignored, and only the attributes within the specified variants are picked and applied to the new `StyleMix`.

  StyleMix pickVariants(List<Variant> pickedVariants) {
    final matchedVariants = <VariantAttribute>[];

    for (final variantAttr in variants) {
      if (pickedVariants.contains(variantAttr.variant)) {
        matchedVariants.add(variantAttr);
      }
    }

    return StyleMix.create(matchedVariants);
  }

  /// Selects variants based on a [cases] map and returns a new `StyleMix` with the selected variants.
  ///
  /// The [cases] map contains boolean conditions as keys and [Variant] instances as values.
  /// If a condition is true, the corresponding [Variant] is selected.
  ///
  /// Example:
  /// ```dart
  /// final highContrastVariant = Variant('highContrast');
  /// final largeFontVariant = Variant('largeFont');
  ///
  /// final style = StyleMix();
  /// final updatedStyle = style.selectVariantCondition({
  ///   useHighContratst: highContrastVariant,
  ///   useLargeFont: largeFontVariant,
  /// });
  /// ```
  ///
  /// In this example:
  /// - Two `Variant` instances are created to represent high contrast and large font styling preferences.
  /// - An initial `StyleMix` instance is created.
  /// - The `selectVariantCondition` method is called on the `StyleMix` instance with a map of conditions and variants.
  /// - The conditions `useHighContratst` and `useLargeFont` are hypothetical boolean values representing user preferences.
  /// - If a condition is true, the corresponding `Variant` is selected and applied to the `StyleMix` instance, creating an `updatedStyle` instance with the selected variants.
  StyleMix selectVariantCondition(Map<bool, Variant> cases) {
    final keys = cases.keys.toList();
    final variantList = cases.values.toList();

    List<Variant> variantsToApply = [];

    for (int i = 0; i < keys.length; i++) {
      if (keys[i]) {
        variantsToApply.add(variantList[i]);
      }
    }

    return selectManyVariants(variantsToApply);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StyleMix &&
        other.styles == styles &&
        other.variants == variants;
  }

  @override
  int get hashCode => styles.hashCode ^ variants.hashCode;
}
