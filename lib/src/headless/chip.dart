import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// Usage example:
///
/// ```dart
/// ChipX(
///   children: const [IconMix(icon: Icons.add), TextMix('Lorem')],
///   onPressed: () => debugPrint('lorem'),
/// ),
/// ```
class ChipX extends StatelessWidget {
  /// Creates a chip
  const ChipX({
    Key? key,
    required this.children,
    this.mix,
    this.onPressed,
  }) : super(key: key);

  /// The content of the chip.
  ///
  /// Usually a combination of [IconMix] with [TextMix]
  final List<Widget> children;
  final Mix? mix;

  /// Called when the chip is pressed. If null, the chip will have no behavior
  final VoidCallback? onPressed;

  Mix get __mix {
    return Mix(
      margin(10),
      elevation(3),
      rounded(80),
      px(10),
      py(4),
      gap(10),
      bgColor($surface),
      animated(),
      hover(
        bgColor(Colors.grey.shade50),
      ),
      press(
        bgColor(Colors.grey.shade200),
      ),

      // Text
      apply(Mix(
        iconSize(20),
        paragraph(
          textStyle($body1),
        ),
        textStyle($body2),
        font(
          weight: FontWeight.w500,
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final finalMix = Mix.combine(__mix, mix);
    if (onPressed == null) {
      return HBox(
        children: children,
        mix: finalMix,
      );
    }
    return Pressable(
      mix: finalMix,
      onPressed: onPressed,
      child: Row(children: children),
    );
  }
}
