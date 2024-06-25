import '../attributes/spacing/spacing_util.dart';
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

class WithModifierUtility {
  late final intrinsicWidth =
      const IntrinsicWidthWidgetUtility(MixUtility.selfBuilder);
  late final intrinsicHeight =
      const IntrinsicHeightWidgetUtility(MixUtility.selfBuilder);
  late final rotate = const RotatedBoxWidgetUtility(MixUtility.selfBuilder);
  late final opacity = const OpacityUtility(MixUtility.selfBuilder);
  late final clipPath = const ClipPathUtility(MixUtility.selfBuilder);
  late final clipRRect = const ClipRRectUtility(MixUtility.selfBuilder);
  late final clipOval = const ClipOvalUtility(MixUtility.selfBuilder);
  late final clipRect = const ClipRectUtility(MixUtility.selfBuilder);
  late final clipTriangle = const ClipTriangleUtility(MixUtility.selfBuilder);
  late final visibility = const VisibilityUtility(MixUtility.selfBuilder);
  late final show = visibility.on;
  late final hide = visibility.off;
  late final aspectRatio = const AspectRatioUtility(MixUtility.selfBuilder);
  late final flexible = _flexible;
  late final expanded = flexible.expanded;
  late final transform = const TransformUtility(MixUtility.selfBuilder);

  late final scale = transform.scale;
  late final align = const AlignWidgetUtility(MixUtility.selfBuilder);
  late final fractionallySizedBox =
      const FractionallySizedBoxModifierUtility(MixUtility.selfBuilder);
  late final sizedBox = const SizedBoxModifierUtility(MixUtility.selfBuilder);
  late final padding = SpacingUtility(PaddingModifierAttribute.new);

  static final self = WithModifierUtility._();
  late final _flexible = const FlexibleModifierUtility(MixUtility.selfBuilder);

  WithModifierUtility._();
}
