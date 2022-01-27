import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

const active = Variant('active');

class CheckboxX extends RemixableWidget {
  const CheckboxX({
    Key? key,
    required this.checked,
    required this.onChanged,
    Mix? mix,
  }) : super(mix, key: key);

  final bool checked;
  final ValueChanged<bool>? onChanged;

  @override
  Mix get defaultMix {
    return Mix(
      animated(),
      rounded(5),
      width(25),
      height(25),
      icon(
        size: 18,
        color: $primary,
      ),
      border(
        color: Colors.grey[300],
        width: 2,
      ),
      active(
        iconColor($primary),
      ),
      disabled(
        border(color: Colors.grey.shade300),
      ),
      (hover | active)(
        borderColor($primary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fn = onChanged;
    return Pressable(
      mix: Mix.chooser(
        condition: checked,
        ifTrue: mix.withVariant(active),
        ifFalse: mix,
      ),
      onPressed: fn == null ? null : () => fn(!checked),
      child: IconMix(
        mix: Mix(hide(!checked)),
        icon: Icons.check_rounded,
      ),
    );
  }
}
