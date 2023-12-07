// ignore_for_file: non_constant_identifier_names, constant_identifier_names, long-parameter-list, prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';

import '../attributes/style_mix_attribute.dart';
import '../attributes/variant_attribute.dart';
import '../core/attribute.dart';
import '../core/attributes_map.dart';
import '../helpers/compare_mixin.dart';
import '../specs/container/container_attribute.dart';
import '../specs/flex/flex_attribute.dart';
import '../specs/image/image_attribute.dart';
import '../specs/stack/stack_attribute.dart';
import '../specs/text/text_attribute.dart';
import '../utils/helper_util.dart';
import '../variants/variant.dart';

typedef Mix = StyleMix;

/// A utility class for managing a collection of styling attributes and variants.
///
/// The `StyleMix` class is used to encapsulate a set of styling attributes and
/// variants which can be applied to a widget. This class provides several
/// factory constructors and utility methods to help create, manipulate, and
/// merge collections of styling attributes and variants.
///
/// Example:
/// ```dart
/// final style = StyleMix(attribute1, attribute2, attribute3);
/// final updatedStyle = style.selectVariant(myVariant);
/// ```
class StyleMix with Comparable {
  /// Visual attributes contained in this mix.
  final AttributeMap<StyleAttribute> styles;

  /// The variant attributes contained in this mix.
  final AttributeMap<VariantAttribute> variants;

  static final stack = SpreadFunctionParams(_styleType<StackSpecAttribute>());
  static final text = SpreadFunctionParams(_styleType<TextSpecAttribute>());
  static final image = SpreadFunctionParams(_styleType<ImageSpecAttribute>());
  static final container =
      SpreadFunctionParams(_styleType<ContainerSpecAttribute>());
  static final flex = SpreadFunctionParams(_styleType<FlexSpecAttribute>());

