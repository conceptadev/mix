part of 'divider.dart';

class Divider extends StatelessWidget {
  const Divider({
    super.key,
    this.style,
    this.variants = const [],
    this.axis = Axis.horizontal,
    this.child,
  });

  final Widget? child;
  final DividerStyle? style;
  final Axis axis;
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? context.remix.components.divider;
    final axisVariant = axis == Axis.horizontal
        ? DividerStyle.horizontal
        : DividerStyle.vertical;

    final configuration = SpecConfiguration(context, DividerSpecUtility.self);
    final styleA = style
        .makeStyle(configuration)
        .applyVariants([...variants, axisVariant]);

    return SpecBuilder(
      style: styleA,
      builder: (context) {
        final spec = DividerSpec.of(context);

        if (child != null) {
          return spec.flex(
            direction: axis,
            children: [
              Expanded(child: spec.container()),
              AttributeBridge<DividerSpecAttribute>(
                bridgeBuilder: (attribute) => attribute!.label!,
                child: child!,
              ),
              Expanded(child: spec.container()),
            ],
          );
        }

        return spec.container();
      },
    );
  }
}
