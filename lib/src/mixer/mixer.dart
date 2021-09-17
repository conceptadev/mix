import 'package:flutter/material.dart';
import 'package:mix/src/attributes/primitives/gestures/disabled.dart';
import 'package:mix/src/attributes/primitives/gestures/focused.dart';
import 'package:mix/src/attributes/primitives/gestures/hovering.dart';
import 'package:mix/src/attributes/primitives/gestures/pressing.dart';
import 'package:mix/src/attributes/primitives/icon/icon_color.dart';
import 'package:mix/src/attributes/primitives/layout/aspect_ratio.dart';
import 'package:mix/src/attributes/primitives/painting/background_color.dart';
import 'package:mix/src/attributes/primitives/text/text_color.dart';
import 'package:mix/src/attributes/primitives/text/text_style.dart';
import 'package:mix/src/utilities/gap.dart';
import 'package:mix/src/utilities/modifiers/text_modifier.dart';

import '../../mix.dart';
import '../attributes/base/size.dart';
import '../attributes/base/space.dart';
import '../attributes/base_attribute.dart';
import '../attributes/primitives/icon/icon_size.dart';
import '../attributes/primitives/layout/constraints.dart';
import '../attributes/primitives/layout/flex.dart';
import '../attributes/primitives/painting/alignment.dart';
import '../attributes/primitives/painting/axis.dart';
import '../attributes/primitives/painting/border.dart';
import '../attributes/primitives/painting/border_radius.dart';
import '../attributes/primitives/painting/box_decoration.dart';
import '../attributes/primitives/painting/box_fit.dart';
import '../attributes/primitives/painting/opacity.dart';
import '../attributes/primitives/painting/rotate.dart';
import '../attributes/primitives/painting/shadow.dart';
import '../attributes/primitives/rendering/flex/cross_axis_alignment.dart';
import '../attributes/primitives/rendering/flex/flex_fit.dart';
import '../attributes/primitives/rendering/flex/main_axis_alignment.dart';
import '../attributes/primitives/rendering/flex/main_axis_size.dart';
import '../attributes/primitives/text/debug_label.dart';
import '../attributes/primitives/text/font_family.dart';
import '../attributes/primitives/text/font_size.dart';
import '../attributes/primitives/text/font_style.dart';
import '../attributes/primitives/text/font_weight.dart';
import '../attributes/primitives/text/letter_spacing.dart';
import '../attributes/primitives/text/locale.dart';
import '../attributes/primitives/text/max_lines.dart';
import '../attributes/primitives/text/soft_wrap.dart';
import '../attributes/primitives/text/text_align.dart';
import '../attributes/primitives/text/text_baseline.dart';
import '../attributes/primitives/text/text_direction.dart';
import '../attributes/primitives/text/text_height.dart';
import '../attributes/primitives/text/text_overflow.dart';
import '../attributes/primitives/text/text_scale_factor.dart';
import '../attributes/primitives/text/text_width_basis.dart';
import '../attributes/primitives/text/word_spacing.dart';
import '../utilities/dynamic/hidden.dart';

/// Mixer
class Mixer {
  Mixer._(this.attributes);
  final List<Attribute> attributes;

  MarginAttribute? margin;
  PaddingAttribute? padding;
  AlignmentAttribute? alignment;
  ConstraintsAttribute? constraints;
  HiddenAttribute? hidden;
  BackgroundColorAttribute? backgroundColor;
  BorderAttribute? border;
  BorderRadiusAttribute? borderRadius;
  BoxShadowAttribute? boxShadow;
  BoxDecorationAttribute? decoration;
  HeightAttribute? height;
  MaxHeightAttribute? maxHeight;
  MinHeightAttribute? minHeight;
  WidthAttribute? width;
  MaxWidthAttribute? maxWidth;
  MinWidthAttribute? minWidth;
  AxisAttribute? axis;
  MainAxisSizeAttribute? mainAxisSize;
  CrossAxisAlignmentAttribute? crossAxisAlignment;
  MainAxisAlignmentAttribute? mainAxisAlignment;
  GapSizeAttribute? gap;
  RotateAttribute? rotate;
  OpacityAttribute? opacity;
  FlexAttribute? flex;
  FlexFitAttribute? flexFit;
  BoxFitAttribute? boxFit;
  AspectRatioAttribute? aspectRatio;
  TextColorAttribute? textColor;
  TextAlignAttribute? textAlign;
  FontSizeAttribute? fontSize;
  WordSpacingAttribute? wordSpacing;
  LetterSpacingAttribute? letterSpacing;
  TextBaselineAttribute? textBaseline;
  MaxLinesAttribute? maxLines;
  FontFamilyAttribute? fontFamily;
  FontWeightAttribute? fontWeight;
  TextDirectionAttribute? textDirection;
  FontStyleAttribute? fontStyle;
  LocaleAttribute? locale;
  TextOverflowAttribute? textOverflow;
  SoftWrapAttribute? softWrap;
  TextScaleFactorAttribute? textScaleFactor;
  TextWidthBasisAttribute? textWidthBasis;
  TextStyleAttribute? textStyle;
  DebugLabelAttribute? debugLabel;
  TextHeightAttribute? textHeight;
  IconColorAttribute? iconColor;
  IconSizeAttribute? iconSize;
  List<DynamicAttribute>? dynamicAttributes;
  List<TextDirectiveAttribute>? textDirectiveAttributes;
  DisabledAttribute? disabled;
  FocusedAttribute? focused;
  HoveringAttribute? hovering;
  PressingAttribute? pressing;

