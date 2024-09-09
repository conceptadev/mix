part of '../select.dart';

class XSelectMenuItemWidget extends StatelessWidget {
  const XSelectMenuItemWidget({
    super.key,
    IconData? icon,
    required this.text,
  }) : iconData = icon;

  final IconData? iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      builder: (context) {
        final item = SelectSpec.of(context).item;

        final container = item.container;
        final flex = item.flex;
        final icon = item.icon;
        final text = item.text;

        return container(
          child: flex(
            direction: Axis.horizontal,
            children: [
              if (iconData != null) icon(this.iconData),
              text(this.text),
            ],
          ),
        );
      },
    );
  }
}
