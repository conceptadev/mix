part of '../select.dart';

class SelectMenuItemWidget extends StatelessWidget {
  const SelectMenuItemWidget({
    super.key,
    IconData? icon,
    required this.text,
  }) : iconData = icon;

  final IconData? iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      inherit: true,
      builder: (context) {
        final item = SelectSpec.of(context).item;

        final container = item.container;
        final flex = item.flex;
        final icon = item.icon;
        final text = item.text;

        return container(
          child: flex(
            children: [
              if (iconData != null) icon(iconData),
              text(this.text),
            ],
            direction: Axis.horizontal,
          ),
        );
      },
    );
  }
}
