part of '../select.dart';

typedef XSelectMenuItemBuilder = List<Widget> Function(
  BuildContext context,
  SelectMenuItemSpec spec,
);

class XSelectMenuSpecWidget extends StatelessWidget {
  const XSelectMenuSpecWidget({
    super.key,
    required this.spec,
    required this.children,
  });

  final SelectMenuSpec spec;
  final XSelectMenuItemBuilder children;

  @override
  Widget build(BuildContext context) {
    final menu = SelectSpec.of(context).menu;
    final item = SelectSpec.of(context).item;

    final container = menu.container;
    final flex = menu.flex;

    return container(
      child: flex(
        direction: Axis.vertical,
        children: children(context, item),
      ),
    );
  }
}

class XSelectMenuItemSpecWidget extends StatelessWidget {
  const XSelectMenuItemSpecWidget({
    super.key,
    required this.spec,
    required this.icon,
    required this.text,
    this.onPress,
  });

  final SelectMenuItemSpec spec;
  final IconData icon;
  final String text;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPress: () {},
      child: SpecBuilder(
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
                icon(this.icon),
                text(this.text),
              ],
            ),
          );
        },
      ),
    );
  }
}
