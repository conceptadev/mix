import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/helpers/helper_short.utils.dart';
import 'package:mix/src/mixer/mix_factory.dart';

class SwitchRemix extends StatelessWidget {
  const SwitchRemix({
    Key? key,
    this.active = true,
    this.mix,
    this.onChanged,
    this.thumb = const SwitchThumb(Mix.constant),
  }) : super(key: key);

  final bool active;

  final ValueChanged<bool>? onChanged;
  final SwitchThumb thumb;
  final Mix? mix;

  Mix get __mix {
    return Mix(
      animated(),
      height(20),
      width(36),
      rounded(100),
      bgColor(Colors.black26),
      align(Alignment.centerLeft),
      'active'.variant(
        align(Alignment.centerRight),
      ),
      apply(mix),
    );
  }

  // ignore: non_constant_identifier_names
  static SwitchThumb Thumb<T extends Attribute>(Mix<T> mix) {
    return SwitchThumb(mix);
  }

  @override
  @override
  Widget build(BuildContext context) {
    final fn = onChanged;

    return Pressable(
        onPressed: fn == null ? null : () => fn(!active),
        child: Box(
          key: key,
          mix: Mix.chooser(
            condition: active,
            trueMix: __mix.withVariant('active'),
            falseMix: __mix,
          ),
          child: thumb.build(
            context,
            active,
          ),
        ));
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
      apply(mix),
    );
  }

  Widget build(BuildContext context, bool checked) {
    return Box(
      mix: Mix.chooser(
        condition: checked,
        trueMix: __mix.withVariant('active'),
        falseMix: __mix,
      ),
    );
  }
}
