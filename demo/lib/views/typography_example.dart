import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

StyleMix get button => StyleMix(
      textStyle(as: $M3Text.bodyMedium),
      bold(),
      textStyle(fontSize: 6.0),
      backgroundColor($M3Color.primary),
      onHover(
        backgroundColor($M3Color.secondary),
      ),
      paddingHorizontal(15.0),
      paddingVertical(8.0),
    );

class TypographyExample extends StatelessWidget {
  const TypographyExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Pressable(
            child: StyledContainer(
              style: button,
              child: StyledText(
                'Details',
                style: button,
              ),
            ),
            onPressed: () {
              return;
            },
          ),
        ],
      ),
    );
  }
}
