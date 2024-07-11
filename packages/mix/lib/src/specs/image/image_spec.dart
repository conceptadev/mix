// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports,
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'image_spec.g.dart';

@MixableSpec()
final class ImageSpec extends Spec<ImageSpec> with _$ImageSpec {
  final double? width, height;
  final Color? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Rect? centerSlice;
  final FilterQuality? filterQuality;

  final BlendMode? colorBlendMode;

  static const of = _$ImageSpec.of;

  static const from = _$ImageSpec.from;

  const ImageSpec({
    this.width,
    this.height,
    this.color,
    this.repeat,
    this.fit,
    this.alignment,
    this.centerSlice,
    this.filterQuality,
    this.colorBlendMode,
    super.animated,
    super.modifiers,
  });

  Widget call({
    required ImageProvider<Object> image,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    bool matchTextDirection = false,
    Animation<double>? opacity,
  }) {
    return isAnimated
        ? AnimatedImageSpecWidget(
            spec: this,
            image: image,
            frameBuilder: frameBuilder,
            loadingBuilder: loadingBuilder,
            errorBuilder: errorBuilder,
            semanticLabel: semanticLabel,
            excludeFromSemantics: excludeFromSemantics,
            duration: animated!.duration,
            curve: animated!.curve,
            gaplessPlayback: gaplessPlayback,
            isAntiAlias: isAntiAlias,
            matchTextDirection: matchTextDirection,
            opacity: opacity,
          )
        : ImageSpecWidget(
            spec: this,
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
  }
}
