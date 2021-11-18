import 'package:flutter/material.dart';

import '../../mix.dart';
import '../attributes/common/attribute.dart';
import '../attributes/directives/text/text_directive.attributes.dart';
import 'mix_factory.dart';

typedef AttributeGetter<T extends Attribute> = List<Attribute>? Function(
    T attribute);

class Mixer {
  BuildContext context;
  Mix mix;

  Mixer._({
    required this.context,
    required this.mix,
  });

  /// Expands `DynamicAttribute` based on context
  Mixer _applyDynamicAttributes() {
    final attributes = <Attribute>[];

    bool hasDynamic = false;

    for (final attribute in mix.attributes) {
      if (attribute is DynamicAttribute) {
        if (attribute.shouldApply(context)) {
          attributes.addAll(attribute.attributes);
          hasDynamic = true;
        }
      } else {
        attributes.add(attribute);
      }
    }

    if (hasDynamic) {
      final updatedMix = Mix.fromList(attributes);
      return Mixer.build(context, updatedMix);
    } else {
      return this;
    }
  }

  /// Gets attributes of a `TokenAttribute` based on context
  // Mixer _applyTokenAttributes() {
  //   return expandAttributes((Attribute attribute) {
  //     if (attribute is TokenRefAttribute) {
  //       // Get token from context and expand
  //       final mix = attribute.getToken(context);
  //       return mix.attributes;
  //     }
  //   });
  // }

  /// Applies all [TextDirectiveAttribute] to [text]
  String applyTextDirectives(String text) {
    final textDirectives =
        mix.directiveAttributes.whereType<TextDirectiveAttribute>();

    if (textDirectives.isEmpty) {
      return text;
    }

    String modifiedText = text;

    for (final attr in textDirectives) {
      modifiedText = attr.modify(modifiedText);
    }

    return modifiedText;
  }

  factory Mixer.build(BuildContext context, Mix mix) {
    final mixer = Mixer._(
      context: context,
      mix: mix,
    );
    return mixer._applyDynamicAttributes();
  }
}
