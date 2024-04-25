import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/shadow/shadow_dto.dart';
import '../../attributes/shadow/shadow_util.dart';
import '../../core/attribute.dart';
import '../../decorators/widget_decorators_util.dart';
import 'icon_attribute.dart';

final icon = IconSpecUtility(selfBuilder);

final $icon = IconSpecUtility(selfBuilder);

class IconSpecUtility<T extends SpecAttribute>
    extends SpecUtility<T, IconSpecAttribute> {
  late final color = ColorUtility((v) => only(color: v));
  late final size = DoubleUtility((v) => only(size: v));
  late final weight = DoubleUtility((v) => only(size: v));
  late final grade = DoubleUtility((v) => only(grade: v));
  late final opticalSize = DoubleUtility((v) => only(opticalSize: v));
  late final shadow = ShadowUtility((v) => only(shadows: [v]));
  late final shadows = ShadowListUtility((v) => only(shadows: v));
  late final fill = DoubleUtility((v) => only(fill: v));
  late final applyTextScaling = BoolUtility(
    (v) => only(applyTextScaling: v),
  );

  IconSpecUtility(super.builder);

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
