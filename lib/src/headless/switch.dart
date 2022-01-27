import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/exports.dart';
import 'package:mix/src/mixer/mix_factory.dart';
import 'package:mix/src/theme/refs/color_tokens.dart';
import 'package:mix/src/widgets/box.widget.dart';
import 'package:mix/src/widgets/mixable.widget.dart';
import 'package:mix/src/widgets/pressable.widget.dart';

class SwitchX extends RemixableWidget {
  const SwitchX({
    Key? key,
    this.active = true,
    Mix? mix,
    this.onChanged,
    this.thumb = const SwitchThumb(Mix.constant),
  }) : super(mix, key: key);

  final bool active;

  final ValueChanged<bool>? onChanged;
  final SwitchThumb thumb;

  static Variant whenOn = const Variant('active');
  static Variant whenOff = const Variant('off');

  @override
  Mix get defaultMix {
    return Mix(
      animated(),
      height(20),
      width(36),
      rounded(100),
      bgColor($onPrimary),
      whenOff(
        align(Alignment.centerLeft),
        bgColor(Colors.grey.shade300),
      ),
      whenOn(
        align(Alignment.centerRight),
        bgColor($primary),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  static SwitchThumb Thumb<T extends Attribute>(Mix<T> mix) {
    return SwitchThumb(mix);
  }

  @override
  Widget build(BuildContext context) {
    final fn = onChanged;

    return Pressable(
      onPressed: fn == null ? null : () => fn(!active),
      mix: Mix.chooser(
        condition: active,
        ifTrue: mix.withVariant(SwitchX.whenOn),
        ifFalse: mix.withVariant(SwitchX.whenOff),
      ),
      child: thumb.build(
        context,
        active,
      ),
    );
  }
}

class SwitchThumb {
  const SwitchThumb(this.mix);

  final Mix? mix;

  Mix get __mix {
    return Mix(
      height(12),
      width(12),
      rounded(100),
      margin(4),
      bgColor(Colors.white),
    );
  }

  Widget build(BuildContext context, bool checked) {
    return Box(
      mix: Mix.chooser(
        condition: checked,
        ifTrue: __mix.withVariant(SwitchX.whenOn),
        ifFalse: __mix.withVariant(SwitchX.whenOff),
      ),
    );
  }
}
