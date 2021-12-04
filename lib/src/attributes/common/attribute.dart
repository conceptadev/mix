import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// Base attribute

// Some classes have defaults
// Facade allows us ot set all properties as optional
// For improved merge and override of properties
abstract class Attribute {
  const Attribute();
}

/// Allows to pass down Mixes as attributes for use with helpers
class NestedAttribute<T extends Attribute> extends Attribute {
  const NestedAttribute(this.attributes);

  final List<T> attributes;
}

class VariantAttribute<T extends Attribute> extends Attribute {
  const VariantAttribute(this.variant, this.attributes, {this.checkFn});

  final Var variant;
  final List<T> attributes;
  final bool Function(BuildContext)? checkFn;

  VariantAttribute<T> operator &(VariantAttribute<T> other) {
    return VariantAttribute<T>(
      variant,
      [
        VariantAttribute<T>(
          other.variant,
          attributes + other.attributes,
          checkFn: other.checkFn,
        ) as T
      ],
      checkFn: checkFn,
    );
  }

  NestedAttribute<T> operator |(VariantAttribute<T> other) {
    final combinedAttributes = attributes + other.attributes;
    return NestedAttribute<T>([
      VariantAttribute(
        variant,
        combinedAttributes,
        checkFn: checkFn,
      ) as T,
      VariantAttribute(
        other.variant,
        combinedAttributes,
        checkFn: other.checkFn,
      ) as T
    ]);
  }

  VariantAttribute<T> operator >(VariantAttribute<T> other) {
    return this & other;
  }

  VariantAttribute<T> operator <(VariantAttribute<T> other) {
    return other > this;
  }

  bool shouldApply(BuildContext context) {
    return checkFn?.call(context) ?? false;
  }

  @override
  String toString() =>
      'VariantAttribute(variant: $variant, attributes: $attributes)';
}

enum WidgetDecoratorType {
  parent,
  child,
  separator,
}

abstract class WidgetDecorator<T extends WidgetDecorator<T>> extends Attribute {
  const WidgetDecorator();
  WidgetDecorator<T> merge(T other);
  WidgetDecoratorType get type;
  Widget render(MixContext mixContext, Widget child);
}

abstract class ParentWidgetDecorator<T extends WidgetDecorator<T>>
    extends WidgetDecorator<T> {
  const ParentWidgetDecorator();
  @override
  WidgetDecoratorType get type => WidgetDecoratorType.parent;
}

abstract class DirectiveAttribute<T> extends Attribute {
  const DirectiveAttribute();
  T modify(T value);
}
