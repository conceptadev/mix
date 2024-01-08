import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import 'icon_attribute.dart';

const icon = IconUtility();

/// Utility class for building [IconSpecAttribute]s
///
/// Example:
///
/// ```dart
/// final icon = IconUtility();
///
/// final iconSpec = icon.size(24);
class IconUtility extends SpecUtility<IconSpecAttribute> {
  const IconUtility();

  IconSpecAttribute _only({double? size, ColorDto? color}) {
    return IconSpecAttribute(size: size, color: color);
  }

  ColorUtility<IconSpecAttribute> get color {
    return ColorUtility((color) => IconSpecAttribute(color: color));
  }

  DoubleUtility<IconSpecAttribute> get size {
    return DoubleUtility((size) => _only(size: size));
  }
}
