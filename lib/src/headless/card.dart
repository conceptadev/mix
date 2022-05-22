import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/theme/material_theme/material_tokens.dart';

/// _Mix_ corollary to Flutter _Card_ widget
///
/// Default _Mix_ attributes:
/// ```dart
///    margin(20),
///    elevation(6),
///    rounded(10),
///    padding(20),
///    gap(10),
///    crossAxis(CrossAxisAlignment.start),
///    bgColor($surface),
///    paragraph(
///      textStyle($body1),
///    ),
///    title(
///      titleCase(),
///      textStyle($h6),
///      font(
///        weight: FontWeight.bold,
///      ),
///    ),
/// ```
/// Usage example:
///
/// ```dart
/// CardX(
///  children: [
///    TextMix(
///      titleContent,
///      variant: title,
///    ),
///    TextMix(
///      paragraphContent,
///      variant: paragraph,
///    ),
///  ],
/// ),
/// ```
/// {@category Mixable Widgets}
class CardX extends RemixableWidget {
  /// Creates a card
  const CardX({
    Key? key,
    required this.children,
    Mix? mix,
  }) : super(mix, key: key);

  /// The content of the card.
  ///
  /// [title] and [paragraph] can be used alongside with [TextMix]:
  ///
  /// ```dart
  /// TextMix(
  ///   'This is the card title',
  ///   variant: title,
  /// )
  /// ```
  final List<Widget> children;

  @override
  Mix get baseMix {
    return Mix(
      margin(20),
      elevation(6),
      rounded(10),
      padding(20),
      gap(10),
      crossAxis(CrossAxisAlignment.start),
      bgColor(MaterialTokens.colorScheme.surface),
      paragraph(
        textStyle(MaterialTokens.textTheme.bodyText1),
      ),
      title(
        titleCase(),
        textStyle(MaterialTokens.textTheme.headline6),
        font(
          weight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VBox(mix: mix, children: children);
  }
}
