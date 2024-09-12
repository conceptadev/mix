part of 'divider.dart';

class XDivider extends StatelessWidget {
  const XDivider({
    super.key,
    this.style = const Style.empty(),
    this.variants = const [],
    required this.axis,
  });

  final Style style;
  final Axis axis;
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    final styleFromTheme = _RemixThemeProvider.maybeOf(context)?.divider;
    final axisVariant = axis == Axis.horizontal
        ? XProgressVariants.horizontal
        : XProgressVariants.vertical;

    return SpecBuilder(
      style: (styleFromTheme ?? XDividerStyle.base)
          .merge(style)
          .applyVariants([...variants, axisVariant]),
      builder: (context) {
        final spec = DividerSpec.of(context);

        return spec.container();
      },
    );
  }
}
