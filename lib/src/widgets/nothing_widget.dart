import 'package:flutter/material.dart';

class Nothing extends StatelessWidget {
  const Nothing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: 0.0,
      maxHeight: 0.0,
      child: ConstrainedBox(constraints: const BoxConstraints.expand()),
    );
  }
}
