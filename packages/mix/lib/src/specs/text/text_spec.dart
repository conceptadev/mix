// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports,
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'text_spec.g.dart';

@MixableSpec()
final class TextSpec extends Spec<TextSpec> with _$TextSpec {
  final TextOverflow? overflow;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final TextScaler? textScaler;
  final TextStyle? style;
  final TextDirection? textDirection;
  final bool? softWrap;

  @Deprecated('Use textScaler instead')
  final double? textScaleFactor;

  @MixableProperty(
    utilities: [
      MixableUtility(
        properties: [
          (path: 'uppercase', alias: 'uppercase'),
          (path: 'lowercase', alias: 'lowercase'),
          (path: 'capitalize', alias: 'capitalize'),
          (path: 'titleCase', alias: 'titleCase'),
          (path: 'sentenceCase', alias: 'sentenceCase'),
        ],
      ),
    ],
  )
  final TextDirective? directive;

  static const of = _$TextSpec.of;

  static const from = _$TextSpec.from;

  const TextSpec({
    this.overflow,
    this.strutStyle,
    this.textAlign,
    @Deprecated('Use textScaler instead') this.textScaleFactor,
    this.textScaler,
    this.maxLines,
    this.style,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.textDirection,
    this.softWrap,
    this.directive,
    super.animated,
    super.modifiers,
  });

  Widget call(String text, {String? semanticLabel, Locale? locale}) {
    return isAnimated
        ? AnimatedTextSpecWidget(
            text,
            spec: this,
            semanticsLabel: semanticLabel,
            locale: locale,
            duration: animated!.duration,
            curve: animated!.curve,
          )
        : TextSpecWidget(
            text,
            spec: this,
            semanticsLabel: semanticLabel,
            locale: locale,
          );
  }
}
