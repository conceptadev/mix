import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../factory/mix_provider_data.dart';
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
    super.orderOfDecorators = const [],
  });

  final String text;
  final String? semanticsLabel;
  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {

      return mix.isAnimated
          ? AnimatedMixedText(
              text: text,
              mix: mix,
              curve: mix.animation!.curve,
              duration: mix.animation!.duration,
              semanticsLabel: semanticsLabel,
              locale: locale,
            )
          : MixedText(
              text: text,
              mix: mix,
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
    required this.mix,
    this.semanticsLabel,
    this.locale,
    super.key,
  });

  final String text;
  final String? semanticsLabel;
  final Locale? locale;
  final MixData mix;

  @override
  Widget build(BuildContext context) {
    // Resolve the TextSpec for styling properties.
    final spec = TextSpec.of(mix);

    // The Text widget is used here, applying the resolved styles and properties from TextSpec.
    return Text(
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
  }
}

class AnimatedMixedText extends StatelessWidget {
  const AnimatedMixedText({
    required this.text,
    required this.mix,
    required this.curve,
    required this.duration,
    this.semanticsLabel,
    this.locale,
    super.key,
  });

  final String text;
  final String? semanticsLabel;
  final Locale? locale;
  final MixData mix;
  final Curve curve;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final spec = TextSpec.of(mix);

    return ImplicitlyMixedText(
      text: text,
      spec: spec,
      semanticsLabel: semanticsLabel,
      duration: duration,
    );
  }
}

class ImplicitlyMixedText extends ImplicitlyAnimatedWidget {
  const ImplicitlyMixedText({
    required this.text,
    required this.spec,
    this.semanticsLabel,
    this.locale,
    super.key,
    required super.duration,
    super.curve = Curves.linear,
  });

  final String text;
  final String? semanticsLabel;
  final Locale? locale;
  final TextSpec spec;

  @override
  AnimatedWidgetBaseState<ImplicitlyMixedText> createState() =>
      _ImplicitlyMixedTextState();
}

class _ImplicitlyMixedTextState
    extends AnimatedWidgetBaseState<ImplicitlyMixedText> {
  TextSpecTween? _textSpecTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _textSpecTween = visitor(
      _textSpecTween,
      widget.spec,
      (dynamic value) => TextSpecTween(begin: value as TextSpec),
    ) as TextSpecTween?;
  }

  @override
  Widget build(BuildContext context) {
    final spec = _textSpecTween!.evaluate(animation);

    return Text(
      spec.directive?.apply(widget.text) ?? widget.text,
      style: spec.style,
      strutStyle: spec.strutStyle,
      textAlign: spec.textAlign,
      textDirection: spec.textDirection,
      locale: widget.locale,
      softWrap: spec.softWrap,
      overflow: spec.overflow,
      textScaleFactor: spec.textScaleFactor,
      maxLines: spec.maxLines,
      semanticsLabel: widget.semanticsLabel,
      textWidthBasis: spec.textWidthBasis,
      textHeightBehavior: spec.textHeightBehavior,
    );
  }
}

class TextSpecTween extends Tween<TextSpec> {
  TextSpecTween({TextSpec? begin, TextSpec? end})
      : super(begin: begin, end: end);

  @override
  TextSpec lerp(double t) => begin!.lerp(end, t);
}
