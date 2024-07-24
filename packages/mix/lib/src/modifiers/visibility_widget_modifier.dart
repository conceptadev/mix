// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/modifier.dart';
import '../core/utility.dart';

part 'visibility_widget_modifier.g.dart';

@MixableSpec(skipUtility: true)
final class VisibilityModifierSpec
    extends WidgetModifierSpec<VisibilityModifierSpec>
    with _$VisibilityModifierSpec {
  final bool visible;
  const VisibilityModifierSpec([bool? visible]) : visible = visible ?? true;

  @override
  Widget build(Widget child) {
    return Visibility(visible: visible, child: child);
  }
}

final class VisibilityModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, VisibilityModifierSpecAttribute> {
  const VisibilityModifierSpecUtility(super.builder);
  T on() => call(true);
  T off() => call(false);

  T call(bool value) =>
      builder(VisibilityModifierSpecAttribute(visible: value));
}
