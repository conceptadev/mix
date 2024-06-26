import '../attributes/spacing/spacing_util.dart';
import '../core/attribute.dart';
import '../core/modifier.dart';
import '../core/utility.dart';
import 'align_widget_modifier.dart';
import 'aspect_ratio_widget_modifier.dart';
import 'clip_widget_modifier.dart';
import 'flexible_widget_modifier.dart';
import 'fractionally_sized_box_widget_modifier.dart';
import 'intrinsic_widget_modifier.dart';
import 'opacity_widget_modifier.dart';
import 'padding_widget_modifier.dart';
import 'rotated_box_widget_modifier.dart';
import 'sized_box_widget_modifier.dart';
import 'transform_widget_modifier.dart';
import 'visibility_widget_modifier.dart';

class WithModifierUtility<T extends Attribute>
    extends MixUtility<T, WidgetModifierAttribute> {
  late final intrinsicWidth = IntrinsicWidthWidgetUtility(builder);
  late final intrinsicHeight = IntrinsicHeightWidgetUtility(builder);
  late final rotate = RotatedBoxWidgetUtility(builder);
  late final opacity = OpacityUtility(builder);
  late final clipPath = ClipPathUtility(builder);
  late final clipRRect = ClipRRectUtility(builder);
  late final clipOval = ClipOvalUtility(builder);
  late final clipRect = ClipRectUtility(builder);
  late final clipTriangle = ClipTriangleUtility(builder);
  late final visibility = VisibilityUtility(builder);
  late final show = visibility.on;
  late final hide = visibility.off;
  late final aspectRatio = AspectRatioUtility(builder);
  late final flexible = FlexibleModifierUtility(builder);
  late final expanded = flexible.expanded;
  late final transform = TransformUtility(builder);

  late final scale = transform.scale;
  late final align = AlignWidgetUtility(builder);
  late final fractionallySizedBox =
      FractionallySizedBoxModifierUtility(builder);
  late final sizedBox = SizedBoxModifierUtility(builder);
  late final padding = SpacingUtility(PaddingModifierUtility(builder));

  static final self = WithModifierUtility(MixUtility.selfBuilder);

  WithModifierUtility(super.builder);
}
