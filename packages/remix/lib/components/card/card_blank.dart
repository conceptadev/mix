part of 'card.dart';

class RxBlankCard extends StatelessWidget {
  const RxBlankCard({
    super.key,
    required this.children,
    required this.style,
  });

  /// The list of child widgets to be displayed inside the card.
  final List<Widget> children;

  /// Additional custom styling for the card.
  ///
  /// This allows you to override or extend the default card styling.
  final Style style;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      builder: (context) {
        final spec = CardSpec.of(context);

        return spec.container(
          child: spec.flex(direction: Axis.vertical, children: children),
        );
      },
      style: style,
    );
  }
}
