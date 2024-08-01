part of 'avatar.dart';

class RxAvatar extends StatelessWidget {
  const RxAvatar({
    super.key,
    this.image,
    this.fallback,
    this.size = AvatarSize.size4,
    this.variant = AvatarVariant.solid,
    this.radius = AvatarRadius.full,
    this.style,
  });

  final ImageProvider<Object>? image;
  final String? fallback;
  final AvatarSize size;
  final AvatarVariant variant;
  final AvatarRadius radius;
  final Style? style;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: avatarStyle(style, [size, variant, radius]),
      builder: (context) {
        final spec = AvatarSpec.of(context);

        final ContainerWidget = spec.container;
        final ImageWidget = spec.image;
        final FallbackWidget = spec.fallback;

        return ContainerWidget(
          child: image != null
              ? ImageWidget(
                  image: image!,
                  errorBuilder: (context, error, stackTrace) {
                    return FallbackWidget(fallback ?? '');
                  },
                )
              : FallbackWidget(fallback ?? ''),
        );
      },
    );
  }

  String toStringComponent() {
    return '''
RxAvatar(
  image: $image,
  fallback: '$fallback',
  size: $size,
  variant: $variant,
  radius: $radius,
)
''';
  }
}
