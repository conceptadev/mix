part of 'badge.dart';

class RxBlankBadge extends StatelessWidget {
  const RxBlankBadge({
    super.key,
    required this.label,
    required this.style,
  });

  final String label;
  final Style style;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: style,
      builder: (context) {
        final spec = BadgeSpec.of(context);

        final ContainerWidget = spec.container;
        final LabelWidget = spec.label;

        return ContainerWidget(
          child: LabelWidget(label),
        );
      },
    );
  }
}
