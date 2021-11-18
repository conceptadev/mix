import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/helpers/helper_short.utils.dart';
import 'package:mix/src/mixer/mix_factory.dart';

class SwitchX extends StatelessWidget {
  const SwitchX({
    Key? key,
    this.active = true,
    this.onChanged,
    this.root = const SwitchRoot(Mix.constant),
    this.thumb = const SwitchThumb(Mix.constant),
  }) : super(key: key);

  final bool active;

  final ValueChanged<bool>? onChanged;

  final SwitchRoot root;
  final SwitchThumb thumb;

  // ignore: non_constant_identifier_names
  static SwitchRoot Root<T extends Attribute>(Mix<T> mix, {Key? key}) {
    return SwitchRoot(mix, key: key);
  }

  // ignore: non_constant_identifier_names
  static SwitchThumb Thumb<T extends Attribute>(Mix<T> mix, {Key? key}) {
    return SwitchThumb(mix, key: key);
  }

  @override
  @override
  Widget build(BuildContext context) {
    final fn = onChanged;

    return Pressable(
      onPressed: fn == null ? null : () => fn(!active),
      child: root.build(
        context: context,
        checked: active,
        child: thumb.build(
          context,
          active,
        ),
      ),
    );
  }
}

class SwitchThumb {
  const SwitchThumb(
    this.mix, {
    this.activeMix,
    this.key,
  });

  final Mix? mix;
  final Mix? activeMix;
  final Key? key;

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
      key: key,
      mix: Mix.chooser(
        condition: checked,
        trueMix: __mix.getVariant(#active),
        falseMix: __mix,
      ),
    );
  }
}

class SwitchRoot {
  const SwitchRoot(
    this.mix, {
    this.key,
  });

  final Mix? mix;
  final Key? key;

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

  Widget build({
    required BuildContext context,
    required bool checked,
    required Widget? child,
  }) {
    return Box(
      key: key,
      mix: Mix.chooser(
        condition: checked,
        trueMix: __mix.getVariant(#active),
        falseMix: __mix,
      ),
      child: child,
    );
  }
}
