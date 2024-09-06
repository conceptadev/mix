part of 'segmented_control.dart';

typedef XSegmentedControlButtonBuilder
    = XComponentBuilder<SegmentedControlButtonSpec>;

const selectedItem = Variant('selectedItem');

class XSegmentedControl extends StatefulWidget {
  const XSegmentedControl({
    super.key,
    this.isEnabled = true,
    this.index = 0,
    this.variants = const [],
    this.style = const Style.empty(),
    required this.buttons,
    required this.onIndexChanged,
  });

  final int index;
  final ValueChanged<int> onIndexChanged;
  final bool isEnabled;
  final Style style;
  final List<Variant> variants;
  final List<Widget> buttons;

  @override
  State<XSegmentedControl> createState() => _XSegmentedControlState();
}

class _XSegmentedControlState extends State<XSegmentedControl> {
  late final MixWidgetStateController controller;

  @override
  void initState() {
    super.initState();
    controller = MixWidgetStateController()..selected = true;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styleFromTheme =
        RemixThemeProvider.maybeOf(context)?.segmentedControl;

    final style = (styleFromTheme ?? XSegmentedControlStyle.base)
        .merge(widget.style)
        .applyVariants(widget.variants);

    return SpecBuilder(
      style: style,
      builder: (context) {
        final spec = SegmentedControlSpec.of(context);

        return spec.container(
          child: spec.flex(
            direction: Axis.vertical,
            children: [
              for (int i = 0; i < widget.buttons.length; i++)
                Pressable(
                  onPress: () => widget.onIndexChanged(i),
                  child: SpecBuilder(
                    controller: i == widget.index ? controller : null,
                    style: style,
                    builder: (_) {
                      return widget.buttons[i];
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
