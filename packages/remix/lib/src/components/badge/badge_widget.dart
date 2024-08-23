part of 'badge.dart';

class XBadge extends StatelessWidget {
  const XBadge({
    super.key,
    required this.label,
    this.style = const Style.empty(),
  }) : _blank = false;

  const XBadge.blank({super.key, required this.label, required this.style})
      : _blank = true;

  final String label;
  final Style style;
  final bool _blank;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: _blank ? style : XBadgeStyle.base.merge(style),
      builder: (context) {
        final spec = BadgeSpec.of(context);

        final ContainerWidget = spec.container;
        final LabelWidget = spec.label;

        return ContainerWidget(child: LabelWidget(label));
      },
    );
  }
}
