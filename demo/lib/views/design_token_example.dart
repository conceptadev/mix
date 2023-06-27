import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

StyleMix get mix => StyleMix(
      height(100),
      width(100),
      rounded(10),
      elevation(2),
      backgroundColor($M3Color.surface),
      alignment(Alignment.center),
      textStyle(color: $M3Color.onSurface),
    );

class DesignTokenExample extends StatelessWidget {
  const DesignTokenExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styledStack = StyledStack(
      style: mix,
      children: [
        StyledContainer(
          style: mix,
          child: StyledText(
            "This is a StyledContainer inside a StyledStack!",
            style: mix,
          ),
        ),
        StyledContainer(
          style: mix.merge(
            StyleMix(
              width(200),
              height(100),
              backgroundColor(Colors.green),
            ),
          ),
          child: StyledText(
            "This is another StyledContainer inside a StyledStack!",
            style: mix,
          ),
        ),
      ],
    );

    return StyledContainer(
      style: mix,
      child: StyledText(
        'Surface',
        style: mix,
      ),
    );
  }
}
