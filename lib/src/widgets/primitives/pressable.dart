import 'package:flutter/material.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/mixer.dart';
import '../mix_widget.dart';
import 'box.dart';

enum _PressableState {

  disabled,
  focused,
  hovering,
  pressing,

}

class Pressable extends MixWidget {
  const Pressable(
    Mix mix, {
    required this.child,
    required this.onPressed,
    this.onLongPressed,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    Key? key,
  }) : super(mix, key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final mixer = Mixer.build(context, mix);
    return PressableMixerWidget(
      mixer,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      child: child,
    );
  }
}

class PressableMixerWidget extends MixerWidget {
  const PressableMixerWidget(
    Mixer mixer, {
    required this.child,
    required this.onPressed,
    this.onLongPressed,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    Key? key,
  }) : super(mixer, key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: BoxMixerWidget(
        mixer,
        child: child,
      ),
    );
  }
}
