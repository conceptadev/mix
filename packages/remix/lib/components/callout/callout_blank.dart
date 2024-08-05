part of 'callout.dart';

class RxBlankCallout extends StatelessWidget {
  const RxBlankCallout({
    super.key,
    this.icon,
    required this.text,
    required this.style,
  });

  final String text;
  final IconData? icon;

  /// Additional custom styling for the callout.
  ///
  /// This allows you to override or extend the default callout styling.
  final Style style;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: style,
      builder: (context) {
        final spec = CalloutSpec.of(context);

        return spec.container(
          child: spec.flex(
            direction: Axis.horizontal,
            children: [
              if (icon != null) spec.icon(icon!),
              spec.text(text),
            ],
          ),
        );
      },
    );
  }
}
