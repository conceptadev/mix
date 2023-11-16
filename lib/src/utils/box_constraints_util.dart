import '../attributes/constraints_attribute.dart';

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
BoxConstraintsAttribute width(double width) =>
    BoxConstraintsAttribute(width: width);

/// Creates a [BoxConstraintsAttribute] with a specific [height].
///
/// Similar to [width], this function sets a fixed [height] for the constraints,
/// overriding any minimum or maximum height constraints.
///
/// [height]: The fixed height value for the constraints.
BoxConstraintsAttribute height(double height) =>
    BoxConstraintsAttribute(height: height);

/// Defines a [BoxConstraintsAttribute] with a minimum width [minWidth].
///
/// This function sets a lower bound on the width of the box constraints but
/// doesn't set a fixed width. It allows flexibility above the specified [minWidth].
///
/// [minWidth]: The minimum width value for the constraints.
BoxConstraintsAttribute minWidth(double width) =>
    BoxConstraintsAttribute(minWidth: width);

/// Defines a [BoxConstraintsAttribute] with a maximum width [maxWidth].
///
/// This function sets an upper limit on the width of the box constraints. The width
/// can be any value up to [maxWidth], offering flexibility in sizing.
///
/// [maxWidth]: The maximum width value for the constraints.
BoxConstraintsAttribute maxWidth(double width) =>
    BoxConstraintsAttribute(maxWidth: width);

/// Creates a [BoxConstraintsAttribute] with a minimum height [minHeight].
///
/// This function sets a lower limit on the height of the box constraints, allowing
/// any height above the specified [minHeight], thereby providing vertical sizing flexibility.
///
/// [minHeight]: The minimum height value for the constraints.
BoxConstraintsAttribute minHeight(double height) =>
    BoxConstraintsAttribute(minHeight: height);

/// Creates a [BoxConstraintsAttribute] with a maximum height [maxHeight].
///
/// This function sets an upper bound on the height of the box constraints. The height
/// can be any value up to [maxHeight], enabling flexibility in vertical sizing.
///
/// [maxHeight]: The maximum height value for the constraints.
BoxConstraintsAttribute maxHeight(double height) =>
    BoxConstraintsAttribute(maxHeight: height);
