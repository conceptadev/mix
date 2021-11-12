import 'package:flutter/material.dart';

class Nothing extends StatelessWidget {
  const Nothing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(size: Size.zero);
  }
}
