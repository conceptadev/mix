import '../mixer/mix_factory.dart';
import 'attribute.dart';

/// Allows to pass down Mixes as attributes for use with helpers
class NestedMixAttribute<T extends Attribute> extends Attribute {
  const NestedMixAttribute(MixFactory mix) : _mix = mix;

  final MixFactory _mix;

  MixFactory get value => _mix;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NestedMixAttribute<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'NestedMixAttribute(mix: $_mix)';
}
