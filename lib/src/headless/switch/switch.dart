import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/helpers/helper_short.utils.dart';
import 'package:mix/src/mixer/mix_factory.dart';

class SwitchRemix extends StatelessWidget {
  const SwitchRemix({
    Key? key,
    this.checked = true,
    this.onChanged,
    this.root = const SwitchRoot(),
    this.thumb = const SwitchThumb(),
  }) : super(key: key);

  final bool checked;

  final ValueChanged<bool>? onChanged;

  final SwitchRoot root;
  final SwitchThumb thumb;

  @override
  Widget build(BuildContext context) {
    final fn = onChanged;

    return Pressable(
      onPressed: fn == null ? null : () => fn(!checked),
      child: root.build(
        context: context,
        checked: checked,
        child: thumb.build(
          context,
          checked,
        ),
      ),
    );
  }
}

class SwitchThumb {
  const SwitchThumb({
    this.mix,
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

  Mix get __activeMix {
    return Mix(
      apply(__mix),
      apply(activeMix),
    );
  }

  Widget build(BuildContext context, bool checked) {
    return Box(
      key: key,
      mix: Mix.chooser(
        condition: checked,
        trueMix: __activeMix,
        falseMix: __mix,
      ),
    );
  }
}

class SwitchRoot {
  const SwitchRoot({
    this.mix,
    this.activeMix,
    this.key,
  });

  final Mix? mix;
  final Mix? activeMix;
  final Key? key;

  Mix get __mix {
    return Mix(
      animated(),
      height(20),
      width(36),
      rounded(100),
      bgColor(Colors.black26),
      align(Alignment.centerLeft),
      apply(mix),
    );
  }

  Mix get __activeMix {
    return Mix(
      apply(__mix),
      bgColor(Colors.black87),
      align(Alignment.centerRight),
      apply(activeMix),
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
        trueMix: __activeMix,
        falseMix: __mix,
      ),
      child: child,
    );
  }
}
