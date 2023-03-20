import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

class HeadlessExample extends HookWidget {
  const HeadlessExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trackMix = Mix(
      height(22),
      rounded(11),
      bgColor(Colors.purple.shade200),
      onActive(
        bgColor(Colors.purple.shade700),
      ),
      onDisabled(
        bgColor(Colors.grey.shade400),
      ),
    );

    return SwitchX(
      value: true,
      onChange: (value) {},
      // to disable the switch, and apply the onDisabled variant, set the onChange to null
      // onChanged: null,
      track: SwitchXTrack(mix: trackMix),
      thumb: SwitchXThumb(
        mix: Mix(
          margin(2),
          width(18),
          height(18),
          rounded(10),
          align(Alignment.center),
        ),
        child: IconMix(
          Icons.check,
          mix: Mix(
            iconSize(12),
            onDisabled(
              iconColor(Colors.grey.shade400),
            ),
          ),
        ),
      ),
    );
  }
}
