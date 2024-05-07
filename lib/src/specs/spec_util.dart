import '../attributes/scalars/scalar_util.dart';
import '../decorators/widget_decorators_util.dart';
import '../utils/context_variant_util/on_util.dart';
import 'box/box_util.dart';
import 'flex/flex_util.dart';
import 'icon/icon_util.dart';
import 'image/image_util.dart';
import 'stack/stack_util.dart';
import 'text/text_util.dart';

final $box = BoxSpecUtility(MixUtility.selfBuilder);
final $flex = FlexSpecUtility(MixUtility.selfBuilder);
final $image = ImageSpecUtility(MixUtility.selfBuilder);
final $icon = IconSpecUtility(MixUtility.selfBuilder);
final $text = TextSpecUtility(MixUtility.selfBuilder);
final $stack = StackSpecUtility(MixUtility.selfBuilder);
final $with = WithDecoratorUtility();
final $on = OnContextVariantUtility();

class AllMixUtilities {
  final BoxSpecUtility box = $box;
  final FlexSpecUtility flex = $flex;
  final ImageSpecUtility image = $image;
  final IconSpecUtility icon = $icon;
  final TextSpecUtility text = $text;
  final StackSpecUtility stack = $stack;
  AllMixUtilities();
}
