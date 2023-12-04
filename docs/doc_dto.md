# DTOs

DTO's or Data Transfer Objects are references to other `data classes` within flutter. However the main difference is that they set all the fields as optional which allow for better composability and composition by the utilities, while also allow for better support for value tokens.

## Example

Shadow and BoxShadow, they normally have default values which are set when constructed. By using DTO's we can have nullablev values for each, and also have value tokens like `ColorDto`.

```dart
import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../color/color_dto.dart';

@immutable
abstract class ShadowDtoImpl<Self extends ShadowDtoImpl<Self, Value>,
    Value extends Shadow> extends Dto<Value> with Mergeable<Self> {
  final ColorDto? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowDtoImpl({this.blurRadius, this.color, this.offset});

  @override
  Value resolve(MixData mix);

  @override
  Self merge(Self? other);
}

@immutable
class ShadowDto extends ShadowDtoImpl<ShadowDto, Shadow> {
  const ShadowDto({super.blurRadius, super.color, super.offset});

  static ShadowDto from(Shadow shadow) {
    return ShadowDto(
      blurRadius: shadow.blurRadius,
      color: ColorDto.maybeFrom(shadow.color),
      offset: shadow.offset,
    );
  }

  static ShadowDto? maybeFrom(Shadow? shadow) {
    return shadow == null ? null : from(shadow);
  }

  @override
  Shadow resolve(MixData mix) {
    const defaultShadow = Shadow();

    return Shadow(
      color: color?.resolve(mix) ?? defaultShadow.color,
      offset: offset ?? defaultShadow.offset,
      blurRadius: blurRadius ?? defaultShadow.blurRadius,
    );
  }

  @override
  ShadowDto merge(covariant ShadowDto? other) {
    if (other == null) return this;

    return ShadowDto(
      blurRadius: other.blurRadius ?? blurRadius,
      color: other.color ?? color,
      offset: other.offset ?? offset,
    );
  }

  @override
  get props => [color, offset, blurRadius];
}

class BoxShadowDto extends ShadowDtoImpl<BoxShadowDto, BoxShadow> {
  final double? spreadRadius;

  const BoxShadowDto({
    super.color,
    super.offset,
    super.blurRadius,
    this.spreadRadius,
  });

  static BoxShadowDto from(BoxShadow shadow) {
    return BoxShadowDto(
      color: ColorDto.maybeFrom(shadow.color),
      offset: shadow.offset,
      blurRadius: shadow.blurRadius,
      spreadRadius: shadow.spreadRadius,
    );
  }

  static BoxShadowDto? maybeFrom(BoxShadow? shadow) {
    return shadow == null ? null : from(shadow);
  }

  @override
  BoxShadow resolve(MixData mix) {
    const defaultShadow = BoxShadow();

    return BoxShadow(
      color: color?.resolve(mix) ?? defaultShadow.color,
      offset: offset ?? defaultShadow.offset,
      blurRadius: blurRadius ?? defaultShadow.blurRadius,
      spreadRadius: spreadRadius ?? defaultShadow.spreadRadius,
    );
  }

  @override
  BoxShadowDto merge(BoxShadowDto? other) {
    if (other == null) return this;

    return BoxShadowDto(
      color: other.color ?? color,
      offset: other.offset ?? offset,
      blurRadius: other.blurRadius ?? blurRadius,
      spreadRadius: other.spreadRadius ?? spreadRadius,
    );
  }

  @override
  get props => [color, offset, blurRadius, spreadRadius];
}

```

### Mergeable

- It is important that DTO's are mergeable and allow for values to be set by default to the `other` DTO, unles it does not exist then it should use the current value.
- Also is importantt o know that some fields can be DTO's themselves. In that case we need to merge them as well.

### Resolvable

- It is important that DTO's are resolvable, this means that they can be resolved to their respective data class.

## Tests

It's is very important that DTOs are tested, since they are the main building blocks of the utilities. They are the ones that will be used to create the `Mix` class and the `MixData` class.

Important tests to have are:

- Construct DTO using the constructor.
- Has a from method that creates the DTO from the data class.
- Has a maybeFrom method that creates the DTO from the data class if it is not null.
- Has a resolve method that resolves the DTO to the data class.
- Has a merge method that merges the DTO with another DTO.

## Utilities

```dart
import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../scalars/scalar_util.dart';
import 'shadow_dto.dart';

/// Utility class for creating and manipulating attributes with [Shadow]
///
/// Allows setting of color, offset, and blur radius for a shadow. This class
/// provides a convenient way to configure and apply shadow effects to [T]
///
/// Accepts a builder function that returns [T] and takes a [ShadowDto] as a parameter.
///
/// Example usage:
///
/// ```dart
// final shadow = ShadowUtility<StyleAttribute>(builder);
// final attribute = shadow(
//   color: Colors.black,
//   offset: Offset(2.0, 2.0),
//   blurRadius: 4.0,
// );
/// ```
///
/// See also:
/// * [ShadowDto], the data transfer object for [Shadow]
/// * [MixUtility], the utility class that [ShadowUtility] extends
class ShadowUtility<T extends StyleAttribute> extends MixUtility<T, ShadowDto> {
  const ShadowUtility(super.builder);

