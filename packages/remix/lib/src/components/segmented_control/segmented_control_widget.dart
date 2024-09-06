part of 'segmented_control.dart';

typedef XSegmentedControlButtonBuilder
    = XComponentBuilder<SegmentedControlButtonSpec>;

const selectedItem = Variant('selectedItem');

class XSegmentedControl extends StatelessWidget {
  const XSegmentedControl({
    super.key,
    this.isEnabled = true,
    this.index = 0,
    this.variants = const [],
    required this.style,
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
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: style,
      builder: (context) {
        final spec = SegmentedControlSpec.of(context);

        return spec.container(
          child: spec.flex(
            direction: Axis.vertical,
            children: [
              for (int i = 0; i < buttons.length; i++)
                Pressable(
                  onPress: () => onIndexChanged(i),
                  child: SpecBuilder(
                    style: style.applyVariant(i == index ? selectedItem : null),
                    builder: (_) {
                      return buttons[i];
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
