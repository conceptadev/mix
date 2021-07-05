import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerBackground extends StatelessWidget {
  const ContainerBackground({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlueAccent),
        image: DecorationImage(
          image: AssetImage('images/background.png'),
        ),
      ),
      child: child,
    );
  }
}
