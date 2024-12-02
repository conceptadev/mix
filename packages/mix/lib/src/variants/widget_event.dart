import 'package:flutter/widgets.dart';

import '../core/factory/style_mix.dart';
import '../core/variant.dart';
import '../core/widget_state/on_tap_event_inherited.dart';
import '../core/widget_state/widget_state_controller.dart';
import 'context_variant.dart';
import 'variant_attribute.dart';
import 'widget_state_variant.dart';

class OnTapEventVariant extends IVariant {
  const OnTapEventVariant();

  VariantAttribute call(Style Function(OnTapEvent) fn) {
    return ContextVariantBuilder(
      (BuildContext context) =>
          fn(OnTapEventInherited.of(context)?.event ?? OnTapEvent.idle),
      const OnPressVariant(),
    );
  }

  @override
  bool when(BuildContext context) {
    return MixWidgetState.hasStateOf(context, MixWidgetState.pressed);
  }

  @override
  VariantPriority get priority => VariantPriority.normal;

  @override
  Object get mergeKey => '$runtimeType';

  @override
  get props => [priority];
}
