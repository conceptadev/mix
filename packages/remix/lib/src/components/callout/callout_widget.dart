part of 'callout.dart';

class Callout extends StatelessWidget {
  const Callout({
    super.key,
    this.icon,
    required this.text,
    this.variants = const [],
    this.style,
  });

  final String text;
  final IconData? icon;
  final List<Variant> variants;

  /// Additional custom styling for the callout.
  ///
  /// This allows you to override or extend the default callout styling.
  final CalloutStyle? style;

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? context.remix.components.callout;

    final configuration = SpecConfiguration(context, CalloutSpecUtility.self);

    return SpecBuilder(
      style: style.makeStyle(configuration).applyVariants(variants),
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
