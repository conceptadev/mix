import 'package:flutter/material.dart';

import '../../mix.dart';
import 'style_attribute.dart';

@immutable
class CommonAttributes extends StyleAttribute<CommonSpec> {
  final DurationAttribute? _animationDuration;
  final CurveAttribute? _animationCurve;
  final TextDirectionAttribute? _textDirection;
  final VisibleAttribute? _visible;
  const CommonAttributes({
    VisibleAttribute? visible,
    DurationAttribute? animationDuration,
    CurveAttribute? animationCurve,
    TextDirectionAttribute? textDirection,
  })  : _visible = visible,
        _animationDuration = animationDuration,
        _animationCurve = animationCurve,
        _textDirection = textDirection;

  @override
  CommonAttributes merge(CommonAttributes? other) {
    if (other == null) return this;

    return CommonAttributes(
      visible: mergeAttr(_visible, other._visible),
      animationDuration:
          mergeAttr(_animationDuration, other._animationDuration),
      animationCurve: mergeAttr(_animationCurve, other._animationCurve),
      textDirection: mergeAttr(_textDirection, other._textDirection),
    );
  }

  @override
  CommonSpec resolve(MixData mix) {
    return CommonSpec(
      visible: resolveAttr(_visible, mix),
      animationCurve: resolveAttr(_animationCurve, mix),
      animationDuration: resolveAttr(_animationDuration, mix),
      textDirection: resolveAttr(_textDirection, mix),
    );
  }

  @override
  get props => [_visible];
}

class CommonSpec extends Spec<CommonSpec> {
  final bool visible;
  final TextDirection textDirection;
  final Duration animationDuration;
  final Curve animationCurve;

  static const defaults = CommonSpec(
    visible: true,
    animationCurve: Curves.linear,
    animationDuration: Duration(milliseconds: 200),
    textDirection: TextDirection.ltr,
  );

  const CommonSpec({
    required this.visible,
    required this.animationCurve,
    required this.animationDuration,
    required this.textDirection,
  });

  @override
  CommonSpec copyWith({
    bool? visible,
    Duration? animationDuration,
    Curve? animationCurve,
    TextDirection? textDirection,
  }) {
    return CommonSpec(
      visible: visible ?? this.visible,
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      textDirection: textDirection ?? this.textDirection,
    );
  }

  @override
  CommonSpec lerp(CommonSpec other, double t) {
    return CommonSpec(
      visible: t < 0.5 ? visible : other.visible,
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration:
          lerpDuration(animationDuration, other.animationDuration, t),
      textDirection: t < 0.5 ? textDirection : other.textDirection,
    );
  }

  @override
  get props => [visible, animationDuration, animationCurve, textDirection];
}
