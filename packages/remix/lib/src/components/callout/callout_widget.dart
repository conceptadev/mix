part of 'callout.dart';

class XCallout extends StatelessWidget {
  const XCallout({
    super.key,
    this.icon,
    required this.text,
    this.style = const Style.empty(),
  }) : _blank = false;

  const XCallout.blank({
    super.key,
    this.icon,
    required this.text,
    required this.style,
  }) : _blank = true;

  final String text;
  final IconData? icon;

  /// Additional custom styling for the callout.
  ///
  /// This allows you to override or extend the default callout styling.
  final Style style;

  final bool _blank;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: _blank ? style : XCalloutStyle.base.merge(style),
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
