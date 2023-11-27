import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/directive.dart';

class TextMixtureProvider extends InheritedWidget {
  const TextMixtureProvider({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  static TextMixture? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TextMixtureProvider>()
        ?.data;
  }

  final TextMixture data;

  @override
  bool updateShouldNotify(TextMixtureProvider oldWidget) =>
      oldWidget.data != data;
}

class TextMixture extends Mixture<TextMixture> {
  final TextOverflow? overflow;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final int? maxLines;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final TextStyle? style;
  final TextDirection? textDirection;
  final bool? softWrap;

  final List<TextDirective> directives;
  const TextMixture({
    required this.overflow,
    this.strutStyle,
    this.textAlign,
    this.textScaleFactor,
    this.maxLines,
    this.style,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.textDirection,
    this.softWrap,
    this.directives = const [],
  });

  // empty
  const TextMixture.empty()
      : overflow = null,
        strutStyle = null,
        textAlign = null,
        textScaleFactor = null,
        maxLines = null,
        style = null,
        textWidthBasis = null,
        textHeightBehavior = null,
        textDirection = null,
        softWrap = null,
        directives = const [];

  String applyTextDirectives(String? text) {
    if (text == null) return '';

    return directives.fold(text, (text, directive) => directive(text));
  }

  @override
  TextMixture merge(TextMixture? other) {
    if (other == null) return this;

    return copyWith(
      softWrap: other.softWrap,
      overflow: other.overflow,
      strutStyle: other.strutStyle,
      textAlign: other.textAlign,
      textScaleFactor: other.textScaleFactor,
      maxLines: other.maxLines,
      style: other.style,
      textWidthBasis: other.textWidthBasis,
      textHeightBehavior: other.textHeightBehavior,
      directives: other.directives,
      textDirection: other.textDirection,
    );
  }

  @override
  TextMixture lerp(TextMixture other, double t) {
    // Define a helper method for snapping

    return TextMixture(
      overflow: snap(overflow, other.overflow, t),
      strutStyle: snap(strutStyle, other.strutStyle, t),
      textAlign: snap(textAlign, other.textAlign, t),
      textScaleFactor:
          genericNumLerp(textScaleFactor, other.textScaleFactor, t),
      maxLines: snap(maxLines, other.maxLines, t),
      style: TextStyle.lerp(style, other.style, t),
      textWidthBasis: snap(textWidthBasis, other.textWidthBasis, t),
      textHeightBehavior: snap(textHeightBehavior, other.textHeightBehavior, t),
      textDirection: snap(textDirection, other.textDirection, t),
      softWrap: snap(softWrap, other.softWrap, t),
      directives: snap(directives, other.directives, t),
    );
  }

  @override
  TextMixture copyWith({
    bool? softWrap,
    TextOverflow? overflow,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    double? textScaleFactor,
    int? maxLines,
    TextStyle? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    List<TextDirective>? directives,
    TextDirection? textDirection,
  }) {
    return TextMixture(
      overflow: overflow ?? this.overflow,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      style: style ?? this.style,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      textDirection: textDirection ?? this.textDirection,
      softWrap: softWrap ?? this.softWrap,
      directives: directives ?? this.directives,
    );
  }

  @override
  List<Object?> get props => [
        softWrap,
        overflow,
        strutStyle,
        textAlign,
        textScaleFactor,
        maxLines,
        textWidthBasis,
        textHeightBehavior,
        style,
        directives,
        textDirection,
      ];
}
