import 'package:flutter/widgets.dart';

import 'element.dart';
import 'factory/mix_data.dart';

typedef Modifier<T> = T Function(T value);

@immutable
class TextDirectiveMix extends Mixable<TextDirective> {
  final List<Modifier<String>> _modifiers;
  const TextDirectiveMix(this._modifiers);

  @visibleForTesting
  int get length => _modifiers.length;
  @override
  TextDirective resolve(MixData mix) {
    return TextDirective((String content) {
      return _modifiers.fold(
        content,
        (previousValue, modifier) => modifier(previousValue),
      );
    });
  }

  @override
  TextDirectiveMix merge(TextDirectiveMix? other) {
    return TextDirectiveMix([..._modifiers, ...?other?._modifiers]);
  }

  @override
  get props => [_modifiers];
}

class TextDirective {
  final Modifier<String> _modifier;
  const TextDirective(this._modifier);

  String apply(String content) => _modifier(content);
}
