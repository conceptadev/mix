part of 'card.dart';

class XCard extends StatelessWidget {
  const XCard({
    super.key,
    required this.children,
    this.style = const Style.empty(),
  }) : _blank = false;

  const XCard.blank({
    super.key,
    required this.children,
    required this.style,
  }) : _blank = true;

  /// The list of child widgets to be displayed inside the card.
  final List<Widget> children;

  /// Additional custom styling for the card.
  ///
  /// This allows you to override or extend the default card styling.
  final Style style;
  final bool _blank;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: _blank ? style : XCardStyle.base.merge(style),
      builder: (context) {
        final spec = CardSpec.of(context);

        return spec.container(
          child: spec.flex(direction: Axis.vertical, children: children),
        );
      },
    );
  }
}
