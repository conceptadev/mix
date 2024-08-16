part of '../select.dart';

typedef XSelectMenuItemBuilder<T> = List<XSelectMenuItem<T>> Function(
  BuildContext context,
  SelectMenuItemSpec spec,
);

class XSelectMenuItemSpecWidget extends StatelessWidget {
  const XSelectMenuItemSpecWidget({
    super.key,
    IconData? icon,
    required this.spec,
    required this.text,
  }) : iconData = icon;

  final SelectMenuItemSpec spec;
  final IconData? iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: XSelectStyle.item,
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
