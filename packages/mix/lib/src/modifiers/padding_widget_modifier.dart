// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../attributes/spacing/edge_insets_dto.dart';
import '../attributes/spacing/spacing_util.dart';
import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/modifier.dart';
import '../core/spec.dart';
import '../internal/diagnostic_properties_builder_ext.dart';

part 'padding_widget_modifier.g.dart';

@Deprecated('Use PaddingModifierSpec instead')
typedef PaddingSpec = PaddingModifierSpec;

@MixableSpec(prefix: 'PaddingModifier')
final class PaddingModifierSpec extends WidgetModifierSpec<PaddingModifierSpec>
    with _$PaddingModifierSpec {
  final EdgeInsetsGeometry padding;

  const PaddingModifierSpec([EdgeInsetsGeometry? padding])
      : padding = padding ?? EdgeInsets.zero;

  @override
  Widget build(Widget child) {
    return Padding(padding: padding, child: child);
  }
}
