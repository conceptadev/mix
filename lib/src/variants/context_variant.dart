import 'package:flutter/material.dart';

import '../attributes/nested_style/nested_style_attribute.dart';
import '../attributes/variant_attribute.dart';
import '../core/attribute.dart';
import '../factory/style_mix.dart';
import 'variant.dart';

@immutable
abstract class ContextVariant extends IVariant {
  const ContextVariant();

  VariantAttribute call([
    Attribute? p1,
    Attribute? p2,
    Attribute? p3,
    Attribute? p4,
    Attribute? p5,
    Attribute? p6,
    Attribute? p7,
    Attribute? p8,
    Attribute? p9,
    Attribute? p10,
    Attribute? p11,
    Attribute? p12,
    Attribute? p13,
    Attribute? p14,
    Attribute? p15,
    Attribute? p16,
    Attribute? p17,
    Attribute? p18,
    Attribute? p19,
    Attribute? p20,
  ]) {
    final params = [
      p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, //
      p11, p12, p13, p14, p15, p16, p17, p18, p19, p20,
    ].whereType<Attribute>();

    return VariantAttribute(this, Style.create(params));
  }

  @override
  bool when(BuildContext context);

  @override
  VariantPriority get priority => VariantPriority.normal;

  @override
  Object get mergeKey => '$runtimeType';

  @override
  get props => [priority];
}

@immutable
abstract class WidgetContextVariant<Value> extends ContextVariant {
  @override
  final priority = VariantPriority.highest;

  const WidgetContextVariant();

  ContextVariantBuilder event(Style Function(Value) fn) {
    Style contextGetter(BuildContext context) {
      return fn(builder(context));
    }

    return ContextVariantBuilder(contextGetter, this);
  }

  @protected
  Value builder(BuildContext context);
}

@immutable
abstract class MediaQueryContextVariant extends ContextVariant {
  @override
  final priority = VariantPriority.normal;

  const MediaQueryContextVariant();
}

@immutable
class ContextVariantBuilder extends Attribute {
  final ContextVariant variant;
  final Style Function(BuildContext context) fn;

  const ContextVariantBuilder(this.fn, this.variant);

  Style Function(BuildContext context) mergeFn(
    Style Function(BuildContext context) other,
  ) {
    return (BuildContext context) => fn(context).merge(other(context));
  }

  ContextVariantBuilder merge(ContextVariantBuilder? other) {
    if (other == null) return this;
    if (other.variant != variant) {
      throw ArgumentError.value(other, 'variant is not the same');
    }

    return ContextVariantBuilder(mergeFn(other.fn), variant);
  }

  @override
  Object get mergeKey => '$runtimeType.${variant.mergeKey}';

  @override
  get props => [variant];
  Attribute build(BuildContext context) => NestedStyleAttribute(fn(context));
}
