import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/shadow/shadow_dto.dart';
import '../../attributes/shadow/shadow_util.dart';
import '../../core/attribute.dart';
import '../../decorators/widget_decorators_util.dart';
import 'icon_attribute.dart';

const icon = IconSpecUtility(selfBuilder);

/// Utility class for building [IconSpecAttribute]s
///
/// Example:
///
/// ```dart
/// final icon = IconUtility();
///
/// final iconSpec = icon.size(24);
class IconSpecUtility<T extends SpecAttribute>
    extends SpecUtility<T, IconSpecAttribute> {
  const IconSpecUtility(super.builder);

  ColorUtility<T> get color {
    return ColorUtility((color) => call(color: color));
  }

  DoubleUtility<T> get size {
    return DoubleUtility((size) => call(size: size));
  }

  DoubleUtility<T> get weight {
    return DoubleUtility((size) => call(size: size));
  }

  DoubleUtility<T> get grade {
    return DoubleUtility((grade) => call(grade: grade));
  }

  DoubleUtility<T> get opticalSize {
    return DoubleUtility((opticalSize) => call(opticalSize: opticalSize));
  }

  ShadowUtility<T> get shadow {
    return ShadowUtility((shadow) => call(shadows: [shadow]));
  }

  ShadowListUtility<T> get shadows {
    return ShadowListUtility((shadows) => call(shadows: shadows));
  }

  DoubleUtility<T> get fill {
    return DoubleUtility((fill) => call(fill: fill));
  }

  BoolUtility<T> get applyTextScaling {
    return BoolUtility(
      (applyTextScaling) => call(applyTextScaling: applyTextScaling),
    );
  }

  @override
  T call({
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
