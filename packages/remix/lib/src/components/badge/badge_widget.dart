part of 'badge.dart';

class XBadge extends StatelessWidget {
  const XBadge({
    super.key,
    required this.label,
    this.style = const Style.empty(),
    this.variants = const [],
  });

  final String label;
  final Style style;
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    final styleFromTheme = RemixThemeProvider.maybeOf(context)?.badge;

    return SpecBuilder(
      style: (styleFromTheme ?? XBadgeStyle.base)
          .merge(style)
          .applyVariants(variants),
      builder: (context) {
        final spec = BadgeSpec.of(context);

        final ContainerWidget = spec.container;
        final LabelWidget = spec.label;

        return ContainerWidget(child: LabelWidget(label));
      },
    );
  }
}
