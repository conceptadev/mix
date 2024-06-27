import '../../core/core.dart';
import 'widget_modifiers_data.dart';

class WidgetModifiersDataDto extends Dto<WidgetModifiersData> {
  final List<WidgetModifierAttribute> value;

  const WidgetModifiersDataDto(this.value);

  @override
  WidgetModifiersDataDto merge(WidgetModifiersDataDto? other) {
    if (other == null) return this;
    final thisMap = AttributeMap(value);
    final otherMap = AttributeMap(other.value);
    final mergedMap = thisMap.merge(otherMap).values;

    return WidgetModifiersDataDto(mergedMap);
  }

  @override
  WidgetModifiersData resolve(MixData mix) {
    return WidgetModifiersData(value.map((e) => e.resolve(mix)).toList());
  }

  @override
  WidgetModifiersData get defaultValue => const WidgetModifiersData([]);

  @override
  List<Object?> get props => [value];
}
