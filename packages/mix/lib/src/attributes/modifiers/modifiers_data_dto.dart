import '../../core/core.dart';
import 'modifiers_data.dart';

class ModifiersDataDto extends Dto<ModifiersData> {
  final List<WidgetModifierAttribute> value;

  const ModifiersDataDto(this.value);

  @override
  ModifiersDataDto merge(ModifiersDataDto? other) {
    if (other == null) return this;
    final thisMap = AttributeMap(value);
    final otherMap = AttributeMap(other.value);
    final mergedMap = thisMap.merge(otherMap).values;

    return ModifiersDataDto(mergedMap);
  }

  @override
  ModifiersData resolve(MixData mix) {
    return ModifiersData(value.map((e) => e.resolve(mix)).toList());
  }

  @override
  ModifiersData get defaultValue => const ModifiersData([]);

  @override
  List<Object?> get props => [value];
}
