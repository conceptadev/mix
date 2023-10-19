import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../style_attribute.dart';

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
