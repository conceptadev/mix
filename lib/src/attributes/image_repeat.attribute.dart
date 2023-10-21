import 'package:flutter/widgets.dart';

import '../factory/mix_provider_data.dart';
import 'style_attribute.dart';

class ImageRepeatAttribute extends StyleAttribute<ImageRepeat> {
  final ImageRepeat imageRepeat;

  const ImageRepeatAttribute(this.imageRepeat);

  @override
  ImageRepeatAttribute merge(ImageRepeatAttribute? other) =>
      ImageRepeatAttribute(other?.imageRepeat ?? imageRepeat);

  @override
  ImageRepeat resolve(MixData mix) => imageRepeat;

  @override
  List<Object?> get props => [imageRepeat];
}