  // Internal method to create a shadow with optional parameters.
  T _only({ColorDto? color, Offset? offset, double? blurRadius}) {
    final shadow = ShadowDto(
      blurRadius: blurRadius,
      color: color,
      offset: offset,
    );

    return builder(shadow);
  }

  /// Returns a [ColorUtility] for setting the color of the shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final shadow = ShadowUtility<StyleAttribute>(builder);
  /// final attribute = shadow.color(Colors.black);
  /// ```
  ///
  /// Attribute now holds a [ShadowAttribute] with a [ShadowDto] that has a color value of `Colors.black`.
  ///
  /// See also:
  /// * [ColorUtility], the utility class for manipulating [Color]
  /// * [ColorDto], the data transfer object for [Color]
  ColorUtility<T> get color {
    return ColorUtility((color) => _only(color: color));
  }

  /// Returns an [OffsetUtility] for setting the offset of the shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final shadow = ShadowUtility<StyleAttribute>(builder);
  /// final attribute = shadow.offset(Offset(2.0, 2.0));
  /// ```
  ///
  /// Attribute now holds a [ShadowAttribute] with a [ShadowDto] that has an offset value of `Offset(2.0, 2.0)`.
  ///
  /// See also:
  /// * [OffsetUtility], the utility class for manipulating [Offset]
  /// * [Offset], the data transfer object for [Offset]
  OffsetUtility<T> get offset {
    return OffsetUtility((offset) => _only(offset: offset));
  }

  /// Method to set the blur radius of the shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final shadow = ShadowUtility<StyleAttribute>(builder);
  /// final attribute = shadow.blurRadius(4.0);
  /// ```
  ///
  /// Attribute now holds a [ShadowAttribute] with a [ShadowDto] that has a blur radius value of `4.0`.
  ///
  /// See also:
  /// * [DoubleUtility], the utility class for manipulating [double]
  T blurRadius(double blurRadius) => _only(blurRadius: blurRadius);

  /// Method to create a shadow with provided parameters.
  T call({Color? color, Offset? offset, double? blurRadius}) {
    return _only(
      color: color?.toDto(),
      offset: offset,
      blurRadius: blurRadius,
    );
  }
}

/// Utility class for creating and manipulating a list of [BoxShadow] attributes.
///
/// Allows for the creation of a list of box shadows, useful for applying multiple shadows to a single element.
class BoxShadowListUtility<T extends StyleAttribute>
    extends MixUtility<T, List<BoxShadowDto>> {
  const BoxShadowListUtility(super.builder);

  /// Method to create a list of box shadows from a list of [BoxShadow].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxShadowList = BoxShadowListUtility<StyleAttribute>(builder);
  /// final attribute = boxShadowList([
  ///   BoxShadow(color: Colors.black, blurRadius: 4.0, offset: Offset(2.0, 2.0))
  /// ]);
  /// ```
  ///
  /// Attribute now holds a list of [BoxShadowAttribute] with corresponding [BoxShadowDto] values.
  T call(List<BoxShadow> shadows) {
    return builder(shadows.map(BoxShadowDto.from).toList());
  }
}

/// Utility class for creating and manipulating [BoxShadow] attributes.
///
/// Allows setting of color, offset, blur radius, and spread radius for a box shadow.
/// Useful for adding depth and elevation effects to Flutter widgets.
class BoxShadowUtility<T extends StyleAttribute>
    extends MixUtility<T, BoxShadowDto> {
  const BoxShadowUtility(super.builder);

  /// Returns a [ColorUtility] for setting the color of the box shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxShadow = BoxShadowUtility<StyleAttribute>(builder);
  /// final attribute = boxShadow.color(Colors.black);
  /// ```
  ///
  /// Attribute now holds a [BoxShadowAttribute] with a [BoxShadowDto] that has a color value of `Colors.black`.
  ColorUtility<T> get color {
    return ColorUtility((color) => call(color: color));
  }

  /// Returns an [OffsetUtility] for setting the offset of the box shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxShadow = BoxShadowUtility<StyleAttribute>(builder);
  /// final attribute = boxShadow.offset(Offset(2.0, 2.0));
  /// ```
  ///
  /// Attribute now holds a [BoxShadowAttribute] with a [BoxShadowDto] that has an offset value of `Offset(2.0, 2.0)`.
  OffsetUtility<T> get offset {
    return OffsetUtility((offset) => call(offset: offset));
  }

  /// Method to set the spread radius of the box shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxShadow = BoxShadowUtility<StyleAttribute>(builder);
  /// final attribute = boxShadow.spreadRadius(1.0);
  /// ```
  ///
  /// Attribute now holds a [BoxShadowAttribute] with a [BoxShadowDto] that has a spread radius value of `1.0`.
  T spreadRadius(double spreadRadius) => call(spreadRadius: spreadRadius);

  /// Method to set the blur radius of the box shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxShadow = BoxShadowUtility<StyleAttribute>(builder);
  /// final attribute = boxShadow.blurRadius(4.0);
  /// ```
  ///
  /// Attribute now holds a [BoxShadowAttribute] with a [BoxShadowDto] that has a blur radius value of `4.0`.
  T blurRadius(double blurRadius) => call(blurRadius: blurRadius);

  /// Method to create a box shadow with provided parameters.
  T call({
    ColorDto? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    final shadow = BoxShadowDto(
      color: color,
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );

    return builder(shadow);
  }
}



```
