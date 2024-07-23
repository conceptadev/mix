// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/helpers.dart';
import '../core/modifier.dart';
import '../core/spec.dart';
import '../core/utility.dart';
import '../internal/diagnostic_properties_builder_ext.dart';

part 'aspect_ratio_widget_modifier.g.dart';

/// A modifier that wraps a widget with the [AspectRatio] widget.
///
/// The [AspectRatio] widget sizes its child to match a given aspect ratio.
@MixableSpec()
final class AspectRatioSpec extends Spec<AspectRatioSpec>
    with _$AspectRatioSpec, ModifierSpecMixin {
  @MixableProperty(utilities: [MixableUtility(alias: '_aspectRatio')])
  final double? aspectRatio;
  const AspectRatioSpec({this.aspectRatio});

  static const of = _$AspectRatioSpec.of;
  static const from = _$AspectRatioSpec.from;

  @override
  Widget build(Widget child) {
    return AspectRatio(aspectRatio: aspectRatio ?? 1.0, child: child);
  }
}

extension AspectRatioSpecUtilityX<T extends Attribute>
    on AspectRatioSpecUtility<T> {
  T call(double value) => _aspectRatio(value);
}

/// A modifier that wraps a widget with the [AspectRatio] widget.
///
/// The [AspectRatio] widget sizes its child to match a given aspect ratio.
@Deprecated('Use AspectRatioSpec instead')
final class AspectRatioModifierSpec extends AspectRatioSpec {
  const AspectRatioModifierSpec(double aspectRatio)
      : super(aspectRatio: aspectRatio);
}

@Deprecated('Use AspectRatioSpecAttribute instead')
final class AspectRatioModifierAttribute extends AspectRatioSpecAttribute {
  const AspectRatioModifierAttribute(double aspectRatio)
      : super(aspectRatio: aspectRatio);
}

@Deprecated('Use AspectRatioSpecUtility instead')
typedef AspectRatioUtility = AspectRatioSpecUtility;
