import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get button => Mix(
      textStyle(as: MaterialTokens.textTheme.bodyText2),
      bold(),
      fontSize(16.0),
      bgColor(MaterialTokens.colorScheme.primary),
      onHover(
        bgColor(MaterialTokens.colorScheme.secondary),
      ),
      paddingHorizontal(15.0),
      paddingVertical(8.0),
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
          ),
        ],
      ),
    );
  }
}
