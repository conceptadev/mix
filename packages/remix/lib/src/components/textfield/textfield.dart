import 'dart:ui';

import 'package:flutter/cupertino.dart'
    show
        CupertinoColors,
        cupertinoDesktopTextSelectionHandleControls,
        cupertinoTextSelectionHandleControls;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../theme/remix_theme.dart';
import 'attributes/attributes.dart';

part 'textfield.g.dart';
part 'textfield_style.dart';
part 'textfield_widget.dart';

// @MixableSpec()
// base class TextFieldSpec extends Spec<TextFieldSpec>
//     with _$TextFieldSpec, Diagnosticable {
//   final TextStyle? style;
//   final TextAlign textAlign;
//   final TextAlignVertical? textAlignVertical;
//   final StrutStyle? strutStyle;
//   final TextHeightBehavior? textHeightBehavior;
//   final TextScaler? textScaler;
//   final TextWidthBasis textWidthBasis;

//   // final double cursorWidth;
//   // final double? cursorHeight;
//   // final Radius? cursorRadius;
//   // final Color? cursorColor;
//   // final Offset cursorOffset;
//   // final bool paintCursorAboveText;

//   // final BoxHeightStyle selectionHeightStyle;
//   // final BoxWidthStyle selectionWidthStyle;

//   // final EdgeInsets scrollPadding;
//   // final Clip clipBehavior;
//   // final ScrollBehavior? scrollBehavior;

//   // final Brightness keyboardAppearance;
//   // final Color? autocorrectionTextRectColor;
//   // final MouseCursor? mouseCursor;

//   /// {@macro textfield_spec_of}
//   static const of = _$TextFieldSpec.of;

//   static const from = _$TextFieldSpec.from;

//   const TextFieldSpec({
//     TextStyle? style,
//     TextAlign? textAlign,
//     TextAlignVertical? textAlignVertical,
//     StrutStyle? strutStyle,
//     TextHeightBehavior? textHeightBehavior,
//     TextScaler? textScaler,
//     TextWidthBasis? textWidthBasis,
//     // double? cursorWidth,
//     // double? cursorHeight,
//     // Radius? cursorRadius,
//     // Color? cursorColor,
//     // Offset? cursorOffset,
//     // bool? paintCursorAboveText,
//     // BoxHeightStyle? selectionHeightStyle,
//     // BoxWidthStyle? selectionWidthStyle,
//     // EdgeInsets? scrollPadding,
//     // Clip? clipBehavior,
//     // ScrollBehavior? scrollBehavior,
//     // Brightness? keyboardAppearance,
//     // Color? autocorrectionTextRectColor,
//     // MouseCursor? mouseCursor,
//     // super.animated,
//     // super.modifiers,
//   })  : style = style,
//         textAlign = textAlign ?? TextAlign.start,
//         textAlignVertical = textAlignVertical ?? TextAlignVertical.center,
//         strutStyle = strutStyle ?? const StrutStyle(),
//         textHeightBehavior = textHeightBehavior ?? const TextHeightBehavior(),
//         textScaler = textScaler ?? TextScaler.noScaling,
//         textWidthBasis = textWidthBasis ?? TextWidthBasis.parent
//   // cursorWidth = cursorWidth ?? 2.0,
//   // cursorHeight = cursorHeight,
//   // cursorRadius = cursorRadius,
//   // cursorColor = cursorColor,
//   // cursorOffset = cursorOffset ?? Offset.zero,
//   // paintCursorAboveText = paintCursorAboveText ?? false,
//   // selectionHeightStyle = selectionHeightStyle ?? BoxHeightStyle.tight,
//   // selectionWidthStyle = selectionWidthStyle ?? BoxWidthStyle.tight,
//   // scrollPadding = scrollPadding ?? const EdgeInsets.all(20.0),
//   // clipBehavior = clipBehavior ?? Clip.hardEdge,
//   // scrollBehavior = scrollBehavior,
//   // keyboardAppearance = keyboardAppearance ?? Brightness.dark,
//   // autocorrectionTextRectColor = autocorrectionTextRectColor,
//   // mouseCursor = mouseCursor
//   ;

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     _debugFillProperties(properties);
//   }
// }

// @MixableSpec()
// base class TextFieldSpec extends Spec<TextFieldSpec>
//     with _$TextFieldSpec, Diagnosticable {
//   final TextStyle style;

//   /// {@macro progress_spec_of}
//   static const of = _$TextFieldSpec.of;

//   static const from = _$TextFieldSpec.from;

//   const TextFieldSpec({
//     TextStyle? style,
//     super.animated,
//     super.modifiers,
//   }) : style = style ?? const TextStyle();

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     _debugFillProperties(properties);
//   }
// }
@MixableSpec()
class TextFieldSpec extends Spec<TextFieldSpec>
    with _$TextFieldSpec, Diagnosticable {
  final TextStyle style;
  final TextAlign textAlign;

  final StrutStyle? strutStyle;
  final TextWidthBasis textWidthBasis;

  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color cursorColor;
  final Offset cursorOffset;
  final bool paintCursorAboveText;
  final bool cursorOpacityAnimates;
  final Color backgroundCursorColor;
  final Color? selectionColor;

  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;

  final EdgeInsets scrollPadding;
  final Clip clipBehavior;

  final Brightness keyboardAppearance;
  final Color? autocorrectionTextRectColor;

  final BoxSpec container;
  final TextSpec hint;

  @MixableProperty(dto: MixableFieldDto(type: TextHeightBehaviorDto))
  final TextHeightBehavior? textHeightBehavior;

  static const of = _$TextFieldSpec.of;

  static const from = _$TextFieldSpec.from;

  const TextFieldSpec({
    TextStyle? style,
    TextAlign? textAlign,
    this.strutStyle,
    this.textHeightBehavior,
    TextWidthBasis? textWidthBasis,
    double? cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    Color? cursorColor,
    Offset? cursorOffset,
    bool? paintCursorAboveText,
    Color? backgroundCursorColor,
    this.selectionColor,
    BoxHeightStyle? selectionHeightStyle,
    BoxWidthStyle? selectionWidthStyle,
    EdgeInsets? scrollPadding,
    Clip? clipBehavior,
    Brightness? keyboardAppearance,
    this.autocorrectionTextRectColor,
    bool? cursorOpacityAnimates,
    BoxSpec? container,
    TextSpec? hint,
    super.animated,
    super.modifiers,
  })  : style = style ?? const TextStyle(),
        textAlign = textAlign ?? TextAlign.start,
        textWidthBasis = textWidthBasis ?? TextWidthBasis.parent,
        cursorWidth = cursorWidth ?? 2.0,
        cursorColor = cursorColor ?? m.Colors.black54,
        cursorOffset = cursorOffset ?? Offset.zero,
        paintCursorAboveText = paintCursorAboveText ?? false,
        cursorOpacityAnimates = cursorOpacityAnimates ?? false,
        backgroundCursorColor =
            backgroundCursorColor ?? CupertinoColors.inactiveGray,
        selectionHeightStyle = selectionHeightStyle ?? BoxHeightStyle.tight,
        selectionWidthStyle = selectionWidthStyle ?? BoxWidthStyle.tight,
        scrollPadding = scrollPadding ?? const EdgeInsets.all(20.0),
        clipBehavior = clipBehavior ?? Clip.hardEdge,
        keyboardAppearance = keyboardAppearance ?? Brightness.light,
        container = container ?? const BoxSpec(),
        hint = hint ?? const TextSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
