import 'package:flutter/material.dart';
import 'package:mix/src/attributes/exports.dart';
import 'package:mix/src/mixer/mix_factory.dart';
import 'package:mix/src/widgets/box.widget.dart';
import 'package:mix/src/widgets/mixable.widget.dart';
import 'package:mix/src/widgets/pressable.widget.dart';
/// _Mix_ corollary to Flutter _RadioButton_ class
///
/// Default _Mix_ values:
/// ```
///      animated(),
///      rounded(100),
///      bgColor(Colors.transparent),
///      border(
///        color: Colors.grey.shade300,
///        width: 2,
///      ),
///      (whenOn | hover)(
///        border(color: Colors.blue),
///      ),
///      disabled(
///        border(color: Colors.grey.shade300),
///      )
/// ```
/// {@category Mixable Widgets}
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
      mix: Mix.chooser(
        condition: checked,
        ifTrue: mix.withVariant(whenOn),
        ifFalse: mix.withVariant(whenOff),
      ),
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
      mix: Mix.chooser(
        condition: checked,
        ifTrue: __mix.withVariant(RadioButtonX.whenOn),
        ifFalse: __mix.withVariant(RadioButtonX.whenOff),
      ),
      child: child,
    );
  }
}
