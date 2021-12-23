import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

class BasicExample extends HookWidget {
  const BasicExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentMix = useState(Mix());
    final mix = Mix(
      height(100),
      width(100),
      rounded(10),
      elevation(2),
      bgColor(Colors.purple),
      align(Alignment.center),
      textColor(Colors.white),
    );

    final mix2 = Mix(
      height(100),
      width(100),
      rounded(10),
      elevation(2),
      bgColor(Colors.purple),
      align(Alignment.center),
      textColor(Colors.green),
    );

    useValueChanged(currentMix.value, (_, __) => print('changed'));

    return GestureDetector(
      onTap: () => currentMix.value = currentMix.value == mix ? mix2 : mix,
      child: Box(
        mix: currentMix.value,
        child: const TextMix('Purple Box'),
      ),
    );
  }
}
