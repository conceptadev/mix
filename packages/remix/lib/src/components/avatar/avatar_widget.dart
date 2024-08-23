part of 'avatar.dart';

typedef XAvatarFallbackBuilder = XComponentBuilder<TextSpec>;

class XAvatar extends StatelessWidget {
  const XAvatar({
    super.key,
    this.image,
    required this.fallbackBuilder,
    this.style = const Style.empty(),
  }) : _blank = false;

  const XAvatar.blank({
    super.key,
    this.image,
    required this.fallbackBuilder,
    required this.style,
  }) : _blank = true;

  final XAvatarFallbackBuilder fallbackBuilder;
  final ImageProvider<Object>? image;
  final Style style;
  final bool _blank;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: _blank ? style : XAvatarStyle.base.merge(style),
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
                  errorBuilder: (context, error, stackTrace) => SizedBox(),
                ),
            ],
          ),
        );
      },
    );
  }
}
