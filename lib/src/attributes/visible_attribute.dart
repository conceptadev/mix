import '../core/attribute.dart';

class VisibleAttribute extends ScalarAttribute<bool> {
  const VisibleAttribute(super.value);

  static VisibleAttribute? maybe(bool? value) =>
      value == null ? null : VisibleAttribute(value);

  @override
  VisibleAttribute merge(VisibleAttribute? other) => other ?? this;
}
