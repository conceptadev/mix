// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/modifier.dart';
import '../core/spec.dart';
import '../core/utility.dart';
import '../internal/diagnostic_properties_builder_ext.dart';

part 'visibility_widget_modifier.g.dart';

@MixableSpec()
final class VisibilitySpec extends Spec<VisibilitySpec>
    with _$VisibilitySpec, ModifierSpecMixin {
  final bool visible;
  const VisibilitySpec._({bool? visible}) : visible = visible ?? true;
  factory VisibilitySpec(bool visible) => VisibilitySpec._(visible: visible);

  @override
  Widget build(Widget child) {
    return Visibility(visible: visible, child: child);
  }
}

extension VisibilitySpecUtilityX<T extends Attribute>
    on VisibilitySpecUtility<T> {
  T call(bool value) => only(visible: value);
  T on() => only(visible: true);
  T off() => only(visible: false);
}

@Deprecated('Use VisibilitySpec instead')
typedef VisibilityModifierSpec = VisibilitySpec;

@Deprecated('Use VisibilitySpecAttribute instead')
typedef VisibilityModifierAttribute = VisibilitySpecAttribute;

@Deprecated('Use VisibilitySpecUtility instead')
typedef VisibilityUtility = VisibilitySpecUtility;
