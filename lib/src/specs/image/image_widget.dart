import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import '../../utils/helper_util.dart';
import 'image_spec.dart';

class StyledImage extends StyledWidget {
  const StyledImage({
    super.key,
    super.style,
    super.inherit = true,
    this.frameBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    required this.image,
  });

  final ImageProvider<Object> image;
  final ImageFrameBuilder? frameBuilder;
  final ImageLoadingBuilder? loadingBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      return MixedImage(
        image: image,
        frameBuilder: frameBuilder,
        loadingBuilder: loadingBuilder,
        errorBuilder: errorBuilder,
        semanticLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
      );
    });
  }
}

class MixedImage extends StatelessWidget {
  const MixedImage({
    super.key,
    this.decoratorOrder = const [],
    this.mix,
    required this.image,
    this.frameBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final MixData? mix;
  final ImageProvider<Object> image;
  final ImageFrameBuilder? frameBuilder;
  final ImageLoadingBuilder? loadingBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final List<Type> decoratorOrder;

  @override
  Widget build(BuildContext context) {
    final mix = this.mix ?? MixProvider.of(context);
    final spec = ImageSpec.of(mix);

    final current = Image(
      image: image,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: spec.width,
      height: spec.height,
      color: spec.color,
      colorBlendMode: spec.colorBlendMode ?? BlendMode.clear,
      fit: spec.fit,
      alignment: spec.alignment ?? Alignment.center,
      repeat: spec.repeat ?? ImageRepeat.noRepeat,
      centerSlice: spec.centerSlice,
      filterQuality: spec.filterQuality ?? FilterQuality.low,
    );

    return shouldApplyDecorators(
      mix: mix,
      orderOfDecorators: decoratorOrder,
      child: current,
    );
  }
}
