import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NumberTickerExample());
  }
}

class NumberTickerExample extends StatefulWidget {
  const NumberTickerExample({super.key});

  @override
  _NumberTickerExampleState createState() => _NumberTickerExampleState();
}

class _NumberTickerExampleState extends State<NumberTickerExample> {
  final _textController = TextEditingController();

  double _value = 0;

  void _updateValue() {
    final text = _textController.text;
    if (text.isNotEmpty && double.tryParse(text) != null) {
      setState(() {
        _value = double.parse(text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Number Ticker Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: const InputDecoration(hintText: 'Enter a number'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            AnimatedNumberTicker(value: _value),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Animate',
        onPressed: _updateValue,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

class AnimatedNumberTicker extends StatefulWidget {
  const AnimatedNumberTicker({super.key, required this.value});

  final double value;

  @override
  _AnimatedNumberTickerState createState() => _AnimatedNumberTickerState();
}

class _AnimatedNumberTickerState extends State<AnimatedNumberTicker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 0, end: widget.value).animate(_controller);
  }

  @override
  void didUpdateWidget(AnimatedNumberTicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _animation = Tween<double>(begin: _animation.value, end: widget.value)
          .animate(_controller)
        ..addListener(() {
          setState(() {});
        });
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animation.value.toStringAsFixed(2), // Display only 2 decimal places
      style: const TextStyle(fontSize: 40),
    );
  }
}
