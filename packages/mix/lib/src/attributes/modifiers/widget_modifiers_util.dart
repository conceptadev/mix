import '../../core/core.dart';
import '../../modifiers/modifiers.dart';
import 'widget_modifiers_data_dto.dart';

final class SpecModifierUtility<T extends Attribute>
    extends ModifierUtility<T, WidgetModifiersDataDto> {
  SpecModifierUtility(super.builder);

  @override
  T only(WidgetModifierAttribute attribute) {
    return builder(WidgetModifiersDataDto([attribute]));
  }
}
