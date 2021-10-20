import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/helpers/widget_extensions.dart';

import '../../base_attribute.dart';


class BoxAttributes extends Attribute<bool> {
  final String? data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  const TextAttribute({
    this.data,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
  });

  @override
  bool get value => true;

  @override
  apply(Container widget) {
 
    return widget.copyWith(
       alignment:widget. alignment,
   padding:widget. padding,
   color:widget. color,
   decoration:widget. decoration,
   foregroundDecoration:widget. foregroundDecoration,
   constraints:widget. constraints,
   margin:widget. margin,
   transform:widget. transform,
   transformAlignment:widget. transformAlignment,
    clipBehavior:widget.clipBehavior,
   width:widget.constraints,
   height:widget.height,
    );
  }
}
