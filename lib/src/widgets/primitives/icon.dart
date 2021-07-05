import 'package:flutter/material.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/mixer.dart';
import '../mix_widget.dart';
import 'box.dart';

class IconBox extends MixWidget {
  const IconBox(
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
    return IconBoxMixer(
      mixer,
      icon: icon,
      semanticLabel: semanticLabel,
    );
  }
}

class IconBoxMixer extends MixerWidget {
  const IconBoxMixer(
    Mixer mixer, {
    required this.icon,
    this.semanticLabel,
    Key? key,
  }) : super(mixer, key: key);

  final IconData icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return BoxMixer(
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
