import '../../core/core.dart';
import 'inline_modifiers_data.dart';

class InlineModifiersDataDto extends Dto<InlineModifiersData> {
  final Set<WidgetModifierAttribute> modifiers;

  const InlineModifiersDataDto(this.modifiers);

  @override
  InlineModifiersDataDto merge(InlineModifiersDataDto? other) {
    if (other == null) return this;
    final thisMap = AttributeMap(modifiers);
    final otherMap = AttributeMap(other.modifiers);
    final mergedMap = thisMap.merge(otherMap).values.toSet();

    return InlineModifiersDataDto(mergedMap);
  }

  @override
  InlineModifiersData resolve(MixData mix) {
    return InlineModifiersData(
      modifiers: modifiers.map((e) => e.resolve(mix)).toSet(),
    );
  }

  @override
  InlineModifiersData get defaultValue =>
      const InlineModifiersData(modifiers: {});

  @override
  List<Object?> get props => [modifiers];
}
