part of 'card.dart';

class XCard extends StatelessWidget {
  const XCard({
    super.key,
    required this.children,
    this.style = const Style.empty(),
    this.variants = const [],
  });

  /// The list of child widgets to be displayed inside the card.
  final List<Widget> children;

  /// Additional custom styling for the card.
  ///
  /// This allows you to override or extend the default card styling.
  final Style style;
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    final styleFromTheme = _RemixThemeProvider.maybeOf(context)?.card;

    return SpecBuilder(
      style: (styleFromTheme ?? XCardStyle.base)
          .merge(style)
          .applyVariants(variants),
      builder: (context) {
        final spec = CardSpec.of(context);

        return CardSpecWidget(spec: spec, children: children);
      },
    );
  }
}

class CardSpecWidget extends StatelessWidget {
  const CardSpecWidget({
    super.key,
    required this.spec,
    required this.children,
  });

  final CardSpec? spec;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return spec!.container(
      child: spec!.flex(direction: Axis.vertical, children: children),
    );
  }
}
