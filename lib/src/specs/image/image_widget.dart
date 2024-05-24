import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../factory/mix_provider.dart';
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
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.matchTextDirection = false,
    this.opacity,
    super.orderOfModifiers = const [],
  });

  final ImageProvider<Object> image;
  final ImageFrameBuilder? frameBuilder;
  final ImageLoadingBuilder? loadingBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final bool gaplessPlayback;
  final bool isAntiAlias;
  final bool matchTextDirection;
  final Animation<double>? opacity;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (context) {
      final mix = Mix.of(context);
      final spec = ImageSpec.of(context);

      return mix.isAnimated
          ? AnimatedImageSpecWidget(
              spec: spec,
              image: image,
              frameBuilder: frameBuilder,
              loadingBuilder: loadingBuilder,
              errorBuilder: errorBuilder,
              semanticLabel: semanticLabel,
              excludeFromSemantics: excludeFromSemantics,
              duration: mix.animation!.duration,
              curve: mix.animation!.curve,
              gaplessPlayback: gaplessPlayback,
              isAntiAlias: isAntiAlias,
              matchTextDirection: matchTextDirection,
              opacity: opacity,
            )
          : ImageSpecWidget(
              spec: spec,
              image: image,
              frameBuilder: frameBuilder,
              loadingBuilder: loadingBuilder,
              errorBuilder: errorBuilder,
              semanticLabel: semanticLabel,
              excludeFromSemantics: excludeFromSemantics,
              gaplessPlayback: gaplessPlayback,
              isAntiAlias: isAntiAlias,
              opacity: opacity,
              matchTextDirection: matchTextDirection,
            );
    });
  }
}

class ImageSpecWidget extends StatelessWidget {
  const ImageSpecWidget({
    super.key,
    this.modifierOrder = const [],
    this.spec,
    required this.image,
    this.frameBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.opacity,
    this.matchTextDirection = false,
  });

  final ImageSpec? spec;
  final ImageProvider<Object> image;
  final ImageFrameBuilder? frameBuilder;
  final ImageLoadingBuilder? loadingBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final List<Type> modifierOrder;
  final bool gaplessPlayback;
  final bool isAntiAlias;
  final bool matchTextDirection;
  final Animation<double>? opacity;

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
      opacity: opacity,
      colorBlendMode: spec?.colorBlendMode ?? BlendMode.clear,
      fit: spec?.fit,
      alignment: spec?.alignment ?? Alignment.center,
      repeat: spec?.repeat ?? ImageRepeat.noRepeat,
      centerSlice: spec?.centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: spec?.filterQuality ?? FilterQuality.low,
    );
  }
}

class AnimatedImageSpecWidget extends ImplicitlyAnimatedWidget {
  const AnimatedImageSpecWidget({
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
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.matchTextDirection = false,
    this.opacity,
  });

  final ImageSpec? spec;
  final ImageProvider<Object> image;
  final ImageFrameBuilder? frameBuilder;
  final ImageLoadingBuilder? loadingBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final bool gaplessPlayback;
  final bool isAntiAlias;
  final bool matchTextDirection;
  final Animation<double>? opacity;

  @override
  AnimatedWidgetBaseState<AnimatedImageSpecWidget> createState() =>
      _AnimateImageSpecState();
}

class _AnimateImageSpecState
    extends AnimatedWidgetBaseState<AnimatedImageSpecWidget> {
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

    return ImageSpecWidget(
      spec: spec,
      image: widget.image,
      frameBuilder: widget.frameBuilder,
      loadingBuilder: widget.loadingBuilder,
      errorBuilder: widget.errorBuilder,
      semanticLabel: widget.semanticLabel,
      excludeFromSemantics: widget.excludeFromSemantics,
      gaplessPlayback: widget.gaplessPlayback,
      isAntiAlias: widget.isAntiAlias,
      opacity: widget.opacity,
      matchTextDirection: widget.matchTextDirection,
    );
  }
}
