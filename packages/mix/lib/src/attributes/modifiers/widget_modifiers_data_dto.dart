import 'package:flutter/foundation.dart';

import '../../core/attributes_map.dart';
import '../../core/element.dart';
import '../../core/factory/mix_data.dart';
import '../../core/modifier.dart';
import '../../modifiers/internal/reset_modifier.dart';
import 'widget_modifiers_data.dart';

class WidgetModifiersDataMix extends Mixable<WidgetModifiersData>
    with Diagnosticable {
  final List<WidgetModifierSpecAttribute> value;

  const WidgetModifiersDataMix(this.value);

  @override
  WidgetModifiersDataMix merge(WidgetModifiersDataMix? other) {
    if (other == null) return this;
    final thisMap = AttributeMap(value);

    final resetIndex =
        other.value.lastIndexWhere((e) => e is ResetModifierSpecAttribute);

    if (resetIndex != -1) {
      return WidgetModifiersDataMix(other.value.sublist(resetIndex));
    }

    final otherMap = AttributeMap(other.value);
    final mergedMap = thisMap.merge(otherMap).values;

    return WidgetModifiersDataMix(mergedMap);
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
  List<Object?> get props => [value];
}
