import 'package:flutter/widgets.dart';

import 'dto.dart';
import 'factory/mix_data.dart';

typedef Modifier<T> = T Function(T value);

@immutable
class TextDirectiveDto extends Dto<TextDirective> {
  final List<Modifier<String>> _modifiers;
  const TextDirectiveDto(this._modifiers);

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
  TextDirectiveDto merge(TextDirectiveDto? other) {
    return TextDirectiveDto([..._modifiers, ...?other?._modifiers]);
  }

  @override
  TextDirective get defaultValue => TextDirective((String content) => content);

  @override
  get props => [_modifiers];
}

class TextDirective {
  final Modifier<String> _modifier;
  const TextDirective(this._modifier);

  String apply(String content) => _modifier(content);
}
