import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class VariantsOrOperator extends StatelessWidget {
  const VariantsOrOperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = StyleMix(
      box.padding(20.0),
      // Whether it's small OR medium
      (onSmall | onMedium)(
        box.width(300),
        box.height(400),
        box.color.white(),
      ),
    );

    return Center(
      child: Box(
        style: mix,
      ),
    );
  }
}
