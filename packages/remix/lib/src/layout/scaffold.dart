import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import '../components/toast/toast_layer.dart';

class Scaffold extends StatelessWidget {
  const Scaffold({
    super.key,
    required this.body,
    this.color,
    this.colorOnDark,
  });

  final Widget body;
  final Color? color;
  final Color? colorOnDark;

  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $box.color(color ?? const Color(0xFFFFFFFF)),
        $on.dark($box.color(colorOnDark ?? const Color(0xFF000000))),
      ),
      child: ToastLayer(body: body),
    );
  }
}
