import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../animation/animation.attribute.dart';
import '../style_attribute.dart';
import '../text/text_direction/text_direction.attribute.dart';
import '../visible/visible.attribute.dart';

@immutable
class CommonAttributes extends StyleAttribute<CommonSpec> {
  final AnimationAttribute? _animation;
  final TextDirectionAttribute? _textDirection;
  final VisibleAttribute? _visible;
  const CommonAttributes({
    VisibleAttribute? visible,
    AnimationAttribute? animation,
    TextDirectionAttribute? textDirection,
  })  : _visible = visible,
        _animation = animation,
        _textDirection = textDirection;

  @override
  CommonAttributes merge(CommonAttributes? other) {
    if (other == null) return this;

    return CommonAttributes(
      visible: mergeProp(_visible, other._visible),
      animation: mergeProp(_animation, other._animation),
      textDirection: mergeProp(_textDirection, other._textDirection),
    );
  }

  @override
  CommonSpec resolve(MixData mix) {
    return CommonSpec(
      visible: resolveAttribute(_visible, mix),
      animation: resolveAttribute(_animation, mix),
      textDirection: resolveAttribute(_textDirection, mix),
    );
  }

  @override
  get props => [_visible];
}

class CommonSpec extends Spec {
  final bool visible;
  final TextDirection textDirection;
  final AnimationSpec animation;

  static const defaults = CommonSpec(
    visible: true,
    animation: AnimationSpec.defaults,
    textDirection: TextDirection.ltr,
  );

  const CommonSpec({
    required this.visible,
    required this.animation,
    required this.textDirection,
  });

  @override
  get props => [visible, animation];
}
