import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/helpers/helper_short.utils.dart';

class CheckboxRemix extends StatelessWidget {
  const CheckboxRemix({
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
      width(30),
      height(30),
      dark(
        iconColor($onSecondary),
      ),
      border(
        color: Colors.blue,
        width: 2,
      ),
      'active'.variant(
        icon(color: $onPrimary),
        bgColor($primary),
        dark(
          icon(color: $onPrimary),
          bgColor($secondary),
        ),
      ),
      dark(),
      apply(mix),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fn = onChanged;
    return Pressable(
      mix: mix,
      onPressed: fn == null ? null : () => fn(!checked),
      child: Box(
        mix: Mix.chooser(
          condition: checked,
          trueMix: __mix.withVariant('active'),
          falseMix: __mix,
        ),
        child: IconMix(
          mix: Mix(hide(!checked)),
          icon: Icons.check_rounded,
        ),
      ),
    );
  }
}
