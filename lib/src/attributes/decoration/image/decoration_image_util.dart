import 'package:flutter/widgets.dart';

import '../../../core/attribute.dart';
import '../../scalars/scalar_util.dart';
import 'decoration_image_dto.dart';

class DecorationImageUtility<T extends StyleAttribute>
    extends MixUtility<T, DecorationImageDto> {
  DecorationImageUtility(super.builder);

  T call(
    ImageProvider image,
  ) =>
      builder(
        DecorationImageDto(
          image: image,
        ),
      );

  BoxFitUtility<T> get fit {
    return BoxFitUtility((fit) => _only(fit: fit));
  }

  T _only({
    ImageProvider? image,
    BoxFit? fit,
  }) {
    return builder(
      DecorationImageDto(
        image: image,
        fit: fit,
      ),
    );
  }
}
