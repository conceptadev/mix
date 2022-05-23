import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get button => Mix(
      textStyle(MaterialTokens.textTheme.bodyText2),
      bold(),
      fontSize(16.0),
      animated(),
      bgColor(MaterialTokens.colorScheme.primary),
      hover(
        bgColor(MaterialTokens.colorScheme.secondary),
      ),
      paddingHorizontal(15.0),
      paddingVertical(8.0),
      rounded(5),
    );

class ButtonsPreview extends StatelessWidget {
  const ButtonsPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Pressable(
            child: Box(
              mix: button,
              child: const TextMix('Details'),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
