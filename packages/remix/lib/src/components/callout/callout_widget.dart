part of 'callout.dart';

class XCallout extends StatelessWidget {
  const XCallout({
    super.key,
    this.icon,
    required this.text,
    this.variants = const [],
    this.style = const Style.empty(),
  });

  final String text;
  final IconData? icon;
  final List<Variant> variants;

  /// Additional custom styling for the callout.
  ///
  /// This allows you to override or extend the default callout styling.
  final Style style;

  @override
  Widget build(BuildContext context) {
    final styleFromTheme = RemixThemeProvider.maybeOf(context)?.callout;

    return SpecBuilder(
      style: (styleFromTheme ?? XCalloutStyle.base)
          .merge(style)
          .applyVariants(variants),
      builder: (context) {
        final spec = CalloutSpec.of(context);

        return spec.container(
          child: spec.flex(
            direction: Axis.horizontal,
            children: [if (icon != null) spec.icon(icon!), spec.text(text)],
          ),
        );
      },
    );
  }
}
