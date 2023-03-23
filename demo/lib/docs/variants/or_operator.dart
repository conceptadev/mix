import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class VariantsOrOperator extends StatelessWidget {
  const VariantsOrOperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = MixFactory(
      padding(20.0),
      (onSmall | onMedium)(
        // Whether it's small OR medium
        width(300),
        height(400),
        bgColor(Colors.white),
      ),
    );

    return Center(
      child: Box(
        mix: mix,
      ),
    );
  }
}
