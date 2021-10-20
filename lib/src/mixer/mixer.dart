import 'package:flutter/material.dart';
import 'package:mix/src/attributes/layout/gap.dart';
import 'package:mix/src/attributes/primitives/box/box_attributes.dart';
import 'package:mix/src/attributes/primitives/gestures/disabled.dart';
import 'package:mix/src/attributes/primitives/gestures/focused.dart';
import 'package:mix/src/attributes/primitives/gestures/hovering.dart';
import 'package:mix/src/attributes/primitives/gestures/pressing.dart';
import 'package:mix/src/attributes/primitives/layout/aspect_ratio.dart';
import 'package:mix/src/attributes/primitives/painting/background_color.dart';
import 'package:mix/src/attributes/primitives/text/text_attributes.dart';
import 'package:mix/src/directives/text_directive.dart';

import '../../mix.dart';
import '../attributes/base/size.dart';
import '../attributes/base/space.dart';
import '../attributes/base_attribute.dart';
import '../attributes/dynamic/hidden.dart';
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

/// Mixer
class Mixer {
  Mixer._(this.attributes);
  final List<Attribute> attributes;

  BoxAttribute? boxAttribute;
  List<DynamicAttribute>? dynamicAttributes;
  List<TextDirectiveAttribute>? textDirectiveAttributes;
  TextAttribute? textAttribute;

  MainAxisSizeAttribute? mainAxisSize;
  CrossAxisAlignmentAttribute? crossAxisAlignment;
  MainAxisAlignmentAttribute? mainAxisAlignment;
  FlexAttribute? flex;
  GapSizeAttribute? gap;

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

    return Mixer.fromList([
      ...attributes,
      ...attributesToApply,
    ]);
  }

  Mixer applyPressableAttributes(BuildContext context) {
    final pressable = PressableNotifier.of(context);

    if (pressable == null || pressable.isNone) {
      return this;
    }

    final pressableAttributesToApply = <Attribute>[];

    if (pressable.disabled && disabled != null) {
      pressableAttributesToApply.addAll(disabled!.mix.params);
    } else if (pressable.pressing && pressing != null) {
      pressableAttributesToApply.addAll(pressing!.mix.params);
    } else if (pressable.hovering && hovering != null) {
      pressableAttributesToApply.addAll(hovering!.mix.params);
    } else if (pressable.focused && focused != null) {
      pressableAttributesToApply.addAll(focused!.mix.params);
    }

    return Mixer.fromList([
      ...attributes,
      ...pressableAttributesToApply,
    ]);
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
    return mixer
        .applyDynamicAttributes(context)
        .applyPressableAttributes(context);
  }

  factory Mixer.fromList(List<Attribute> attributes) {
    final mixer = Mixer._(attributes);

    for (final attribute in attributes) {
      if (attribute is DynamicAttribute) {
        mixer.dynamicAttributes ??= [];
        mixer.dynamicAttributes!.add(attribute);
      }

      if (attribute is TextDirectiveAttribute) {
        mixer.textDirectiveAttributes ??= [];
        mixer.textDirectiveAttributes!.add(attribute);
      }

      if (attribute is TextAttribute) {
        final textAttribute = mixer.textAttribute;
        if (textAttribute != null) {
          mixer.textAttribute = attribute;
        } else {
          mixer.textAttribute = textAttribute!.merge(attribute);
        }
      }

      if (attribute is BoxAttribute) {
        final boxAttribute = mixer.boxAttribute;
        if (boxAttribute != null) {
          mixer.boxAttribute = attribute;
        } else {
          mixer.boxAttribute = boxAttribute!.merge(attribute);
        }
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
    if (mixer.border != null ||
        mixer.borderRadius != null ||
        mixer.boxShadow != null) {
      mixer.decoration = BoxDecorationAttribute(
        BoxDecoration(
          border: mixer.border?.value,
          borderRadius: mixer.borderRadius?.value,
          color: mixer.backgroundColor?.value,
          boxShadow: mixer.boxShadow != null ? [mixer.boxShadow!.value] : null,
        ),
      );

      if ((mixer.backgroundColor?.hasAnimation ?? false) ||
          (mixer.border?.hasAnimation ?? false) ||
          (mixer.borderRadius?.hasAnimation ?? false) ||
          (mixer.boxShadow?.hasAnimation ?? false)) {
        mixer.decoration!.animated();
      }

      /// Remove color if there is decoration
      mixer.backgroundColor = null;
    }

    return mixer;
  }
}
