part of 'avatar.dart';

class RxBlankAvatar extends StatelessWidget {
  const RxBlankAvatar({
    super.key,
    this.image,
    this.fallback,
    required this.style,
  });

  final ImageProvider<Object>? image;
  final String? fallback;
  final Style style;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
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
      style: style,
    );
  }
}
