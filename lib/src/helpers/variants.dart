import 'package:mix/mix.dart';

/// System Variants
const darkVariant = Var('dark');
const screenSizeVariant = Var('screenSize');
const orientationVariant = Var('orientation');
const disabledVariant = Var('disabled');
const focusVariant = Var('focus');
const hoverVariant = Var('hover');
const pressingVariant = Var('pressing');

/// Used to check if its reserved
const systemVariants = [
  darkVariant,
  screenSizeVariant,
  orientationVariant,
  disabledVariant,
  focusVariant,
  hoverVariant,
  pressingVariant,
];

class Var<T extends Attribute> {
  const Var(this.name);

  final String name;

  Var<T> operator &(Var<T> variant) => Var<T>(name + '&' + variant.name);
  Var<T> operator >(Var<T> variant) => Var<T>(name + '>' + variant.name);
  Var<T> operator <(Var<T> variant) => Var<T>(name + '<' + variant.name);
  Var<T> operator |(Var<T> variant) => Var<T>(name + '|' + variant.name);

  VariantAttribute<T> call([
    T? p1,
    T? p2,
    T? p3,
    T? p4,
    T? p5,
    T? p6,
    T? p7,
    T? p8,
    T? p9,
    T? p10,
    T? p11,
    T? p12,
  ]) {
    final params = <T>[];
    if (p1 != null) params.add(p1);
    if (p2 != null) params.add(p2);
    if (p3 != null) params.add(p3);
    if (p4 != null) params.add(p4);
    if (p5 != null) params.add(p5);
    if (p6 != null) params.add(p6);
    if (p7 != null) params.add(p7);
    if (p8 != null) params.add(p8);
    if (p9 != null) params.add(p9);
    if (p10 != null) params.add(p10);
    if (p11 != null) params.add(p11);
    if (p12 != null) params.add(p12);

    return VariantAttribute<T>(this, params);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Var && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => 'Var(name: $name)';
}
