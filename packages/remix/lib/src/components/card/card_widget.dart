part of 'card.dart';

class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.child,
    this.style,
    this.variants = const [],
  });

  /// The list of child widgets to be displayed inside the card.
  final Widget child;

  /// Additional custom styling for the card.
  ///
  /// This allows you to override or extend the default card styling.
  final CardStyle? style;
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? context.remix.components.card;

    final configuration = SpecConfiguration(context, CardSpecUtility.self);

    return SpecBuilder(
      style: style.makeStyle(configuration).applyVariants(variants),
      builder: (context) {
        final spec = CardSpec.of(context);

        return CardSpecWidget(spec: spec, child: child);
      },
    );
  }
}

class CardSpecWidget extends StatelessWidget {
  const CardSpecWidget({super.key, required this.spec, required this.child});

  final CardSpec? spec;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return spec!.container(child: child);
  }
}
