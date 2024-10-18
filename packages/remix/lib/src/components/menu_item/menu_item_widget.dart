part of 'menu_item.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingWidgetBuilder,
    this.trailingWidgetBuilder,
    this.onPress,
    this.variants = const [],
    this.style,
    this.disabled = false,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onPress;
  final WidgetSpecBuilder<IconSpec>? leadingWidgetBuilder;
  final WidgetSpecBuilder<IconSpec>? trailingWidgetBuilder;
  final bool disabled;
  final List<Variant> variants;
  final MenuItemStyle? style;

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? context.remix.components.menuItem;
    final configuration = SpecConfiguration(context, MenuItemSpecUtility.self);

    return Pressable(
      enabled: !disabled,
      onPress: disabled ? null : onPress,
      child: SpecBuilder(
        style: style.makeStyle(configuration).applyVariants([...variants]),
        builder: (context) {
          final spec = MenuItemSpec.of(context);

          return spec.outerContainer(
            child: spec.contentLayout(
              direction: Axis.horizontal,
              children: [
                if (leadingWidgetBuilder != null)
                  leadingWidgetBuilder!(spec.icon),
                spec.titleSubtitleLayout(
                  direction: Axis.vertical,
                  children: [
                    spec.title(title),
                    if (subtitle != null) spec.subtitle(subtitle!),
                  ],
                ),
                if (trailingWidgetBuilder != null)
                  trailingWidgetBuilder!(spec.icon),
              ],
            ),
          );
        },
      ),
    );
  }
}
