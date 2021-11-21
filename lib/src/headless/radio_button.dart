import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/helpers/helper_short.utils.dart';

class RadioButtonRemix extends StatelessWidget {
  const RadioButtonRemix({
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

  Mix get __mix {
    return Mix(
      animated(),
      rounded(100),
      bgColor(Colors.transparent),
      border(
        color: Colors.blue,
        width: 2,
      ),
      'active'.variant(
        border(color: Colors.blue),
      ),
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
          trueMix: __mix.getVariant('active'),
          falseMix: __mix,
        ),
        child: indicator.build(
          context,
          checked,
        ),
      ),
    );
  }
}

extension RadioButtonRemixExtension on RadioButtonRemix {
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
      'active'.variant(
        bgColor(Colors.blue),
      ),
      apply(mix),
    );
  }

  Widget build(BuildContext context, bool checked) {
    return Box(
      mix: Mix.chooser(
        condition: checked,
        trueMix: __mix.getVariant('active'),
        falseMix: __mix,
      ),
      child: child,
    );
  }
}
