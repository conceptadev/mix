import '../../core/core.dart';
import '../../modifiers/modifiers.dart';
import '../spacing/spacing_util.dart';
import 'widget_modifiers_data_dto.dart';

final class ModifierUtility<T extends Attribute>
    extends MixUtility<T, WidgetModifiersDataDto> {
  late final add =
      WithModifierUtility((v) => builder(WidgetModifiersDataDto([v])));

  late final intrinsicWidth = IntrinsicWidthWidgetUtility(only);
  late final intrinsicHeight = IntrinsicHeightWidgetUtility(only);
  late final rotate = RotatedBoxWidgetUtility(only);
  late final opacity = OpacityUtility(only);
  late final clipPath = ClipPathUtility(only);
  late final clipRRect = ClipRRectUtility(only);
  late final clipOval = ClipOvalUtility(only);
  late final clipRect = ClipRectUtility(only);
  late final clipTriangle = ClipTriangleUtility(only);
  late final visibility = VisibilityUtility(only);
  late final show = visibility.on;
  late final hide = visibility.off;
  late final aspectRatio = AspectRatioUtility(only);
  late final flexible = FlexibleModifierUtility(only);
  late final expanded = flexible.expanded;
  late final transform = TransformUtility(only);

  late final scale = transform.scale;
  late final align = AlignWidgetUtility(only);
  late final fractionallySizedBox = FractionallySizedBoxModifierUtility(only);
  late final sizedBox = SizedBoxModifierUtility(only);
  late final padding = SpacingUtility(PaddingModifierUtility(only));

  ModifierUtility(super.builder);

  T only(WidgetModifierAttribute attribute) {
    return builder(WidgetModifiersDataDto([attribute]));
  }
}
