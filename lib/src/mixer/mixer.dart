import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.mixer.dart';
import 'package:mix/src/attributes/dynamic/variant.attributes.dart';
import 'package:mix/src/attributes/flex/flex.mixer.dart';
import 'package:mix/src/attributes/icon/icon.mixer.dart';
import 'package:mix/src/attributes/shared/shared.mixer.dart';
import 'package:mix/src/attributes/text/text.mixer.dart';

import '../../mix.dart';
import '../attributes/common/attribute.dart';
import 'mix_factory.dart';

typedef AttributeGetter<T extends Attribute> = List<Attribute>? Function(
    T attribute);

class MixContext {
  BuildContext context;
  Mix mix;

  MixContext._({
    required this.mix,
    required this.context,
  });

  BoxMixer get boxMixer => BoxMixer.fromContext(this);
  TextMixer get textMixer => TextMixer.fromContext(withAncestorContext());
  IconMixer get iconMixer => IconMixer.fromContext(withAncestorContext());
  FlexMixer get flexMixer => FlexMixer.fromContext(this);
  SharedMixer get sharedMixer => SharedMixer.fromContext(withAncestorContext());

  factory MixContext.create(BuildContext context, Mix mix) {
    final mixWithContext = applyVariants(context, mix);
    return MixContext._(context: context, mix: mixWithContext);
  }

  /// Expands `VariantAttributes` based on context
  static Mix<T> applyVariants<T extends Attribute>(
    BuildContext context,
    Mix<T> mix,
  ) {
    final attributes = <T>[];
    final variants = <T>[];

    bool hasVariants = false;

    for (final attribute in mix.attributes) {
      if (attribute is VariantAttribute<T>) {
        if (attribute.shouldApply(context)) {
          variants.addAll(attribute.attributes);
          hasVariants = true;
        }
      } else {
        attributes.add(attribute);
      }
    }

    if (hasVariants) {
      final variantMix = Mix.fromList([...attributes, ...variants]);

      return applyVariants(context, variantMix);
    } else {
      return mix;
    }
  }

  MixContext withAncestorContext() {
    final ancestorMixer = context.ancestorMixer;

    if (ancestorMixer != null) {
      return MixContext.create(context, ancestorMixer.mix.merge(mix));
    } else {
      return this;
    }
  }

  /// Gets attributes of a `TokenAttribute` based on csontext
  // Mixer _applyTokenAttributes() {
  //   return expandAttributes((Attribute attribute) {
  //     if (attribute is TokenRefAttribute) {
  //       // Get token from context and expand
  //       final mix = attribute.getToken(context);
  //       return mix.attributes;
  //     }
  //   });
  // }

  /// Applies all [WidgetAttribute]s to a [Widget]
  Widget applyWidgetDecorators(Widget widget) {
    var current = widget;
    final attributeMap = <Type, WidgetAttribute?>{};
    for (final attribute in mix.widgetAttributes) {
      var existing = attributeMap[attribute.runtimeType];
      if (existing != null) {
        attributeMap[attribute.runtimeType] = existing.merge(attribute);
      } else {
        attributeMap[attribute.runtimeType] = attribute;
      }
    }

    // Apply widget attributes
    attributeMap.forEach(
      (key, value) => current = value!.render(this, current),
    );

    return current;
  }
}
