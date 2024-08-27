part of 'avatar.dart';

typedef XAvatarFallbackBuilder = XComponentBuilder<TextSpec>;

class XAvatar extends StatelessWidget {
  const XAvatar({
    super.key,
    this.image,
    required this.fallbackBuilder,
    this.variants = const [],
    this.style = const Style.empty(),
  });

  final XAvatarFallbackBuilder fallbackBuilder;
  final ImageProvider<Object>? image;
  final List<Variant> variants;
  final Style style;

  @override
  Widget build(BuildContext context) {
    final styleFromTheme = RemixThemeProvider.maybeOf(context)?.avatar;

    return SpecBuilder(
      style: (styleFromTheme ?? XAvatarStyle.base)
          .merge(style)
          .applyVariants(variants),
      builder: (context) {
        final spec = AvatarSpec.of(context);

        final ContainerWidget = spec.container;
        final ImageWidget = spec.image;
        final StackWidget = spec.stack;

        return ContainerWidget(
          child: StackWidget(
            children: [
              fallbackBuilder(spec.fallback),
              if (image != null)
                ImageWidget(
                  image: image!,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(),
                ),
            ],
          ),
        );
      },
    );
  }
}
