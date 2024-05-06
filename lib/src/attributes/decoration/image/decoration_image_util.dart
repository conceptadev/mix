import 'package:flutter/widgets.dart';

import '../../../core/attribute.dart';
import '../../scalars/scalar_util.dart';
import 'decoration_image_dto.dart';

class DecorationImageUtility<T extends StyleAttribute>
    extends DtoUtility<T, DecorationImageDto, DecorationImage> {
  const DecorationImageUtility(super.builder)
      : super(valueToDto: DecorationImageDto.from);

  BoxFitUtility<T> get fit {
    return BoxFitUtility((fit) => only(fit: fit));
  }

  AlignmentUtility<T> get alignment {
    return AlignmentUtility((alignment) => only(alignment: alignment));
  }

  RectUtility<T> get centerSlice {
    return RectUtility((centerSlice) => only(centerSlice: centerSlice));
  }

  ImageRepeatUtility<T> get repeat {
    return ImageRepeatUtility((repeat) => only(repeat: repeat));
  }

  FilterQualityUtility<T> get filterQuality {
    return FilterQualityUtility(
      (filterQuality) => only(filterQuality: filterQuality),
    );
  }

  BoolUtility<T> get invertColors {
    return BoolUtility((invertColors) => only(invertColors: invertColors));
  }

  BoolUtility<T> get isAntiAlias {
    return BoolUtility((isAntiAlias) => only(isAntiAlias: isAntiAlias));
  }

  T provider(ImageProvider image) => only(image: image);

  T call({
    ImageProvider? image,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    Rect? centerSlice,
    ImageRepeat? repeat,
    FilterQuality? filterQuality,
    bool? invertColors,
    bool? isAntiAlias,
  }) {
    return only(
      image: image,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      repeat: repeat,
      filterQuality: filterQuality,
      invertColors: invertColors,
      isAntiAlias: isAntiAlias,
    );
  }

  @override
  T only({
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
}
