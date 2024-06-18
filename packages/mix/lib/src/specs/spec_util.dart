import '../modifiers/widget_modifiers_util.dart';
import '../variants/context_variant_util/on_util.dart';
import 'box/box_spec.dart';
import 'flex/flex_spec.dart';
import 'icon/icon_spec.dart';
import 'image/image_spec.dart';
import 'stack/stack_spec.dart';
import 'text/text_spec.dart';

final _mixUtilities = MixUtilities();

final $box = _mixUtilities.box;
final $flex = _mixUtilities.flex;
final $image = _mixUtilities.image;
final $icon = _mixUtilities.icon;
final $text = _mixUtilities.text;
final $stack = _mixUtilities.stack;
final $with = _mixUtilities.mod;
final $on = _mixUtilities.on;

class MixUtilities {
  final box = BoxSpecUtility.self;
  final flex = FlexSpecUtility.self;
  final image = ImageSpecUtility.self;
  final icon = IconSpecUtility.self;
  final text = TextSpecUtility.self;
  final stack = StackSpecUtility.self;
  final on = OnContextVariantUtility.self;
  final mod = WithModifierUtility.self;
  MixUtilities();
}
