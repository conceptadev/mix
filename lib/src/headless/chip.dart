import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// _Mix_ corollary to Flutter _Chip_ Widget
///
/// Default _Mix_ values:
/// ```dart
///      margin(10),
///      elevation(3),
///      rounded(80),
///      px(10),
///      py(4),
///      gap(10),
///      bgColor(MaterialTokens.colorScheme.surface),
///      animated(),
///      hover(
///        bgColor(Colors.grey.shade50),
///      ),
///      press(
///        bgColor(Colors.grey.shade200),
///      ),
///
///      // Text
///      apply(Mix(
///        iconSize(20),
///        paragraph(
///          textStyle(MaterialTokens.colorScheme.body1),
///        ),
///        textStyle(MaterialTokens.colorScheme.body2),
///        font(
///          weight: FontWeight.w500,
///        ),
/// ```

/// Usage example:
///
/// ```dart
/// ChipX(
///   children: const [IconMix(icon: Icons.add), TextMix('Lorem')],
///   onPressed: () => debugPrint('lorem'),
/// ),
/// ```
/// {@category Mixable Widgets}
class ChipX extends RemixableWidget {
  /// Creates a chip
  const ChipX({
    Key? key,
    required this.children,
    Mix? mix,
    this.onPressed,
  }) : super(mix, key: key);

  /// The content of the chip.
  ///
  /// Usually a combination of [IconMix] with [TextMix]
  final List<Widget> children;

  /// Called when the chip is pressed. If null, the chip will have no behavior
  final VoidCallback? onPressed;

  @override
  Mix get baseMix {
    return Mix(
      margin(10),
      elevation(3),
      rounded(80),
      px(10),
      py(4),
      gap(10),
      bgColor(MaterialTokens.colorScheme.surface),
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
          textStyle(MaterialTokens.textTheme.bodyText1),
        ),
        textStyle(MaterialTokens.textTheme.bodyText2),
        font(
          weight: FontWeight.w500,
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (onPressed == null) {
      return HBox(
        children: children,
        mix: mix,
      );
    }

    return Pressable(
      onPressed: onPressed,
      child: HBox(
        mix: mix,
        children: children,
      ),
    );
  }
}
