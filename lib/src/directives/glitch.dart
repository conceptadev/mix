import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class GlitchText extends StatefulWidget {
  const GlitchText(this.text, {super.key, required this.style});

  final String text;
  final TextStyle style;

  @override
  _GlitchTextState createState() => _GlitchTextState();
}

class _GlitchTextState extends State<GlitchText> {
  final _random = Random();
  late Timer _positionTimer;
  late Timer _shadowTimer;
  double _offsetX = 0;
  double _offsetY = 0;
  double _shadowOffsetX = 0;
  double _shadowOffsetY = 0;
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    _positionTimer =
        Timer.periodic(const Duration(milliseconds: 100), _randomizePosition);
    _shadowTimer =
        Timer.periodic(const Duration(milliseconds: 80), _randomizeShadow);
  }

  void _randomizePosition(Timer timer) {
    setState(() {
      _offsetX = _random.nextDouble() * 10 - 5;
      _offsetY = _random.nextDouble() * 10 - 5;
      _scale = 1 + (_random.nextDouble() * 0.1 - 0.095);
    });
  }

  void _randomizeShadow(Timer timer) {
    setState(() {
      _shadowOffsetX = _random.nextDouble() * 10 - 1;
      _shadowOffsetY = _random.nextDouble() * 10 - 1;
    });
  }

  @override
  void dispose() {
    _positionTimer.cancel();
    _shadowTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(_offsetX, _offsetY)
        ..scale(_scale),
      child: Text(
        widget.text,
        style: widget.style.copyWith(
          shadows: [
            Shadow(
              color: Colors.red.withOpacity(0.6),
              offset: Offset(_shadowOffsetX, _shadowOffsetY),
              blurRadius: 0,
            ),
            Shadow(
              color: Colors.blue.withOpacity(0.6),
              offset: Offset(-_shadowOffsetX, -_shadowOffsetY),
              blurRadius: 0,
            ),
          ],
          decoration: _random.nextBool()
              ? TextDecoration.underline
              : TextDecoration.lineThrough,
          decorationColor: Colors.white,
          decorationThickness: _random.nextDouble() * 5 - 1,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Glitch Effect')),
      body: const Center(
        child: GlitchText(
          'GLITCH',
          style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  ));
}
