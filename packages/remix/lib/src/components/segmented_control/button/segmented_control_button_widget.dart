part of '../segmented_control.dart';

class SegmentButton extends StatelessWidget {
  const SegmentButton({super.key, IconData? icon, this.text}) : iconData = icon;

  final IconData? iconData;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      inherit: true,
      builder: (context) {
        final item = SegmentedControlSpec.of(context).item;

        final container = item.container;
        final flex = item.flex;
        final icon = item.icon;
        final label = item.label;

        return container(
          child: flex(
            children: [
              if (iconData != null) icon(iconData),
              if (text != null) label(text!),
            ],
            direction: Axis.horizontal,
          ),
        );
      },
    );
  }
}
