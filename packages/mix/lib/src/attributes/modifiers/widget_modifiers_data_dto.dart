import 'package:flutter/foundation.dart';

import '../../core/attributes_map.dart';
import '../../core/dto.dart';
import '../../core/factory/mix_data.dart';
import '../../core/modifier.dart';
import 'widget_modifiers_data.dart';

class _WidgetModifiersDataDtoCleaner extends WidgetModifiersDataDto {
  const _WidgetModifiersDataDtoCleaner() : super(const []);
}

class WidgetModifiersDataDto extends Dto<WidgetModifiersData>
    with Diagnosticable {
  final List<WidgetModifierSpecAttribute> value;

  const WidgetModifiersDataDto(this.value);
  factory WidgetModifiersDataDto.cleaner() {
    return const _WidgetModifiersDataDtoCleaner();
  }

  @override
  WidgetModifiersDataDto merge(WidgetModifiersDataDto? other) {
    if (other == null) return this;
    if (other is _WidgetModifiersDataDtoCleaner) return other;
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
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    for (var attr in value) {
      properties.add(DiagnosticsProperty(attr.runtimeType.toString(), attr));
    }
  }

  @override
  WidgetModifiersData get defaultValue => const WidgetModifiersData([]);

  @override
  List<Object?> get props => [value];
}
