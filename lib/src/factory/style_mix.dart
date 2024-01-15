// ignore_for_file: non_constant_identifier_names, constant_identifier_names, long-parameter-list, prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';

import '../attributes/nested_style/nested_style_attribute.dart';
import '../attributes/variant_attribute.dart';
import '../core/attribute.dart';
import '../core/attributes_map.dart';
import '../helpers/compare_mixin.dart';
import '../specs/container/box_attribute.dart';
import '../specs/flex/flex_attribute.dart';
import '../specs/image/image_attribute.dart';
import '../specs/stack/stack_attribute.dart';
import '../specs/text/text_attribute.dart';
import '../utils/helper_util.dart';
import '../variants/variant.dart';

typedef Mix = Style;

/// A utility class for managing a collection of styling attributes and variants.
///
/// The `Style` class is used to encapsulate a set of styling attributes and
/// variants which can be applied to a widget. This class provides several
/// factory constructors and utility methods to help create, manipulate, and
/// merge collections of styling attributes and variants.
///
/// Example:
/// ```dart
/// final style = Style(attribute1, attribute2, attribute3);
/// final updatedStyle = style.variant(myVariant);
/// ```
class Style with Comparable {
  /// Visual attributes contained in this mix.
  final AttributeMap<StyleAttribute> styles;

  /// The variant attributes contained in this mix.
  final AttributeMap<VariantAttribute> variants;

  static final stack = SpreadFunctionParams(_styleType<StackSpecAttribute>());
  static final text = SpreadFunctionParams(_styleType<TextSpecAttribute>());
  static final image = SpreadFunctionParams(_styleType<ImageSpecAttribute>());
  static final box = SpreadFunctionParams(_styleType<BoxSpecAttribute>());
  static final flex = SpreadFunctionParams(_styleType<FlexSpecAttribute>());

  /// A constant, empty mix for use with const constructor widgets.
  ///
  /// This can be used as a default or initial value where a `Style` is required.
  const Style.empty()
      : styles = const AttributeMap.empty(),
        variants = const AttributeMap.empty();

  const Style._({required this.styles, required this.variants});

