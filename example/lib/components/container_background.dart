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
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment(-2, -2),
          //   stops: [0.0, 0.5, 0.5, 1],
          //   colors: [
          //     Colors.cyan.withOpacity(0.1),
          //     Colors.cyan.withOpacity(0.1),
          //     Colors.cyan.withOpacity(0.2),
          //     Colors.cyan.withOpacity(0.2),
          //   ],
          //   tileMode: TileMode.repeated,
          // ),
          image: DecorationImage(image: AssetImage('images/background.png'))),
      child: child,
    );
  }
}
