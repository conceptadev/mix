import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/shadow/shadow_dto.dart';
import '../../attributes/shadow/shadow_util.dart';
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

  IconSpecAttribute _only({
    ColorDto? color,
    double? size,
    double? weight,
    double? grade,
    double? opticalSize,
    List<ShadowDto>? shadows,
    double? fill,
    bool? applyTextScaling,
  }) {
    return IconSpecAttribute(
      size: size,
      color: color,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      shadows: shadows,
      fill: fill,
      applyTextScaling: applyTextScaling,
    );
  }

  ColorUtility<IconSpecAttribute> get color {
    return ColorUtility((color) => IconSpecAttribute(color: color));
  }

  DoubleUtility<IconSpecAttribute> get size {
    return DoubleUtility((size) => _only(size: size));
  }

  DoubleUtility<IconSpecAttribute> get weight {
    return DoubleUtility((size) => _only(size: size));
  }

  DoubleUtility<IconSpecAttribute> get grade {
    return DoubleUtility((grade) => _only(grade: grade));
  }

  DoubleUtility<IconSpecAttribute> get opticalSize {
    return DoubleUtility((opticalSize) => _only(opticalSize: opticalSize));
  }

  ShadowUtility<IconSpecAttribute> get shadow {
    return ShadowUtility((shadow) => IconSpecAttribute(shadows: [shadow]));
  }

  ShadowListUtility<IconSpecAttribute> get shadows {
    return ShadowListUtility((shadows) => IconSpecAttribute(shadows: shadows));
  }

  DoubleUtility<IconSpecAttribute> get fill {
    return DoubleUtility((fill) => _only(fill: fill));
  }

  BoolUtility<IconSpecAttribute> get applyTextScaling {
    return BoolUtility(
      (applyTextScaling) => _only(applyTextScaling: applyTextScaling),
    );
  }
}
