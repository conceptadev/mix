import 'dart:core';

import '../factory/mix_provider_data.dart';
import 'style_attribute.dart';

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
