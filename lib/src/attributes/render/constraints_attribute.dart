import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';

/// Provides a default instance of [BoxConstraintsAttribute] with no constraints.
///
/// This constant can be used as a starting point before specifying particular constraints.
const boxConstraints = BoxConstraintsAttribute.new;

/// Creates a [BoxConstraintsAttribute] with a specific [width].
///
/// The returned [BoxConstraintsAttribute] instance imposes the given [width] as
/// a fixed size, ignoring any minimum or maximum width constraints.
///
/// [width]: The fixed width value for the constraints.
BoxConstraintsAttribute width(double width) => boxConstraints(width: width);

/// Creates a [BoxConstraintsAttribute] with a specific [height].
///
/// Similar to [width], this function sets a fixed [height] for the constraints,
/// overriding any minimum or maximum height constraints.
///
/// [height]: The fixed height value for the constraints.
BoxConstraintsAttribute height(double height) => boxConstraints(height: height);

/// Defines a [BoxConstraintsAttribute] with a minimum width [minWidth].
///
/// This function sets a lower bound on the width of the box constraints but
/// doesn't set a fixed width. It allows flexibility above the specified [minWidth].
///
/// [minWidth]: The minimum width value for the constraints.
BoxConstraintsAttribute minWidth(double width) =>
    boxConstraints(minWidth: width);

/// Defines a [BoxConstraintsAttribute] with a maximum width [maxWidth].
///
/// This function sets an upper limit on the width of the box constraints. The width
/// can be any value up to [maxWidth], offering flexibility in sizing.
///
/// [maxWidth]: The maximum width value for the constraints.
BoxConstraintsAttribute maxWidth(double width) =>
    boxConstraints(maxWidth: width);

/// Creates a [BoxConstraintsAttribute] with a minimum height [minHeight].
///
/// This function sets a lower limit on the height of the box constraints, allowing
/// any height above the specified [minHeight], thereby providing vertical sizing flexibility.
///
/// [minHeight]: The minimum height value for the constraints.
BoxConstraintsAttribute minHeight(double height) =>
    boxConstraints(minHeight: height);

/// Creates a [BoxConstraintsAttribute] with a maximum height [maxHeight].
///
/// This function sets an upper bound on the height of the box constraints. The height
/// can be any value up to [maxHeight], enabling flexibility in vertical sizing.
///
/// [maxHeight]: The maximum height value for the constraints.
BoxConstraintsAttribute maxHeight(double height) =>
    boxConstraints(maxHeight: height);

abstract class ConstraintsAttribute<T extends Constraints>
    extends ResolvableAttribute<T> {
  const ConstraintsAttribute();
}

class BoxConstraintsAttribute extends ConstraintsAttribute<BoxConstraints>
    with SingleChildRenderAttributeMixin<ConstrainedBox> {
  final double? width;
  final double? height;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  const BoxConstraintsAttribute({
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });

  @override
  BoxConstraints resolve(MixData mix) {
    BoxConstraints? constraints;

    if (minWidth != null ||
        maxWidth != null ||
        minHeight != null ||
        maxHeight != null) {
      constraints = BoxConstraints(
        minWidth: minWidth ?? 0,
        maxWidth: maxWidth ?? double.infinity,
        minHeight: minHeight ?? 0,
        maxHeight: maxHeight ?? double.infinity,
      );
    }

    constraints = (width != null || height != null)
        ? constraints?.tighten(width: width, height: height) ??
            BoxConstraints.tightFor(width: width, height: height)
        : constraints;

    return constraints ?? const BoxConstraints();
  }

  @override
  BoxConstraintsAttribute merge(BoxConstraintsAttribute? other) {
    if (other == null) return this;

    return BoxConstraintsAttribute(
      width: other.width ?? width,
      height: other.height ?? height,
      minWidth: other.minWidth ?? minWidth,
      maxWidth: other.maxWidth ?? maxWidth,
      minHeight: other.minHeight ?? minHeight,
      maxHeight: other.maxHeight ?? maxHeight,
    );
  }

  @override
  get props => [width, height, minWidth, maxWidth, minHeight, maxHeight];

  @override
  ConstrainedBox build(MixData mix, Widget child) {
    return ConstrainedBox(constraints: resolve(mix), child: child);
  }
}
