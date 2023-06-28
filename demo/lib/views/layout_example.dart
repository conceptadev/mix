import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

StyleMix get mix => StyleMix(
      height(300),
      width(300),
      rounded(10),
      elevation(2),
      backgroundColor($M3Color.surface),
      alignment(Alignment.center),
      textStyle(color: $M3Color.onSurface),
    );

class LayoutExample extends StatelessWidget {
  const LayoutExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flexAlign = StyleMix(
      mainAxisAlignment(MainAxisAlignment.start),
      crossAxis(CrossAxisAlignment.start),
      mainAxisSize(MainAxisSize.max),
      width(double.infinity),
    );

    final onSurfaceMix = StyleMix(
      textStyle(color: Colors.black),
      onDark(
        textStyle(color: Colors.white),
      ),
    );

    final headingMix = StyleMix.fromAttributes([
      textStyle(fontSize: 24),
      ...onSurfaceMix.toAttributes(),
    ]);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: StyledFlex(
        direction: Axis.vertical,
        style: flexAlign,
        children: [
          flexAlign.container(child: const SizedBox()),
          StyledText(
            "Stack",
            style: headingMix,
          ),
          StyledStack(
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
          ),
        ],
      ),
    );
  }
}
