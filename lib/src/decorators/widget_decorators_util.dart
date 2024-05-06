import '../attributes/scalars/scalar_util.dart';
import '../attributes/spacing/spacing_util.dart';
import 'align_widget_decorator.dart';
import 'aspect_ratio_widget_decorator.dart';
import 'clip_widget_decorator.dart';
import 'flexible_widget_decorator.dart';
import 'fractionally_sized_box_widget_decorator.dart';
import 'intrinsic_widget_decorator.dart';
import 'opacity_widget_decorator.dart';
import 'padding_widget_decorator.dart';
import 'rotated_box_widget_decorator.dart';
import 'sized_box_widget_decorator.dart';
import 'transform_widget_decorator.dart';
import 'visibility_widget_decorator.dart';

class WithDecoratorUtility {
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
      const FractionallySizedBoxDecoratorUtility(MixUtility.selfBuilder);
  late final sizedBox = const SizedBoxDecoratorUtility(MixUtility.selfBuilder);
  late final padding = SpacingUtility(PaddingDecoratorAttribute.new);

  late final _flexible = const FlexibleDecoratorUtility(MixUtility.selfBuilder);
  WithDecoratorUtility();
}
