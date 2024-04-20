import 'package:flutter/widgets.dart';

import '../../../core/attribute.dart';
import '../../scalars/scalar_util.dart';
import 'decoration_image_dto.dart';

class DecorationImageUtility<T extends StyleAttribute>
    extends MixUtility<T, DecorationImageDto> {
  const DecorationImageUtility(super.builder);

  T _only({
    ImageProvider? image,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    Rect? centerSlice,
    ImageRepeat? repeat,
    FilterQuality? filterQuality,
    bool? invertColors,
    bool? isAntiAlias,
  }) {
    return builder(
      DecorationImageDto(
        image: image,
        fit: fit,
        alignment: alignment,
        centerSlice: centerSlice,
        repeat: repeat,
        filterQuality: filterQuality,
        invertColors: invertColors,
        isAntiAlias: isAntiAlias,
      ),
    );
  }

  BoxFitUtility<T> get fit {
    return BoxFitUtility((fit) => _only(fit: fit));
  }

  AlignmentUtility<T> get alignment {
    return AlignmentUtility((alignment) => _only(alignment: alignment));
  }

  RectUtility<T> get centerSlice {
    return RectUtility((centerSlice) => _only(centerSlice: centerSlice));
  }

  ImageRepeatUtility<T> get repeat {
    return ImageRepeatUtility((repeat) => _only(repeat: repeat));
  }

  FilterQualityUtility<T> get filterQuality {
    return FilterQualityUtility(
      (filterQuality) => _only(filterQuality: filterQuality),
    );
  }

  BoolUtility<T> get invertColors {
    return BoolUtility((invertColors) => _only(invertColors: invertColors));
  }

  BoolUtility<T> get isAntiAlias {
    return BoolUtility((isAntiAlias) => _only(isAntiAlias: isAntiAlias));
  }

  ImageProviderUtility<T> get image {
    return ImageProviderUtility((image) => _only(image: image));
  }

  T call(ImageProvider image) => builder(DecorationImageDto(image: image));
}

class ImageProviderUtility<T extends StyleAttribute>
    extends MixUtility<T, ImageProvider> {
  const ImageProviderUtility(super.builder);

  T call(ImageProvider image) => builder(image);
}
