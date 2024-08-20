part of 'badge.dart';

class RxBadge extends StatelessWidget {
  const RxBadge({
    super.key,
    required this.label,
    this.style,
    this.size = BadgeSize.medium,
    this.radius = BadgeRadius.medium,
    this.variant = BadgeVariant.soft,
  });

  final String label;
  final Style? style;
  final BadgeSize size;
  final BadgeRadius radius;
  final BadgeVariant variant;

  @override
  Widget build(BuildContext context) {
    return RxBlankBadge(
      label: label,
      style: badgeStyle(style, [size, variant, radius]),
    );
  }
}
