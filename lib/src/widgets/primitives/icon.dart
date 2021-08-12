import 'package:flutter/material.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/mixer.dart';
import '../mix_widget.dart';
import 'box.dart';

class IconMix extends MixWidget {
  const IconMix(
    Mix mix, {
    required this.icon,
    this.semanticLabel,
    Key? key,
  }) : super(mix, key: key);

  final IconData icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final mixer = Mixer.build(context, mix);
    return IconMixerWidget(
      mixer,
      icon: icon,
      semanticLabel: semanticLabel,
    );
  }
}

class IconMixerWidget extends MixerWidget {
  const IconMixerWidget(
    Mixer mixer, {
    required this.icon,
    this.semanticLabel,
    Key? key,
  }) : super(mixer, key: key);

  final IconData icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return BoxMixerWidget(
      mixer,
      child: Icon(
        icon,
        size: mixer.iconSize?.value,
        color: mixer.iconColor?.value,
        textDirection: mixer.textDirection?.value,
        semanticLabel: semanticLabel,
      ),
    );
  }
}
