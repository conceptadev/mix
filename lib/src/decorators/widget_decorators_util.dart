import '../core/attribute.dart';
import 'align_widget_decorator.dart';
import 'aspect_ratio_widget_decorator.dart';
import 'clip_widget_decorator.dart';
import 'flexible_widget_decorator.dart';
import 'fractionally_sized_box_widget_decorator.dart';
import 'intrinsic_widget_decorator.dart';
import 'opacity_widget_decorator.dart';
import 'rotated_box_widget_decorator.dart';
import 'sized_box_widget_decorator.dart';
import 'transform_widget_decorator.dart';
import 'visibility_widget_decorator.dart';

T selfBuilder<T extends StyleAttribute>(T value) => value;

const intrinsicWidth = IntrinsicWidthWidgetUtility(selfBuilder);
const intrinsicHeight = IntrinsicHeightWidgetUtility(selfBuilder);
final scale = transform.scale;
final flip = transform.flip;
const opacity = OpacityUtility(selfBuilder);
const rotate = RotatedBoxWidgetUtility(selfBuilder);

const clipPath = ClipPathUtility(selfBuilder);
const clipRRect = ClipRRectUtility(selfBuilder);
const clipOval = ClipOvalUtility(selfBuilder);
const clipRect = ClipRectUtility(selfBuilder);
const clipTriangle = ClipTriangleUtility(selfBuilder);

const visibility = VisibilityUtility(selfBuilder);
const aspectRatio = AspectRatioUtility(selfBuilder);
const flexible = FlexibleDecoratorUtility(selfBuilder);
const transform = TransformUtility(selfBuilder);
const align = AlignWidgetUtility(selfBuilder);
const fractionallySizedBox = FractionallySizedBoxDecoratorUtility(selfBuilder);
const sizedBox = SizedBoxDecoratorUtility(selfBuilder);
