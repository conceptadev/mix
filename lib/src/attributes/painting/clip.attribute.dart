import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

class ClipAttribute extends ResolvableAttribute<Clip> {
  final Clip? clip;

  const ClipAttribute({this.clip});

  @override
  ClipAttribute merge(ClipAttribute? other) {
    if (other == null) return this;

    return ClipAttribute(
      // If 'other' provides a non-null Clip, prefer it. Else, use this object's clip.
      clip: other.clip ?? clip,
    );
  }

  @override
  Clip resolve(MixData mix) {
    // If 'clip' is null, we'll default to antiAlias.
    // Replace "Clip.antiAlias" with your desired default, if it is different.
    return clip ?? Clip.antiAlias;
  }

  @override
  List<Object?> get props => [clip];
}
