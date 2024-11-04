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

  /// The primary text displayed in the menu item.
  final String title;

  /// Optional secondary text displayed below the title.
  final String? subtitle;

  /// {@macro remix.component.onPressed}
  final VoidCallback? onPress;

  /// A builder that returns a [Widget] for the menu item's leading icon.
  ///
  /// This builder creates a widget to display at the start of the menu item.
  ///
  /// {@macro remix.widget_spec_builder.icon_spec}
  ///
  /// ```dart
  /// MenuItem(
  ///   title: 'Settings',
  ///   leadingWidgetBuilder: (spec) => spec(Icons.settings),
  /// );
  /// ```
  final WidgetSpecBuilder<IconSpec>? leadingWidgetBuilder;

  /// A builder that returns a [Widget] for the menu item's trailing icon.
  ///
  /// This builder creates a widget to display at the end of the menu item.
  ///
  /// {@macro remix.widget_spec_builder.icon_spec}
  ///
  /// ```dart
  /// MenuItem(
  ///   title: 'Next',
  ///   trailingWidgetBuilder: (spec) => spec(Icons.chevron_right),
  /// );
  /// ```
  final WidgetSpecBuilder<IconSpec>? trailingWidgetBuilder;

  /// {@macro remix.component.disabled}
  final bool disabled;

  /// {@macro remix.component.variants}
  final List<Variant> variants;

  /// {@macro remix.component.style}
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

          return MenuItemSpecWidget(
            spec: spec,
            leadingWidgetBuilder: leadingWidgetBuilder,
            title: title,
            subtitle: subtitle,
            trailingWidgetBuilder: trailingWidgetBuilder,
          );
        },
      ),
    );
  }
}

class MenuItemSpecWidget extends StatelessWidget {
  const MenuItemSpecWidget({
    super.key,
    required this.spec,
    required this.leadingWidgetBuilder,
    required this.title,
    required this.subtitle,
    required this.trailingWidgetBuilder,
  });

  final MenuItemSpec spec;
  final WidgetSpecBuilder<IconSpec>? leadingWidgetBuilder;
  final String title;
  final String? subtitle;
  final WidgetSpecBuilder<IconSpec>? trailingWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    return spec.outerContainer(
      child: spec.contentLayout(
        direction: Axis.horizontal,
        children: [
          if (leadingWidgetBuilder != null) leadingWidgetBuilder!(spec.icon),
          spec.titleSubtitleLayout(
            direction: Axis.vertical,
            children: [
              spec.title(title),
              if (subtitle != null) spec.subtitle(subtitle!),
            ],
          ),
          if (trailingWidgetBuilder != null) trailingWidgetBuilder!(spec.icon),
        ],
      ),
    );
  }
}
