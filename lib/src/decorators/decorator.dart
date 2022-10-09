import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

enum DecoratorType {
  parent,
  child,
  separator,
}

abstract class DecoratorAttribute<T> extends Attribute {
  const DecoratorAttribute(this.key);
  final Key key;
  DecoratorAttribute<T> merge(T other);

  DecoratorType get type;
  Widget render(MixContext mixContext, Widget child);
}

abstract class ParentDecorator<T> extends DecoratorAttribute<T> {
  const ParentDecorator(Key key) : super(key);
  @override
  DecoratorType get type => DecoratorType.parent;
}

abstract class ChildDecorator<T> extends DecoratorAttribute<T> {
  const ChildDecorator(Key key) : super(key);
  @override
  DecoratorType get type => DecoratorType.child;
}
