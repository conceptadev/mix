import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/helpers/helper_short.utils.dart';

class RadioButtonX extends StatelessWidget {
  const RadioButtonX({
    Key? key,
    required this.checked,
    required this.onChanged,
    this.mix,
    this.indicator = const RadioButtonIndicator(Mix.constant),
  }) : super(key: key);
  final Mix? mix;
  final bool checked;
  final ValueChanged<bool>? onChanged;
  final RadioButtonIndicator indicator;

  static Var on = const Var('active');
  static Var disabled = const Var('disabled');
  static Var off = const Var('off');

  Mix get __mix {
    return Mix(
      animated(),
      rounded(100),
      bgColor(Colors.transparent),
      border(
        color: Colors.blue,
        width: 2,
      ),
      active(
        border(color: Colors.blue),
      ),
      apply(mix),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fn = onChanged;
    return Pressable(
      mix: __mix,
      variant: active,
      onPressed: fn == null ? null : () => fn(!checked),
      child: indicator.build(
        context,
        checked,
      ),
    );
  }
}

extension RadioButtonRemixExtension on RadioButtonX {
  // ignore: non_constant_identifier_names
  static RadioButtonIndicator Indicator(Mix? mix, {Widget? child}) {
    return RadioButtonIndicator(mix);
  }
}

class RadioButtonIndicator {
  const RadioButtonIndicator(
    this.mix, {
    this.child,
  });

  final Mix? mix;
  final Widget? child;
  Mix get __mix {
    return Mix(
      height(12),
      width(12),
      animated(),
      rounded(100),
      margin(4),
      RadioButtonX.on(
        bgColor(Colors.blue),
      ),
      apply(mix),
    );
  }

  Widget build(BuildContext context, bool checked) {
    return Box(
      variant: checked ? RadioButtonX.on : RadioButtonX.off,
      mix: __mix,
      child: child,
    );
  }
}
