import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class VariantsAndOperator extends StatelessWidget {
  const VariantsAndOperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = StyleMix(
      padding(20.0),
      text.style(color: Colors.white),
      (onHover & onEnabled)(
        // When it's hovering AND pressing
        text.style(color: Colors.black),
        text.style.bold(),
      ),
    );

    return Center(
      child: Pressable(
        onPressed: () {
          return;
        },
        child: StyledContainer(
          style: mix,
          child: const StyledText('HOVER THIS TO CHANGE THE TEXT COLOR'),
        ),
      ),
    );
  }
}