  /// A constant, empty mix for use with const constructor widgets.
  ///
  /// This can be used as a default or initial value where a `StyleMix` is required.
  const StyleMix.empty()
      : styles = const AttributeMap.empty(),
        variants = const AttributeMap.empty();

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
    ].whereType<Attribute>();

    return StyleMix.create(params);
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
    final styleList = <StyleAttribute>[];

    for (final attribute in attributes) {
      if (attribute is StyleAttribute) {
        styleList.add(attribute);
      } else if (attribute is VariantAttribute) {
        variantList.add(attribute);
      } else if (attribute is StyleMixAttribute) {
        variantList.addAll(attribute.value.variants.values);
        styleList.addAll(attribute.value.styles.values);
      } else {
        throw UnsupportedError('Unsupported attribute type: $attribute');
      }
    }

    return StyleMix._(
      styles: AttributeMap(styleList),
      variants: AttributeMap(variantList),
    );
  }

  /// Selects a mix based on a [condition].
  ///
  /// Returns [fallback] if the [condition] is true, otherwise returns [style].
  ///
  /// Example:
  /// ```dart
  /// final style = StyleMix.chooser(condition, style, fallbackStyle);
  /// ```
  factory StyleMix.chooser(
    bool condition,
    StyleMix style, [
    StyleMix? fallback,
  ]) {
    return condition ? style : fallback ?? const StyleMix.empty();
  }

  /// Combines an optional positional list of [mixes] into a single `StyleMix`.
  ///
  /// This factory constructor iterates through the list of [mixes] params, merging
  /// each mix with the previous mix and returning the final combined `StyleMix`.
  ///
  /// Example:
  /// ```dart
  /// final combinedStyle = StyleMix.combineList([style1, style2, style3]);
  /// ```
  factory StyleMix.combineList(Iterable<StyleMix> mixes) {
    return mixes.isEmpty
        ? const StyleMix.empty()
        : mixes.reduce((combinedStyle, mix) => combinedStyle.merge(mix));
  }

  /// Combines an optional positional list of [StyleMix] instances into a single `StyleMix`.
  ///
  /// This factory constructor iterates through the non-null parameters, merging
  /// each `StyleMix` instance with the previous one and returning the final combined `StyleMix`.
  /// If a null value is provided for any of the parameters, it is ignored.
  ///
  /// Example:
  /// ```dart
  /// final style1 = StyleMix(...);
  /// final style2 = StyleMix(...);
  /// final style3 = StyleMix(...);
  ///
  /// final combinedStyle = StyleMix.combine(style1, style2, style3);
  /// ```
  ///
  /// In this example:
  /// - Three `StyleMix` instances `style1`, `style2`, and `style3` are created.
  /// - The `combine` factory constructor is called with `style1`, `style2`, and `style3` as arguments.
  /// - The `combine` method returns a new `StyleMix` instance `combinedStyle` with the visual and variant attributes of `style1`, `style2`, and `style3` combined.
  static SpreadFunctionParams<StyleMix, StyleMix> get combine =>
      const SpreadFunctionParams(StyleMix.combineList);

  /// Returns a list of all attributes contained in this mix.
  ///
  /// This includes both visual and variant attributes.
  Iterable<Attribute> get values => [...styles.values, ...variants.values];

  /// Returns true if this StyleMix does not contain any attributes or variants.
  bool get isEmpty => styles.isEmpty && variants.isEmpty;

  /// Returns false if this StyleMix contains any attributes or variants.
  bool get isNotEmpty => !isEmpty;

  /// Returns the length of the list of attributes contained in this mix.
  ///
  /// This includes both visual and variant attributes.
  int get length => values.length;

  /// Selects a single or positional params list of [Variant] and returns a new `StyleMix` with the selected variants.
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
  SpreadFunctionParams<Variant, StyleMix> get selectVariant {
    return SpreadFunctionParams(selectVariantList);
  }

  /// Returns a new `StyleMix` with the provided [styles] and [variants] merged with this mix's values.
  ///
  /// If [styles] or [variants] is null, the corresponding attribute map of this mix is used.
  StyleMix copyWith({
    AttributeMap<StyleAttribute>? styles,
    AttributeMap<VariantAttribute>? variants,
  }) {
    return StyleMix._(
      styles: styles ?? this.styles,
      variants: variants ?? this.variants,
    );
  }

  /// Merges this mix with the provided [StyleMix] instances and returns the resulting `StyleMix`.
  ///
  /// This method combines the visual and variant attributes of this mix and the provided [StyleMix] instances.
  /// If a null value is provided for any of the parameters, it is ignored.
  ///
  /// This method combines the visual and variant attributes of this mix and the provided [mix].
  StyleMix merge(StyleMix? mix) {
    if (mix == null) return this;

    final mergedStyles = styles.merge(mix.styles);
    final mergedVariants = variants.merge(mix.variants);

    return copyWith(styles: mergedStyles, variants: mergedVariants);
  }

  /// Selects multiple [Variant] instances and returns a new `StyleMix` with the selected variants.
  ///
  /// If the [selectVariantList] list is empty, returns this mix without any changes.
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
  StyleMix selectVariantList(Iterable<Variant> selectedVariants) {
    /// Return the original StyleMix if no variants were selected
    if (selectedVariants.isEmpty) {
      return this;
    }

    /// Initializing two empty lists that store the matched and remaining `Variants`, respectively.
    final matchedVariants = <VariantAttribute>[];
    final remainingVariants = <VariantAttribute>[];

    /// Convert the selected variants list into a set for efficient lookup.
    /// A set does not contain duplicate elements and lookup time is O(1), making it faster than list lookup.
    final selectedVariantSet = selectedVariants.toSet();

    /// Loop over all VariantAttributes in variants only once instead of a nested loop,
    /// checking if each one matches with the selected variants.
    /// If it does, add it to the matchedVariants, else add it to remainingVariants.
    for (final attr in variants.values) {
      if (attr is MultiVariantAttribute) {
        if (attr.matches(selectedVariants)) {
          // if all variants match, add it to the matchedVariants
          matchedVariants.add(attr);
        } else {
          // Remove any matching variants and add it as a new MultiVariantAttribute
          // This allows to multiple matching variants to be removed
          // For multi pass matching
          remainingVariants.add(attr.remove(selectedVariants));
        }
      } else {
        if (selectedVariantSet.contains(attr.variant)) {
          matchedVariants.add(attr);
        } else {
          remainingVariants.add(attr);
        }
      }
    }

    final updatedStyle = StyleMix._(
      styles: styles,
      variants: AttributeMap(remainingVariants),
    );

    /// If not a single variant was matched, return the original StyleMix.
    if (matchedVariants.isEmpty) {
      return updatedStyle;
    }

    /// Create a StyleMix from the matched variants.
    final styleToApply =
        StyleMix.combineList(matchedVariants.map((e) => e.value).toList());

    /// Merge the new StyleMix created with the existing StyleMix, excluding the matched variants.
    final mergedStyle = updatedStyle.merge(styleToApply);

    /// Apply all variants and return the final StyleMix.
    return mergedStyle.selectVariantList(selectedVariants);
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
  StyleMix pickVariants(
    List<Variant> pickedVariants, {
    bool isRecursive = false,
  }) {
    final matchedVariants = <VariantAttribute>[];

    // Return an empty StyleMix if the list of picked variants is empty

    for (final variantAttr in variants.values) {
      if (pickedVariants.contains(variantAttr.variant)) {
        matchedVariants.add(variantAttr);
      }
    }
    if (pickedVariants.isEmpty || matchedVariants.isEmpty) {
      return isRecursive ? this : const StyleMix.empty();
    }

    final pickedStyle =
        StyleMix.combineList(matchedVariants.map((e) => e.value));

    return pickedStyle.pickVariants(pickedVariants, isRecursive: true);
  }

  /// Selects variants based on a [cases] map and returns a new `StyleMix` with the selected variants.
  ///
  /// The [cases] list contains [SwitchCondition] instances, each of which contains a boolean [condition] and a [Variant].
  /// If a condition is true, the corresponding [Variant] is selected.
  ///
  /// Example:
  /// ```dart
  /// final highContrastVariant = Variant('highContrast');
  /// final largeFontVariant = Variant('largeFont');
  ///
  /// final style = StyleMix();
  /// final updatedStyle = style.variantSwitcher([
  ///   const ConditionChooser(useHighContrast, highContrastVariant),
  ///   const ConditionChooser(useLargeFont, largeFontVariant)
  /// ]);
  /// ```
  ///
  /// In this example:
  /// - Two `Variant` instances are created to represent high contrast and large font styling preferences.
  /// - An initial `StyleMix` instance is created.
  /// - The `variantSwitcher` method is called on the `StyleMix` instance with a map of conditions and variants.
  /// - The conditions `useHighContratst` and `useLargeFont` are hypothetical boolean values representing user preferences.
  /// - If a condition is true, the corresponding `Variant` is selected and applied to the `StyleMix` instance, creating an `updatedStyle` instance with the selected variants.
  StyleMix variantSwitcher(List<SwitchCondition<Variant>> cases) {
    List<Variant> variantsToApply = [];

    for (SwitchCondition<Variant> conditionCase in cases) {
      if (conditionCase.condition) {
        variantsToApply.add(conditionCase.value);
      }
    }

    return selectVariantList(variantsToApply);
  }

  @override
  get props => [styles, variants];
}

/// A class representing a condition-value pair.
///
/// This class is immutable, meaning that once an instance is created, it cannot be changed.
/// This is useful in cases where you want to ensure that the condition-value pair remains constant,
/// such as when using it in a switch statement.
@immutable
class SwitchCondition<T> {
  final bool condition;
  final T value;

  const SwitchCondition(this.condition, this.value);
}

StyleMix Function(Iterable<T> attributes)
    _styleType<T extends ResolvableAttribute<T, dynamic>>() {
  return (Iterable<T> attributes) {
    final merged = attributes.reduce((value, element) => value.merge(element));

    return StyleMix(merged);
  };
}
