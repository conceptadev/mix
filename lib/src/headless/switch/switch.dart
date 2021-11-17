import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/helpers/helper_short.utils.dart';
import 'package:mix/src/mixer/mix_factory.dart';

class SwitchRemix extends StatelessWidget {
  const SwitchRemix({
    Key? key,
    this.checked = true,
    this.onChanged,
    this.mix,
    this.activeMix,
    this.thumbMix,
    this.thumbActiveMix,
  }) : super(key: key);

  final bool checked;

  final ValueChanged<bool>? onChanged;

  final Mix? mix;
  final Mix? activeMix;
  final Mix? thumbMix;
  final Mix? thumbActiveMix;

  Mix get __rootMix {
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

  Mix get __activeRootMix {
    return Mix(
      apply(__rootMix),
      bgColor(Colors.black87),
      align(Alignment.centerRight),
      apply(activeMix),
    );
  }

  Mix get __thumbMix {
    return Mix(
      height(12),
      width(12),
      rounded(100),
      margin(4),
      bgColor(Colors.white),
      apply(thumbMix),
    );
  }

  Mix get __thumbActiveMix {
    return Mix(
      apply(__thumbMix),
      apply(thumbActiveMix),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fn = onChanged;

    return Pressable(
      Mix(),
      onPressed: fn == null ? null : () => fn(!checked),
      child: Box(
        Mix.chooser(
          condition: checked,
          trueMix: __activeRootMix,
          falseMix: __rootMix,
        ),
        child: Box(
          Mix.chooser(
            condition: checked,
            trueMix: __thumbActiveMix,
            falseMix: __thumbMix,
          ),
        ),
      ),
    );
  }
}
