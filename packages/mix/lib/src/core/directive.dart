import 'package:flutter/material.dart';

import 'dto.dart';
import 'models/mix_data.dart';

typedef TextDirective = String Function(String value);

@immutable
class TextDirectiveDto extends Dto<TextDirective> {
  final List<TextDirective> _modifiers;
  const TextDirectiveDto(this._modifiers);

  @visibleForTesting
  int get length => _modifiers.length;

  @override
  TextDirective resolve(MixData mix) {
    return (String content) {
      return _modifiers.fold(
        content,
        (previousValue, modifier) => modifier(previousValue),
      );
    };
  }

  @override
  TextDirectiveDto merge(TextDirectiveDto? other) {
    return TextDirectiveDto([..._modifiers, ...?other?._modifiers]);
  }

  @override
  get props => [_modifiers];
}
