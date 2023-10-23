import 'package:flutter/widgets.dart';

import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

class BoxFitAttribute extends StyleAttribute<BoxFit> {
  final BoxFit fit;

  const BoxFitAttribute(this.fit);

  @override
  BoxFitAttribute merge(BoxFitAttribute? other) =>
      BoxFitAttribute(other?.fit ?? fit);

  @override
  BoxFit resolve(MixData mix) => fit;

  @override
  List<Object?> get props => [fit];
}
