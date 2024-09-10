// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../core/attribute.dart';
import '../../core/factory/mix_data.dart';
import '../../core/modifier.dart';
import '../../core/utility.dart';

part 'cleaner_modifier.g.dart';

@MixableSpec(skipUtility: true)
final class CleanerModifierSpec extends WidgetModifierSpec<CleanerModifierSpec>
    with _$CleanerModifierSpec, Diagnosticable {
  const CleanerModifierSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }

  @override
  Widget build(Widget child) {
    return child;
  }
}

final class CleanerModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, CleanerModifierSpecAttribute> {
  const CleanerModifierSpecUtility(super.builder);
  T call() {
    return builder(const CleanerModifierSpecAttribute());
  }
}
