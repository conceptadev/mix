import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.mixer.dart';
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
    final mixWithContext = applyDynamicAttributes(context, mix);
    return MixContext._(context: context, mix: mixWithContext);
  }

  /// Expands `DynamicAttribute` based on context
  static Mix<T> applyDynamicAttributes<T extends Attribute>(
    BuildContext context,
    Mix<T> mix,
  ) {
    final attributes = <T>[];
    final dynamicAttributes = <T>[];

    bool hasDynamic = false;

    for (final attribute in mix.attributes) {
      if (attribute is DynamicAttribute<T>) {
        if (attribute.shouldApply(context)) {
          dynamicAttributes.addAll(attribute.attributes);
          hasDynamic = true;
        }
      } else {
        attributes.add(attribute);
      }
    }

    if (hasDynamic) {
      final dynamicMix = Mix.fromList([...attributes, ...dynamicAttributes]);
      return applyDynamicAttributes(context, dynamicMix);
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
  Widget applyWidgetAttributes(Widget widget) {
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