  /// Creates a new `Style` instance with a specified list of [Attribute]s.
  ///
  /// This factory constructor initializes a `Style` with a list of
  /// attributes provided as individual parameters. Only non-null attributes
  /// are included in the resulting `Style`.
  ///
  /// There is no specific reason for only 20 parameters. This is just a
  /// reasonable number of parameters to support. If you need more than 20,
  /// consider breaking up your mixes into many style mixes that can be applied
  ///
  /// Example:
  /// ```dart
  /// final style = Style(attribute1, attribute2, attribute3);
  /// ```
  factory Style([
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

    return Style.create(params);
  }

  /// Constructs a `Style` from an iterable of [Attribute] instances.
  ///
  /// This factory constructor segregates the attributes into visual and variant
  /// attributes, initializing a new `Style` with these segregated collections.
  ///
  /// Example:
  /// ```dart
  /// final style = Style.create([attribute1, attribute2]);
  /// ```
  factory Style.create(Iterable<Attribute> attributes) {
    final variantList = <VariantAttribute>[];
    final styleList = <StyleAttribute>[];

    for (final attribute in attributes) {
      if (attribute is StyleAttribute) {
        styleList.add(attribute);
      } else if (attribute is VariantAttribute) {
        variantList.add(attribute);
      } else if (attribute is NestedStyleAttribute) {
        variantList.addAll(attribute.value.variants.values);
        styleList.addAll(attribute.value.styles.values);
      } else {
        throw UnsupportedError('Unsupported attribute type: $attribute');
      }
    }

    return Style._(
      styles: AttributeMap(styleList),
      variants: AttributeMap(variantList),
    );
  }

  /// Combines a positional list of [mixes] into a single `Style`.
  ///
  /// This factory constructor iterates through the list of [mixes] params, merging
  /// each mix with the previous mix and returning the final combined `Style`.
  ///
  /// Example:
  /// ```dart
  /// final combinedStyle = Style.combine([style1, style2, style3]);
  /// ```
  static Style combine(Iterable<Style> mixes) {
    return mixes.isEmpty
        ? const Style.empty()
        : mixes.reduce((combinedStyle, mix) => combinedStyle.merge(mix));
  }

  /// Selects a mix based on a [condition].
  ///
  /// Returns [fallback] if the [condition] is true, otherwise returns [style].
  ///
  /// Example:
  /// ```dart
  /// final style = Style.chooser(condition, style, fallbackStyle);
  /// ```
  static Style chooser(bool condition, Style style, [Style? fallback]) {
    return condition ? style : fallback ?? const Style.empty();
  }

  Style _addAttributes(List<Attribute> attributes) {
    return merge(Style.create(attributes));
  }

  /// Returns a list of all attributes contained in this mix.
  ///
  /// This includes both visual and variant attributes.
  Iterable<Attribute> get values => [...styles.values, ...variants.values];

  /// Returns true if this Style does not contain any attributes or variants.
  bool get isEmpty => styles.isEmpty && variants.isEmpty;

  /// Returns false if this Style contains any attributes or variants.
  bool get isNotEmpty => !isEmpty;

  /// Returns the length of the list of attributes contained in this mix.
  ///
  /// This includes both visual and variant attributes.
  int get length => values.length;

  /// Selects a single or positional params list of [Variant] and returns a new `Style` with the selected variants.
  ///
  /// If the [variant] is not initially part of the `Style`, this method returns this mix without any changes.
  /// Otherwise, the method merges the attributes of the selected [variant] into a new `Style` instance.
  ///
  /// Example:
  /// ```dart
  /// final outlined = Variant('outlined');
  /// final style = Style(
  ///   attr1,
  ///   attr2,
  ///   outlined(
  ///     attr4,
  ///     attr5,
  ///   ),
  /// );
  /// final updatedStyle = style.variant(outlined);
  /// ```
  ///
  /// In this example:
  /// - An `outlined` instance `outlined` is created to represent an outlined button styling.
  /// - An initial `Style` instance `style` is created with `attr1` and `attr2`, along with the `outlined`.
  /// - The `variant` method is called on the `Style` instance with `outlined` as the argument.
  /// - The `variant` method returns a new `Style` instance `updatedStyle` with the attributes of the selected variant merged.
  /// - The resulting `updatedStyle` is equivalent to `Style(attr1, attr2, attr4, attr5)`.
  ///
  /// Note:
  /// The attributes from the selected variant (`attr4` and `attr5`) are not applied to the `Style` instance until the `variant` method is called.
  SpreadFunctionParams<Variant, Style> get variant {
    return SpreadFunctionParams(variantList);
  }

  /// Allows to create a new `Style` by using this mix as a base and adding additional attributes.
  ///
  /// Example:
  ///
  /// ```dart
  /// final style = Style(attr1, attr2);
  /// final updatedStyle = style.mix(attr3, attr4);
  /// ```
  SpreadFunctionParams<Attribute, Style> get mix =>
      SpreadFunctionParams(_addAttributes);

  /// Returns a new `Style` with the provided [styles] and [variants] merged with this mix's values.
  ///
  /// If [styles] or [variants] is null, the corresponding attribute map of this mix is used.
  Style copyWith({
    AttributeMap<StyleAttribute>? styles,
    AttributeMap<VariantAttribute>? variants,
  }) {
    return Style._(
      styles: styles ?? this.styles,
      variants: variants ?? this.variants,
    );
  }

  /// Merges this mix with the provided [Style] instances and returns the resulting `Style`.
  ///
  /// This method combines the visual and variant attributes of this mix and the provided [Style] instances.
  /// If a null value is provided for any of the parameters, it is ignored.
  ///
  /// This method combines the visual and variant attributes of this mix and the provided [mix].
  Style merge(Style? mix) {
    if (mix == null) return this;

    final mergedStyles = styles.merge(mix.styles);
    final mergedVariants = variants.merge(mix.variants);

    return copyWith(styles: mergedStyles, variants: mergedVariants);
  }

  /// Selects multiple [Variant] instances and returns a new `Style` with the selected variants.
  ///
  /// If the [variantList] list is empty, returns this mix without any changes.
  /// Otherwise, the method merges the attributes of the selected variants into a new `Style` instance.
  ///
  /// Example:
  /// final outlinedVariant = Variant('outlined');
  /// final smallVariant = Variant('small');
  /// final style = Style(
  ///   attr1,
  ///   attr2,
  ///   outlinedVariant(attr3, attr4),
  ///   smallVariant(attr5),
  /// );
  /// final outlinedSmallMix = style.variantList([outlinedVariant, smallVariant]);
  /// ```
  ///
  /// In this example:
  /// - Two `Variant` instances `outlinedVariant` and `smallVariant` are created.
  /// - An initial `Style` instance `style` is created with `attr1` and `attr2`, along with the two variants.
  /// - The `variantList` method is called on the `Style` instance with a list of `outlinedVariant` and `smallVariant` as the argument.
  /// - The `variantList` method returns a new `Style` instance `outlinedSmallMix` with the attributes of the selected variants merged.
  /// - The resulting `outlinedSmallMix` is equivalent to `Style(attr1, attr2, attr3, attr4, attr5)`.
  ///
  /// Note:
  /// The attributes from the selected variants (`attr3`, `attr4`, and `attr5`) are not applied to the `Style` instance until the `variantList` method is called.
  Style variantList(Iterable<Variant> selectedVariants) {
    /// Return the original Style if no variants were selected
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
          matchedVariants.add(attr);
        } else {
          remainingVariants.add(attr);
        }
      } else {
        if (selectedVariantSet.contains(attr.variant)) {
          matchedVariants.add(attr);
        } else {
          remainingVariants.add(attr);
        }
      }
    }

    final updatedStyle = Style._(
      styles: styles,
      variants: AttributeMap(remainingVariants),
    );

    /// If not a single variant was matched, return the original Style.
    if (matchedVariants.isEmpty) {
      return updatedStyle;
    }

    /// Create a Style from the matched variants.
    final styleToApply =
        Style.combine(matchedVariants.map((e) => e.value).toList());

    /// Merge the new Style created with the existing Style, excluding the matched variants.
    final mergedStyle = updatedStyle.merge(styleToApply);

    /// Apply all variants and return the final Style.
    return mergedStyle.variantList(selectedVariants);
  }

  /// Picks and applies only the attributes within the specified [Variant] instances, and returns a new `Style`.
  ///
  /// Unlike `variantList`, `pickVariants` ignores all other attributes initially present in the `Style`.
  ///
  /// If the list of [pickVariants] is empty, returns a new empty `Style`.
  ///
  /// Example:
  /// ```dart
  /// final outlinedVariant = Variant('outlined');
  /// final smallVariant = Variant('small');
  /// final style = Style(attr1, attr2, outlinedVariant(buttonAttr1, buttonAttr2), smallVariant(buttonAttr3));
  /// final pickedMix = style.pickVariants([outlinedVariant, smallVariant]);
  /// ```
  ///
  /// In this example:
  /// - Two `Variant` instances `outlinedVariant` and `smallVariant` are created.
  /// - An initial `Style` instance `style` is created with `attr1` and `attr2`, along with the two variants.
  /// - The `pickVariants` method is called on the `Style` instance with a list of `outlinedVariant` and `smallVariant` as the argument.
  /// - The `pickVariants` method returns a new `Style` instance `pickedMix` with only the attributes of the selected variants, ignoring `attr1` and `attr2`.
  /// - The resulting `pickedMix` is equivalent to `Style(buttonAttr1, buttonAttr2, buttonAttr3)`.
  ///
  /// Note:
  /// The attributes `attr1` and `attr2` from the initial `Style` are ignored, and only the attributes within the specified variants are picked and applied to the new `Style`.
  Style pickVariants(
    List<Variant> pickedVariants, {
    bool isRecursive = false,
  }) {
    final matchedVariants = <VariantAttribute>[];

    // Return an empty Style if the list of picked variants is empty

    for (final variantAttr in variants.values) {
      if (pickedVariants.contains(variantAttr.variant)) {
        matchedVariants.add(variantAttr);
      }
    }
    if (pickedVariants.isEmpty || matchedVariants.isEmpty) {
      return isRecursive ? this : const Style.empty();
    }

    final pickedStyle = Style.combine(matchedVariants.map((e) => e.value));

    return pickedStyle.pickVariants(pickedVariants, isRecursive: true);
  }

  /// Selects variants based on a [cases] map and returns a new `Style` with the selected variants.
  ///
  /// The [cases] list contains [SwitchCondition] instances, each of which contains a boolean [condition] and a [Variant].
  /// If a condition is true, the corresponding [Variant] is selected.
  ///
  /// Example:
  /// ```dart
  /// final highContrastVariant = Variant('highContrast');
  /// final largeFontVariant = Variant('largeFont');
  ///
  /// final style = Style();
  /// final updatedStyle = style.variantSwitcher([
  ///   const ConditionChooser(useHighContrast, highContrastVariant),
  ///   const ConditionChooser(useLargeFont, largeFontVariant)
  /// ]);
  /// ```
  ///
  /// In this example:
  /// - Two `Variant` instances are created to represent high contrast and large font styling preferences.
  /// - An initial `Style` instance is created.
  /// - The `variantSwitcher` method is called on the `Style` instance with a map of conditions and variants.
  /// - The conditions `useHighContratst` and `useLargeFont` are hypothetical boolean values representing user preferences.
  /// - If a condition is true, the corresponding `Variant` is selected and applied to the `Style` instance, creating an `updatedStyle` instance with the selected variants.
  Style variantSwitcher(List<SwitchCondition<Variant>> cases) {
    List<Variant> variantsToApply = [];

    for (SwitchCondition<Variant> conditionCase in cases) {
      if (conditionCase.condition) {
        variantsToApply.add(conditionCase.value);
      }
    }

    return variantList(variantsToApply);
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

Style Function(Iterable<T> attributes)
    _styleType<T extends SpecAttribute<T, dynamic>>() {
  return (Iterable<T> attributes) {
    final merged = attributes.reduce((value, element) => value.merge(element));

    return Style(merged);
  };
}
