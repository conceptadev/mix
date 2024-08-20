import 'package:flutter/widgets.dart';

import '../../core/styled_widget.dart';
import '../../internal/constants.dart';
import '../../modifiers/internal/render_widget_modifier.dart';
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
      final spec = ImageSpec.of(context);

      return spec.isAnimated
          ? AnimatedImageSpecWidget(
              spec: spec,
              image: image,
              frameBuilder: frameBuilder,
              loadingBuilder: loadingBuilder,
              errorBuilder: errorBuilder,
              semanticLabel: semanticLabel,
              excludeFromSemantics: excludeFromSemantics,
              duration: spec.animated!.duration,
              curve: spec.animated!.curve,
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
    this.orderOfModifiers = const [],
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
    this.onEndSpecModifiersAnimation,
  });

  final ImageSpec? spec;
  final ImageProvider<Object> image;
  final ImageFrameBuilder? frameBuilder;
  final ImageLoadingBuilder? loadingBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final List<Type> orderOfModifiers;
  final bool gaplessPlayback;
  final bool isAntiAlias;
  final bool matchTextDirection;
  final Animation<double>? opacity;

  /// Called when spec modifiers are animated and the animation is complete.
  final void Function()? onEndSpecModifiersAnimation;

  @override
  Widget build(BuildContext context) {
    return RenderSpecModifiers(
      orderOfModifiers: orderOfModifiers,
      spec: spec ?? const ImageSpec(),
      onEndWhenAnimated: onEndSpecModifiersAnimation,
      child: Image(
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
      ),
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
    this.onEndSpecModifiersAnimation,
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

  /// Called when spec modifiers are animated and the animation is complete.
  final void Function()? onEndSpecModifiersAnimation;

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
      onEndSpecModifiersAnimation: widget.onEndSpecModifiersAnimation,
    );
  }
}
