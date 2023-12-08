import 'attribute.dart';

typedef Modifier<T> = T Function(T value);

/// The `Directive` abstract class provides the ability to modify or apply
/// different behaviors to widgets and attributes.
abstract class Directive extends Attribute {
  const Directive();
}

abstract class TextDirective extends Directive {
  const TextDirective();

  @override
  Object get type => TextDirective;
}

class ModifyTextDataDirective extends TextDirective
    with Mergeable<ModifyTextDataDirective> {
  final List<Modifier<String>> modifiers;
  const ModifyTextDataDirective(this.modifiers);

  String apply(String value) {
    return modifiers.fold(
      value,
      (previousValue, modifier) => modifier(previousValue),
    );
  }

  @override
  ModifyTextDataDirective merge(ModifyTextDataDirective other) {
    return ModifyTextDataDirective([...modifiers, ...other.modifiers]);
  }

  @override
  get props => [modifiers];
}

// mixin ModifierMixin<T> on Directive {
//   Modifier<T> get _modifier;
//   T modify(T value) => _modifier(value);
// }

// abstract class ModifyDirective<T> extends Directive {
//   final Modifier<T> _modifier;
//   const ModifyDirective(this._modifier);

//   // An abstract method modify that takes a covariant parameter of type T
//   // This method is used to modify the value of type T
//   // The implementation of this method will be provided by the subclasses of Directive
//   T apply(T value) => _modifier(value);

//   @override
//   get props => [_modifier];
// }
