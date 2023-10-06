import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../dtos/text_style_attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'text.attributes.dart';
import 'text_directives/text_directives.dart';

class StyledTextDescriptor {
  final bool softWrap;
  final TextOverflow overflow;

  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final Locale? locale;
  final double? textScaleFactor;
  final int? maxLines;

  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final List<TextDirective> _directives;

  const StyledTextDescriptor({
    required this.softWrap,
    required this.overflow,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.locale,
    this.textScaleFactor,
    this.maxLines,
    this.textWidthBasis,
    this.textHeightBehavior,
    List<TextDirective>? directives,
  }) : _directives = directives ?? const [];

  factory StyledTextDescriptor.fromContext(MixData mix) {
    final textAttributes = mix.attributesOfType<StyledTextAttributes>();

    var mergedTextStyleDto = const TextStyleAttribute();

    for (var style in textAttributes?.styles ?? <TextStyleAttribute>[]) {
      // Convert into a DTO for consistent merge behavior.
      final textStyleDto = TextStyleAttribute.from(style.resolve(mix));
      mergedTextStyleDto = mergedTextStyleDto.merge(textStyleDto);
    }

    return StyledTextDescriptor(
      softWrap: textAttributes?.softWrap ?? true,
      overflow: textAttributes?.overflow ?? TextOverflow.clip,
      // Need to grab colorscheme from context.
      style: mergedTextStyleDto.resolve(mix),
      strutStyle: textAttributes?.strutStyle,
      textAlign: textAttributes?.textAlign,
      locale: textAttributes?.locale,
      textScaleFactor: textAttributes?.textScaleFactor,
      maxLines: textAttributes?.maxLines,
      textWidthBasis: textAttributes?.textWidthBasis,
      textHeightBehavior: textAttributes?.textHeightBehavior,

      // Directives.
      directives: textAttributes?.directives,
    );
  }

  String applyTextDirectives(String? text) {
    if (text == null) return '';

    var modifiedText = text;
    for (final directive in _directives) {
      modifiedText = directive.modify(modifiedText);
    }

    return modifiedText;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StyledTextDescriptor &&
        other.softWrap == softWrap &&
        other.overflow == overflow &&
        other.style == style &&
        other.strutStyle == strutStyle &&
        other.textAlign == textAlign &&
        other.locale == locale &&
        other.textScaleFactor == textScaleFactor &&
        other.maxLines == maxLines &&
        other.textWidthBasis == textWidthBasis &&
        other.textHeightBehavior == textHeightBehavior &&
        listEquals(other._directives, _directives);
  }

  @override
  int get hashCode {
    return softWrap.hashCode ^
        overflow.hashCode ^
        style.hashCode ^
        strutStyle.hashCode ^
        textAlign.hashCode ^
        locale.hashCode ^
        textScaleFactor.hashCode ^
        maxLines.hashCode ^
        textWidthBasis.hashCode ^
        textHeightBehavior.hashCode ^
        _directives.hashCode;
  }
}
