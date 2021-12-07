import 'package:flutter/material.dart';
import 'package:mix/src/attributes/exports.dart';
import 'package:mix/src/mixer/mix_factory.dart';
import 'package:mix/src/widgets/box.widget.dart';
import 'package:mix/src/widgets/mix.widget.dart';
import 'package:mix/src/widgets/pressable.widget.dart';

class RadioButtonX extends RemixableWidget {
  const RadioButtonX({
    Key? key,
    required this.checked,
    required this.onChanged,
    Mix? mix,
    this.indicator = const RadioButtonIndicator(Mix.constant),
  }) : super(mix, key: key);

  final bool checked;
  final ValueChanged<bool>? onChanged;
  final RadioButtonIndicator indicator;

  static Variant whenOn = const Variant('active');

  static Variant whenOff = const Variant('off');
  @override
  Mix get defaultMix {
    return Mix(
      animated(),
      rounded(100),
      bgColor(Colors.transparent),
      border(
        color: Colors.grey.shade300,
        width: 2,
      ),
      (whenOn | hover)(
        border(color: Colors.blue),
      ),
      disabled(
        border(color: Colors.grey.shade300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fn = onChanged;
    return Pressable(
      mix: mix,
      variant: checked ? whenOn : whenOff,
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
      RadioButtonX.whenOn(
        bgColor(Colors.blue),
      ),
      apply(mix),
    );
  }

  Widget build(BuildContext context, bool checked) {
    return Box(
      variant: checked ? RadioButtonX.whenOn : RadioButtonX.whenOff,
      mix: __mix,
      child: child,
    );
  }
}
