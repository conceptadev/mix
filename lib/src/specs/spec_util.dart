import '../attributes/scalars/scalar_util.dart';
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

class MixUtilities {
  final BoxSpecUtility box = $box;
  final FlexSpecUtility flex = $flex;
  final ImageSpecUtility image = $image;
  final IconSpecUtility icon = $icon;
  final TextSpecUtility text = $text;
  final StackSpecUtility stack = $stack;
  MixUtilities();
}
