import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/nested_attribute.dart';
import 'package:mix/src/decorators/decorator.dart';
import 'package:mix/src/directives/directive.dart';
import 'package:mix/src/mixer/mix_context_notifier.dart';
import 'package:mix/src/variants/variant_attribute.dart';

typedef DecoratorMap = Map<DecoratorType, List<DecoratorAttribute>>;

extension DecoratorMapExtension on DecoratorMap {
  List<DecoratorAttribute> get parents {
    return _getOrDefault(DecoratorType.parent);
  }

  List<DecoratorAttribute> get children {
    return _getOrDefault(DecoratorType.child);
  }

  List<DecoratorAttribute> _getOrDefault(DecoratorType type) {
    return this[type] ?? [];
  }
}

class MixContext {
  final BuildContext context;
  final InheritedAttributes attributes;
  final Mix sourceMix;
  final Mix originalMix;

  final List<VariantAttribute> variants;
  final List<DirectiveAttribute> directives;
  final DecoratorMap decorators;

  /// Used to obtain a [InheritedAttribute] from [InheritedAttributes].
  ///
  /// Obtain with `mixContext.fromType<MyInheritedAttribute>()`.
  T? fromType<T extends InheritedAttribute>() {
    final attribute = attributes.fromType<T>();

    return attribute;
  }

  MixContext._({
    required this.context,
    required this.sourceMix,
    required this.originalMix,
    required this.directives,
    required this.variants,
    required this.decorators,
    required this.attributes,
  });

  factory MixContext.create({
    required BuildContext context,
    required Mix mix,
    bool inherit = false,
  }) {
    MixContext? inheritedMixContext;

    if (inherit) {
      /// Get ancestor context
      inheritedMixContext = MixContextNotifier.of(context);
    }

    final inheritedMix = inheritedMixContext?.sourceMix;

    Mix combinedMix;

    if (inheritedMixContext != null && mix.isEmpty) {
      return inheritedMixContext;
    } else if (inheritedMix != null) {
      combinedMix = inheritedMix.apply(mix);
    } else {
      combinedMix = mix;
    }

    return _build(
      context: context,
      mix: combinedMix,
    );
  }

  // ignore: long-method
  static MixContext _build<T extends Attribute>({
    required BuildContext context,
    required Mix<T> mix,
  }) {
    final _attributes = _expandAttributes(context, mix);

    final source = Mix.fromList(_attributes);
    final directives = <DirectiveAttribute>[];
    final variants = <VariantAttribute>[];
    final decorators = <DecoratorAttribute>[];

    final Map<Type, InheritedAttribute> inheritedAttributesMap = {};

    for (final attribute in _attributes) {
      if (attribute is InheritedAttribute) {
        var inheritedAttribute = inheritedAttributesMap[attribute.runtimeType];

        if (inheritedAttribute == null) {
          inheritedAttribute = attribute;
        } else {
          inheritedAttribute = inheritedAttribute.merge(attribute);
        }

        inheritedAttributesMap[attribute.runtimeType] = inheritedAttribute;
      }

      if (attribute is VariantAttribute) {
        variants.add(attribute);
      }

      if (attribute is DirectiveAttribute) {
        directives.add(attribute);
      }

      if (attribute is DecoratorAttribute) {
        decorators.add(attribute);
      }
    }

    return MixContext._(
      context: context,
      sourceMix: source,
      originalMix: mix,
      directives: directives,
      variants: variants,
      decorators: _buildDecoratorMap(decorators),
      attributes: InheritedAttributes(inheritedAttributesMap),
    );
  }

  /// Expands `VariantAttribute` and `NestedAttribute` based on context
  static List<T> _expandAttributes<T extends Attribute>(
    BuildContext context,
    Mix<T> mix,
  ) {
    List<T> spreaded = <T>[];

    bool hasNested = false;

    for (final attribute in mix.attributes) {
      if (attribute is VariantAttribute<T>) {
        final bool willApply = mix.variantToApply.contains(attribute.variant) ||
            attribute.shouldApply(context);
        // If it's inverse (from `not(variant)`), only apply if [willApply] is
        // false. Otherwise, apply only when [willApply]
        if (attribute.variant.inverse ? !willApply : willApply) {
          // If its selected, add it to the list
          spreaded.addAll(attribute.attributes);
          hasNested = true;
        } else {
          // If not selected, add it to the list for future use
          spreaded.add(attribute);
        }
      } else if (attribute is NestedAttribute<T>) {
        spreaded.addAll(attribute.attributes);
        hasNested = true;
      } else {
        spreaded.add(attribute);
      }
    }

    if (hasNested) {
      spreaded = _expandAttributes(
        context,
        Mix.fromList(
          spreaded,
          variantToApply: mix.variantToApply,
        ),
      );
    }

    return spreaded;
  }

  static DecoratorMap _buildDecoratorMap(List<DecoratorAttribute> decorators) {
    final DecoratorMap decoratorMap = {};
    final mergedDecorators = <Type, DecoratorAttribute>{};

    for (final attribute in decorators) {
      final existing = mergedDecorators[attribute.runtimeType];
      if (existing != null) {
        mergedDecorators[attribute.runtimeType] = existing.merge(attribute);
      } else {
        mergedDecorators[attribute.runtimeType] = attribute;
      }
    }

    mergedDecorators.forEach((_, decorator) {
      decoratorMap[decorator.type] ??= [];
      // Add to decorator map and sort to guarantee order consistency
      decoratorMap[decorator.type]!
        ..add(decorator)
        ..sort((a, b) => a.key.hashCode - b.key.hashCode);
    });

    return decoratorMap;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixContext &&
        other.context == context &&
        other.sourceMix == sourceMix &&
        other.originalMix == originalMix &&
        listEquals(other.variants, variants) &&
        listEquals(other.directives, directives) &&
        other.decorators == decorators &&
        other.attributes == attributes;
  }

  @override
  int get hashCode {
    return context.hashCode ^
        sourceMix.hashCode ^
        originalMix.hashCode ^
        variants.hashCode ^
        directives.hashCode ^
        decorators.hashCode ^
        attributes.hashCode;
  }
}
