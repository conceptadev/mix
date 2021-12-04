import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

const active = Var('active');

class CheckboxX extends StatelessWidget {
  const CheckboxX({
    Key? key,
    required this.checked,
    required this.onChanged,
    this.mix,
  }) : super(key: key);
  final Mix? mix;
  final bool checked;
  final ValueChanged<bool>? onChanged;

  Mix get __mix {
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
      (hover | active)(
        borderColor($primary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fn = onChanged;
    return Pressable(
      mix: Mix.combine(__mix, mix),
      variant: checked ? active : null,
      onPressed: fn == null ? null : () => fn(!checked),
      child: IconMix(
        mix: Mix(hide(!checked)),
        icon: Icons.check_rounded,
      ),
    );
  }
}
