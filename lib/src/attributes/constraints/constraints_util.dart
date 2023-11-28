import '../../utils/scalar_util.dart';
import 'constraints_attribute.dart';

class BoxConstraintsUtility<T> extends MixUtility<T, BoxConstraintsAttribute> {
  /// Provides a builder that returns an instance of BoxConstraintsAttribute.
  static const selfBuilder = BoxConstraintsUtility(MixUtility.selfBuilder);

  const BoxConstraintsUtility(super.builder);

  /// Defines a [BoxConstraintsAttribute] with a minimum width [minWidth].
  ///
  /// This function sets a lower bound on the width of the box constraints but
  /// doesn't set a fixed width. It allows flexibility above the specified [minWidth].
  ///
  /// [minWidth]: The minimum width value for the constraints.
  T minWidth(double width) => call(minWidth: width);

  /// Defines a [BoxConstraintsAttribute] with a maximum width [maxWidth].
  ///
  /// This function sets an upper limit on the width of the box constraints. The width
  /// can be any value up to [maxWidth], offering flexibility in sizing.
  ///
  /// [maxWidth]: The maximum width value for the constraints.
  T maxWidth(double width) => call(maxWidth: width);

  /// Creates a [BoxConstraintsAttribute] with a minimum height [minHeight].
  ///
  /// This function sets a lower limit on the height of the box constraints, allowing
  /// any height above the specified [minHeight], thereby providing vertical sizing flexibility.
  ///
  /// [minHeight]: The minimum height value for the constraints.
  T minHeight(double height) => call(minHeight: height);

  /// Creates a [BoxConstraintsAttribute] with a maximum height [maxHeight].
  ///
  /// This function sets an upper bound on the height of the box constraints. The height
  /// can be any value up to [maxHeight], enabling flexibility in vertical sizing.
  ///
  /// [maxHeight]: The maximum height value for the constraints.
  T maxHeight(double height) => call(maxHeight: height);

  T call({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return as(
      BoxConstraintsAttribute(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
    );
  }
}
