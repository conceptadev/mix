import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

class BasicExample extends HookWidget {
  const BasicExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = Mix(
      height(100),
      width(100),
      rounded(10),
      elevation(2),
      // bgColor(Colors.purple),
      bgColor(theme<MyColors, Color>((myColors) => myColors.brandColor)),
      align(Alignment.center),
      textColor(Colors.white),
    );

    return Box(
      mix: mix,
      child: const TextMix('Gradient Box'),
    );
  }
}

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.brandColor,
    required this.danger,
  });

  final Color brandColor;
  final Color danger;

  @override
  MyColors copyWith({Color? brandColor, Color? danger}) {
    return MyColors(
      brandColor: brandColor ?? this.brandColor,
      danger: danger ?? this.danger,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      brandColor: Color.lerp(brandColor, other.brandColor, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $brandColor, danger: $danger)';
}
