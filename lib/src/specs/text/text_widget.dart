import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import '../../utils/helper_util.dart';
import 'text_spec.dart';

/// [StyledText] - A styled widget for displaying text with a mix of styles.
///
/// This widget extends [StyledWidget] and provides a way to display text with
/// styles defined in a `Style`. It is ideal for creating text elements in your
/// UI where the text styling needs to be dynamic and controlled through a styling system.
///
/// The [StyledText] is particularly useful when you need text elements that adapt
/// their styles based on different conditions or states, providing a more flexible
/// and maintainable approach compared to static styling.
///
/// Parameters:
///   - [text]: The text string to display.
///   - [semanticsLabel]: An optional semantics label for the text, used by screen readers.
///   - [style]: The [Style] to be applied to the text. Inherits from [StyledWidget].
///   - [key]: The key for the widget. Inherits from [StyledWidget].
///   - [inherit]: Determines whether the [StyledText] should inherit styles from its ancestors.
///     Default is `true`. Inherits from [StyledWidget].
///   - [locale]: The locale used for the text, affecting how it is displayed.
///
/// Example usage:
/// ```dart
/// StyledText(
///   'content',
///   style: myStyle,
/// )
/// ```
///
/// This example shows a `StyledText` widget displaying the string 'content'
/// with the styles defined in `myStyle`.
class StyledText extends StyledWidget {
  const StyledText(
    this.text, {
    this.semanticsLabel,
    super.style,
    super.key,
    super.inherit = true,
    this.locale,
  });

  final String text;
  final String? semanticsLabel;
  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      return MixedText(
        text: text,
        semanticsLabel: semanticsLabel,
        locale: locale,
      );
    });
  }
}

/// [MixedText] - A StatelessWidget for rendering text with styling defined in [MixData].
///
/// This widget applies the styling rules from `MixData` to a [Text] widget. It is
/// used internally by [StyledText] to render text according to the specified styles.
/// It offers granular control over various text properties like style, alignment,
/// direction, and more, based on the attributes defined in the `MixData`.
///
/// Parameters:
///   - [text]: The text string to display.
///   - [mix]: The `MixData` representing the current styling context.
///   - [semanticsLabel]: An optional semantics label for the text.
///   - [locale]: The locale used for the text.
///   - [key]: The key for the widget.
class MixedText extends StatelessWidget {
  const MixedText({
    required this.text,
    this.mix,
    this.semanticsLabel,
    this.locale,
    this.decoratorOrder = const [],
    super.key,
  });

  final String text;
  final String? semanticsLabel;
  final Locale? locale;
  final MixData? mix;
  final List<Type> decoratorOrder;

  @override
  Widget build(BuildContext context) {
    // Retrieve the mix from the context or use the provided mix.
    final mix = this.mix ?? MixProvider.of(context);
    // Resolve the TextSpec for styling properties.
    final spec = TextSpec.of(mix);

    // The Text widget is used here, applying the resolved styles and properties from TextSpec.
    final textWidget = Text(
      spec.directive?.apply(text) ?? text,
      style: spec.style,
      strutStyle: spec.strutStyle,
      textAlign: spec.textAlign,
      textDirection: spec.textDirection,
      locale: locale,
      softWrap: spec.softWrap,
      overflow: spec.overflow,
      textScaleFactor: spec.textScaleFactor,
      maxLines: spec.maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: spec.textWidthBasis,
      textHeightBehavior: spec.textHeightBehavior,
    );

    return shouldApplyDecorators(
      mix: mix,
      orderOfDecorators: decoratorOrder,
      child: textWidget,
    );
  }
}
