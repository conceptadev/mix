import '../attributes/scalars/scalar_util.dart';
import '../modifiers/widget_modifiers_util.dart';
import '../variants/context_variant_util/on_util.dart';
import 'box/box_spec.dart';
import 'flex/flex_spec.dart';
import 'icon/icon_spec.dart';
import 'image/image_spec.dart';
import 'stack/stack_spec.dart';
import 'text/text_spec.dart';

final $box = BoxSpecUtility(MixUtility.selfBuilder);
final $flex = FlexSpecUtility(MixUtility.selfBuilder);
final $image = ImageSpecUtility(MixUtility.selfBuilder);
final $icon = IconSpecUtility(MixUtility.selfBuilder);
final $text = TextSpecUtility(MixUtility.selfBuilder);
final $stack = StackSpecUtility(MixUtility.selfBuilder);
final $with = WithModifierUtility();
final $on = OnContextVariantUtility();
