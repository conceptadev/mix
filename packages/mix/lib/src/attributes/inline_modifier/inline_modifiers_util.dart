import '../../core/attribute.dart';
import '../../core/modifier.dart';
import '../../modifiers/widget_modifiers_util.dart';
import '../attributes.dart';

final class InlineModifierUtility<T extends Attribute>
    extends MixUtility<T, Set<WidgetModifierAttribute>> {
  late final add = WithModifierUtility((v) => builder({v}));

  InlineModifierUtility(super.builder);

  T call(InlineModifiersDataDto modifiersDto) {
    return builder(modifiersDto.modifiers);
  }
}
