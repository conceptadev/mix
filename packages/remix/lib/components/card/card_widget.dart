part of 'card.dart';

class RxCard extends StatelessWidget {
  const RxCard({
    super.key,
    this.variant = CardVariant.outline,
    this.size = CardSize.size2,
    this.style,
    required this.children,
  });

  /// The list of child widgets to be displayed inside the card.
  final List<Widget> children;

  final CardVariant variant;
  final CardSize size;

  /// Additional custom styling for the card.
  ///
  /// This allows you to override or extend the default card styling.
  final Style? style;

  @override
  Widget build(BuildContext context) {
    return RxBlankCard(
      style: _buildCustomCardStyle(style, [variant, size]),
      children: children,
    );
  }
}
