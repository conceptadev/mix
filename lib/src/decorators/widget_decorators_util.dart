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

T selfBuilder<T extends StyleAttribute>(T value) => value;

final $decorator = WidgetDecoratorUtilility(selfBuilder);

@Deprecated(r'use $decorator.intrinsicWidth instead')
const intrinsicWidth = IntrinsicWidthWidgetUtility(selfBuilder);

@Deprecated(r'use $decorator.intrinsicHeight instead')
const intrinsicHeight = IntrinsicHeightWidgetUtility(selfBuilder);

@Deprecated(r'use $decorator.scale instead')
final scale = transform.scale;

@Deprecated(r'use $decorator.flip instead')
final flip = transform.flip;
@Deprecated(r'use $decorator.opacity instead')
const opacity = OpacityUtility(selfBuilder);
@Deprecated(r'use $decorator.rotate instead')
const rotate = RotatedBoxWidgetUtility(selfBuilder);

@Deprecated(r'use $decorator.clipPath instead')
const clipPath = ClipPathUtility(selfBuilder);
@Deprecated(r'use $decorator.clipRRect instead')
const clipRRect = ClipRRectUtility(selfBuilder);
@Deprecated(r'use $decorator.clipOval instead')
const clipOval = ClipOvalUtility(selfBuilder);
@Deprecated(r'use $decorator.clipRect instead')
const clipRect = ClipRectUtility(selfBuilder);
@Deprecated(r'use $decorator.clipTriangle instead')
const clipTriangle = ClipTriangleUtility(selfBuilder);

@Deprecated(r'use $decorator.visibility instead')
const visibility = VisibilityUtility(selfBuilder);
@Deprecated(r'use $decorator.aspectRatio instead')
const aspectRatio = AspectRatioUtility(selfBuilder);
@Deprecated(r'use $decorator.flexible instead')
const flexible = FlexibleDecoratorUtility(selfBuilder);
@Deprecated(r'use $decorator.transform instead')
const transform = TransformUtility(selfBuilder);
@Deprecated(r'use $decorator.align instead')
const align = AlignWidgetUtility(selfBuilder);
@Deprecated(r'use $decorator.fractionallySizedBox instead')
const fractionallySizedBox = FractionallySizedBoxDecoratorUtility(selfBuilder);
@Deprecated(r'use $decorator.sizedBox instead')
const sizedBox = SizedBoxDecoratorUtility(selfBuilder);

class WidgetDecoratorUtilility<T extends StyleAttribute>
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
  late final aspectRatio = AspectRatioUtility(builder);
  late final flexible = FlexibleDecoratorUtility(builder);
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

  WidgetDecoratorUtilility(super.builder);
}
