import '../../core/attribute.dart';
import '../../core/modifier.dart';
import '../../modifiers/internal/cleaner_modifier.dart';
import '../../modifiers/widget_modifiers_util.dart';
import 'widget_modifiers_data_dto.dart';

final class SpecModifierUtility<T extends Attribute>
    extends ModifierUtility<T, WidgetModifiersDataDto> {
  late final clearModifiers = CleanerModifierSpecUtility(only);

  SpecModifierUtility(super.builder);

  @override
  T only(WidgetModifierSpecAttribute attribute) {
    return builder(WidgetModifiersDataDto([attribute]));
  }
}
