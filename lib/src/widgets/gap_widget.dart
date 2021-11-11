import 'package:flutter/material.dart';

class GapWidget extends StatelessWidget {
  const GapWidget(
    this.size, {
    Key? key,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
    );
  }
}