  /// Applies `DynamicAttribute` based on context
  Mixer applyDynamicAttributes(BuildContext context) {
    final dynamicList = dynamicAttributes ?? [];

    if (dynamicList.isEmpty) {
      return this;
    }

    final attributesToApply = <Attribute>[];

    for (final attr in dynamicList) {
      if (attr.shouldApply(context)) {
        attributesToApply.add(attr.value);
      }
    }

    return Mixer.fromList([...attributes, ...attributesToApply]);
  }

  /// Applies all [TextModifierAttributes] to [text]
  String applyTextModifiers(String text) {
    final modifierList = textDirectiveAttributes ?? [];

    if (modifierList.isEmpty) {
      return text;
    }

    String modifiedText = text;

    for (final attr in modifierList) {
      modifiedText = attr.modify(modifiedText);
    }

    return modifiedText;
  }

  factory Mixer.build(BuildContext context, Mix mix) {
    final mixer = Mixer.fromList(mix.params);
    return mixer.applyDynamicAttributes(context);
  }

  factory Mixer.fromList(List<Attribute> attributes) {
    final mixer = Mixer._(attributes);
    // Set default text style
    mixer.textStyle = const TextStyleAttribute(TextStyle());
    for (final attribute in attributes) {
      if (attribute is DynamicAttribute) {
        mixer.dynamicAttributes ??= [];
        mixer.dynamicAttributes!.add(attribute);
      }

      if (attribute is TextDirectiveAttribute) {
        mixer.textDirectiveAttributes ??= [];
        mixer.textDirectiveAttributes!.add(attribute);
      }

      if (attribute is MarginAttribute) {
        mixer.margin = mergeSpaceAttribute(mixer.margin, attribute);
      }

      if (attribute is PaddingAttribute) {
        mixer.padding = mergeSpaceAttribute(mixer.padding, attribute);
      }

      if (attribute is AlignmentAttribute) {
        mixer.alignment = attribute;
      }

      if (attribute is RotateAttribute) {
        mixer.rotate = attribute;
      }

      if (attribute is AxisAttribute) {
        mixer.axis = attribute;
      }

      if (attribute is IconColorAttribute) {
        mixer.iconColor = attribute;
      }

      if (attribute is IconSizeAttribute) {
        mixer.iconSize = attribute;
      }

      if (attribute is TextColorAttribute) {
        mixer.textColor = attribute;
      }

      if (attribute is TextStyleAttribute) {
        mixer.textStyle = attribute;
      }

      if (attribute is TextAlignAttribute) {
        mixer.textAlign = attribute;
      }

      if (attribute is FontSizeAttribute) {
        mixer.fontSize = attribute;
      }

      if (attribute is WordSpacingAttribute) {
        mixer.wordSpacing = attribute;
      }

      if (attribute is LetterSpacingAttribute) {
        mixer.letterSpacing = attribute;
      }

      if (attribute is TextBaselineAttribute) {
        mixer.textBaseline = attribute;
      }

      if (attribute is MaxLinesAttribute) {
        mixer.maxLines = attribute;
      }

      if (attribute is FontFamilyAttribute) {
        mixer.fontFamily = attribute;
      }

      if (attribute is FontWeightAttribute) {
        mixer.fontWeight = attribute;
      }
      if (attribute is TextDirectionAttribute) {
        mixer.textDirection = attribute;
      }

      if (attribute is FontStyleAttribute) {
        mixer.fontStyle = attribute;
      }

      if (attribute is LocaleAttribute) {
        mixer.locale = attribute;
      }

      if (attribute is TextOverflowAttribute) {
        mixer.textOverflow = attribute;
      }

      if (attribute is SoftWrapAttribute) {
        mixer.softWrap = attribute;
      }

      if (attribute is TextScaleFactorAttribute) {
        mixer.textScaleFactor = attribute;
      }

      if (attribute is TextWidthBasisAttribute) {
        mixer.textWidthBasis = attribute;
      }

      if (attribute is DebugLabelAttribute) {
        mixer.debugLabel = attribute;
      }

      if (attribute is TextHeightAttribute) {
        mixer.textHeight = attribute;
      }

      if (attribute is AspectRatioAttribute) {
        mixer.aspectRatio = attribute;
      }

      if (attribute is MainAxisSizeAttribute) {
        mixer.mainAxisSize = attribute;
      }

      if (attribute is MainAxisAlignmentAttribute) {
        mixer.mainAxisAlignment = attribute;
      }

      if (attribute is CrossAxisAlignmentAttribute) {
        mixer.crossAxisAlignment = attribute;
      }

      if (attribute is BackgroundColorAttribute) {
        mixer.backgroundColor = attribute;
      }

      if (attribute is GapSizeAttribute) {
        mixer.gap = attribute;
      }

      if (attribute is HeightAttribute) {
        mixer.height = attribute;
      }

      if (attribute is MaxHeightAttribute) {
        mixer.maxHeight = attribute;
      }

      if (attribute is MinHeightAttribute) {
        mixer.minHeight = attribute;
      }

      if (attribute is WidthAttribute) {
        mixer.width = attribute;
      }

      if (attribute is MaxWidthAttribute) {
        mixer.maxWidth = attribute;
      }

      if (attribute is MinWidthAttribute) {
        mixer.minWidth = attribute;
      }

      if (attribute is HiddenAttribute) {
        mixer.hidden = attribute;
      }

      if (attribute is OpacityAttribute) {
        mixer.opacity = attribute;
      }

      if (attribute is BoxFitAttribute) {
        mixer.boxFit = attribute;
      }

      if (attribute is BorderAttribute) {
        mixer.border ??= attribute;
        mixer.border = mixer.border!.copyWith(attribute);
      }

      if (attribute is BorderRadiusAttribute) {
        mixer.borderRadius ??= attribute;
        mixer.borderRadius = mixer.borderRadius!.copyWith(attribute);
      }

      if (attribute is BoxShadowAttribute) {
        mixer.boxShadow ??= BoxShadowAttribute.none;
        mixer.boxShadow = mixer.boxShadow!.copyWith(attribute);
      }

      if (attribute is FlexAttribute) {
        mixer.flex = attribute;
      }

      if (attribute is FlexFitAttribute) {
        mixer.flexFit = attribute;
      }

      if (attribute is DisabledAttribute) {
        mixer.disabled = attribute;
      }

      if (attribute is FocusedAttribute) {
        mixer.focused = attribute;
      }

      if (attribute is HoveringAttribute) {
        mixer.hovering = attribute;
      }

      if (attribute is PressingAttribute) {
        mixer.pressing = attribute;
      }
    }

    if (mixer.height != null ||
        mixer.maxHeight != null ||
        mixer.minHeight != null ||
        mixer.width != null ||
        mixer.maxWidth != null ||
        mixer.minWidth != null) {
      mixer.constraints = ConstraintsAttribute.fromAttributes(
        height: mixer.height,
        maxHeight: mixer.maxHeight,
        minHeight: mixer.minHeight,
        width: mixer.width,
        maxWidth: mixer.maxWidth,
        minWidth: mixer.minWidth,
      );
    }

    // Build constraints

    // This handles in case there is a color attribute
    // but not other decoration
    // if (mixer.border != null ||
    //     mixer.borderRadius != null ||
    //     mixer.boxShadow != null) {
    //   mixer.decoration = BoxDecorationAttribute(
    //     BoxDecoration(
    //       border: mixer.border?.value,
    //       borderRadius: mixer.borderRadius?.value,
    //       color: mixer.backgroundColor?.value,
    //       boxShadow: mixer.boxShadow != null ? [mixer.boxShadow!.value] : null,
    //     ),
    //   );

    //   /// Remove color if there is decoration
    //   mixer.backgroundColor = null;
    // }

    return mixer;
  }
}
