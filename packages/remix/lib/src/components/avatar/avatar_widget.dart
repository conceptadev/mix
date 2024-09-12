part of 'avatar.dart';

typedef AvatarFallbackBuilder = WidgetSpecBuilder<TextSpec>;

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.image,
    required this.fallbackBuilder,
    this.variants = const [],
    this.style,
  });

  final AvatarFallbackBuilder fallbackBuilder;
  final ImageProvider<Object>? image;
  final List<Variant> variants;
  final AvatarStyle? style;

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? context.remix.components.avatar;

    final configuration = SpecConfiguration(context, AvatarSpecUtility.self);

    return SpecBuilder(
      style: style.makeStyle(configuration).applyVariants(variants),
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
