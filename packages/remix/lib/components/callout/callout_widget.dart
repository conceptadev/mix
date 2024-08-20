part of 'callout.dart';

class RxCallout extends StatelessWidget {
  const RxCallout({
    super.key,
    required this.text,
    this.icon,
    this.style,
    this.variant = CalloutVariant.soft,
  });

  final String text;
  final IconData? icon;

  /// Additional custom styling for the callout.
  ///
  /// This allows you to override or extend the default callout styling.
  final Style? style;

  final CalloutVariant variant;

  @override
  Widget build(BuildContext context) {
    return RxBlankCallout(
      icon: icon,
      text: text,
      style: calloutStyle(style, [variant]),
    );
  }
}
