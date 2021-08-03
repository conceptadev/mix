import 'package:example/remix/design_tokens/colors.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class RmxCard extends StatelessWidget {
  const RmxCard({
    required this.child,
    Key? key,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Box(
      Mix(
        m(40),
        p(40),
        rounded(10),
        bgColor(RxColors.white),
        bgColor(RxColors.grey.shade800).onDark,
        withMix(shadow20),
      ),
      child: child,
    );
  }
}
