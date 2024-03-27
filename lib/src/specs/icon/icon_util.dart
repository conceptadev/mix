import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/shadow/shadow_dto.dart';
import '../../attributes/shadow/shadow_util.dart';
import '../../core/attribute.dart';
import '../../decorators/widget_decorators_util.dart';
import 'icon_attribute.dart';

const icon = IconUtility(selfBuilder);

/// Utility class for building [IconSpecAttribute]s
///
/// Example:
///
/// ```dart
/// final icon = IconUtility();
///
/// final iconSpec = icon.size(24);
class IconUtility<T extends SpecAttribute>
    extends SpecUtility<T, IconSpecAttribute> {
  const IconUtility(super.builder);

  ColorUtility<T> get color {
    return ColorUtility((color) => only(color: color));
  }

  DoubleUtility<T> get size {
    return DoubleUtility((size) => only(size: size));
  }

  DoubleUtility<T> get weight {
    return DoubleUtility((size) => only(size: size));
  }

  DoubleUtility<T> get grade {
    return DoubleUtility((grade) => only(grade: grade));
  }

  DoubleUtility<T> get opticalSize {
    return DoubleUtility((opticalSize) => only(opticalSize: opticalSize));
  }

  ShadowUtility<T> get shadow {
    return ShadowUtility((shadow) => only(shadows: [shadow]));
  }

  ShadowListUtility<T> get shadows {
    return ShadowListUtility((shadows) => only(shadows: shadows));
  }

  DoubleUtility<T> get fill {
    return DoubleUtility((fill) => only(fill: fill));
  }

  BoolUtility<T> get applyTextScaling {
    return BoolUtility(
      (applyTextScaling) => only(applyTextScaling: applyTextScaling),
    );
  }

  @override
  T only({
    ColorDto? color,
    double? size,
    double? weight,
    double? grade,
    double? opticalSize,
    List<ShadowDto>? shadows,
    double? fill,
    bool? applyTextScaling,
  }) {
    return builder(
      IconSpecAttribute(
        size: size,
        color: color,
        weight: weight,
        grade: grade,
        opticalSize: opticalSize,
        shadows: shadows,
        fill: fill,
        applyTextScaling: applyTextScaling,
      ),
    );
  }
}
