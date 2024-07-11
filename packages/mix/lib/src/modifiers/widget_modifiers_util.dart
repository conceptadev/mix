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

abstract class ModifierUtility<T extends Attribute, Value>
    extends MixUtility<T, Value> {
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
  late final padding = SpacingUtility(PaddingModifierUtility(only).call);

  ModifierUtility(super.builder);

  T only(WidgetModifierAttribute attribute);
}

class WithModifierUtility<T extends Attribute>
    extends ModifierUtility<T, WidgetModifierAttribute> {
  static final self = WithModifierUtility(MixUtility.selfBuilder);

  WithModifierUtility(super.builder);

  @override
  T only(WidgetModifierAttribute attribute) {
    return builder(attribute);
  }
}
