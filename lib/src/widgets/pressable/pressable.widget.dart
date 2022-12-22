import 'package:flutter/material.dart';

import '../../mixer/mix_factory.dart';
import '../mixable.widget.dart';
import 'gesture_box.widget.dart';

class Pressable extends StatelessWidget {
  const Pressable({
    required this.child,
    required this.onPressed,
    this.onLongPressed,
    this.focusNode,
    this.autofocus = false,
    this.behavior,
    this.mix = Mix.constant,
    Key? key,
  }) : super(key: key);

  final MixableWidget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final FocusNode? focusNode;
  final bool autofocus;
  final Mix mix;

  final HitTestBehavior? behavior;

  @override
  Widget build(BuildContext context) {
    return GestureBox(
      mix: mix,
      onTap: onPressed,
      onLongPress: onLongPressed,
      focusNode: focusNode,
      autofocus: autofocus,
      behavior: behavior,
      child: child,
    );
  }
}
