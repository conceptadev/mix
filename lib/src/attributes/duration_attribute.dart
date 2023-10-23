import 'dart:core';

import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

abstract class DurationAttribute extends StyleAttribute<Duration> {
  final Duration duration;

  const DurationAttribute(this.duration);

  @override
  DurationAttribute merge(DurationAttribute? other);

  @override
  Duration resolve(MixData mix) => duration;

  @override
  List<Object?> get props => [duration];
}
