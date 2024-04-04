import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../helpers/constants.dart';
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
    super.orderOfDecorators = const [],
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
      final spec = ImageSpec.of(mix);

      return mix.isAnimated
          ? AnimatedMixedImage(
              spec: spec,
              image: image,
              frameBuilder: frameBuilder,
              loadingBuilder: loadingBuilder,
              errorBuilder: errorBuilder,
              semanticLabel: semanticLabel,
              excludeFromSemantics: excludeFromSemantics,
              duration: mix.animation!.duration,
              curve: mix.animation!.curve,
            )
          : MixedImage(
              spec: spec,
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
    this.spec,
    required this.image,
    this.frameBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final ImageSpec? spec;
  final ImageProvider<Object> image;
  final ImageFrameBuilder? frameBuilder;
  final ImageLoadingBuilder? loadingBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final List<Type> decoratorOrder;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: spec?.width,
      height: spec?.height,
      color: spec?.color,
      colorBlendMode: spec?.colorBlendMode ?? BlendMode.clear,
      fit: spec?.fit,
      alignment: spec?.alignment ?? Alignment.center,
      repeat: spec?.repeat ?? ImageRepeat.noRepeat,
      centerSlice: spec?.centerSlice,
      filterQuality: spec?.filterQuality ?? FilterQuality.low,
    );
  }
}

class AnimatedMixedImage extends ImplicitlyAnimatedWidget {
  const AnimatedMixedImage({
    this.spec,
    required this.image,
    this.frameBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    super.key,
    super.duration = kDefaultAnimationDuration,
    super.curve = Curves.linear,
    super.onEnd,
  });

  final ImageSpec? spec;
  final ImageProvider<Object> image;
  final ImageFrameBuilder? frameBuilder;
  final ImageLoadingBuilder? loadingBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  AnimatedWidgetBaseState<AnimatedMixedImage> createState() =>
      _AnimatedMixedImageState();
}

class _AnimatedMixedImageState
    extends AnimatedWidgetBaseState<AnimatedMixedImage> {
  ImageSpecTween? _spec;

  // forEachTween
  @override
  // ignore: avoid-dynamic
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _spec = visitor(
      _spec,
      widget.spec,
      // ignore: avoid-dynamic
      (dynamic value) => ImageSpecTween(begin: value as ImageSpec?),
    ) as ImageSpecTween?;
  }

  @override
  Widget build(BuildContext context) {
    final spec = _spec?.evaluate(animation);

    return MixedImage(
      spec: spec,
      image: widget.image,
      frameBuilder: widget.frameBuilder,
      loadingBuilder: widget.loadingBuilder,
      errorBuilder: widget.errorBuilder,
      semanticLabel: widget.semanticLabel,
      excludeFromSemantics: widget.excludeFromSemantics,
    );
  }
}
