import '../attributes/scalars/scalar_util.dart';
import '../attributes/spacing/spacing_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
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

class WithDecoratorUtility<T extends StyleAttribute>
    extends MixUtility<T, Decorator> {
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
  late final flexible = _flexible;
  late final expanded = flexible.expanded;
  late final transform = TransformUtility(builder);
  late final flip = transform.flip;
  late final scale = transform.scale;
  late final align = AlignWidgetUtility(builder);
  late final fractionallySizedBox =
      FractionallySizedBoxDecoratorUtility(builder);
  late final sizedBox = SizedBoxDecoratorUtility(builder);
  late final padding = SpacingUtility((spacing) {
    return builder(PaddingDecoratorAttribute(spacing));
  });

  late final _flexible = FlexibleDecoratorUtility(builder);
  WithDecoratorUtility(super.builder);
}
