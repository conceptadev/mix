import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

PressableWidgetFn get button => Mix(
      textStyle($body2),
      bold(),
      fontSize(16.0),
      animated(),
      bgColor($primary),
      (hover)(
        bgColor($primaryVariant),
      ),
      paddingHorizontal(15.0),
      paddingVertical(8.0),
      rounded(5),
    ).pressable;

class ButtonsPreview extends StatelessWidget {
  const ButtonsPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          button(
            child: const TextMix('Details'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
