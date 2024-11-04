part of 'select.dart';

/// A menu item for use in a [Select] dropdown.
///
/// Each menu item has a [value] that will be passed to the [Select.onChanged]
/// callback when selected, and a [childBuilder] that defines how the item is displayed.
///
///
/// Example:
/// ```dart
/// SelectMenuItem(
///   value: 'item1',
///   childBuilder: (spec) => spec(
///     title: 'Item 1',
///     subtitle: 'Description',
///     leadingWidgetBuilder: (spec) => spec(Icons.star),
///   ),
/// )
/// ```
class SelectMenuItem<T> {
  /// The value associated with this menu item.
  /// This value will be passed to [Select.onChanged] when the item is selected.
  final T value;

  /// A builder function that returns the widget to display for this menu item.
  /// The builder receives a [MenuItemSpec] that can be used to customize the appearance.
  final WidgetSpecBuilder<MenuItemSpec> childBuilder;

  /// Creates a menu item for a [Select] dropdown.
  ///
  /// The [value] and [childBuilder] parameters must not be null.
  const SelectMenuItem({required this.value, required this.childBuilder});
}

class Select<T> extends StatefulWidget {
  const Select({
    super.key,
    required this.value,
    required this.onChanged,
    required this.button,
    required this.items,
    this.variants = const [],
    this.style,
    this.disabled = false,
  });

  /// The currently selected value in the select component.
  final T value;

  /// {@macro remix.component.style}
  final SelectStyle? style;

  /// {@macro remix.component.variants}
  final List<Variant> variants;

  /// {@macro remix.component.onChanged}
  final ValueChanged<T> onChanged;

  /// Builder function that creates the button portion of the select component.
  /// When tapped, this button will display the dropdown menu.
  /// This allows customizing how the button is displayed.
  final WidgetSpecBuilder<SelectButtonSpec> button;

  /// {@macro remix.component.disabled}
  final bool disabled;

  /// The list of items to display in the dropdown menu.
  /// Each item contains a value and widget to display.
  final List<SelectMenuItem<T>> items;

  @override
  State<Select> createState() => SelectState<T>();
}

class SelectState<T> extends State<Select<T>>
    with SingleTickerProviderStateMixin {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  late final MixWidgetStateController _menuStateController;
  late final MixWidgetStateController _buttonStateController;

  final _baseAnimation = (
    duration: const Duration(milliseconds: 100),
    curve: Curves.decelerate,
  );

  final _link = LayerLink();

  @override
  void initState() {
    super.initState();

    _menuStateController = MixWidgetStateController()..selected = false;
    _buttonStateController = MixWidgetStateController()
      ..disabled = widget.disabled;
  }

  @override
  void didUpdateWidget(covariant Select<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    _buttonStateController.disabled = widget.disabled;
  }

  @override
  void dispose() {
    _buttonStateController.dispose();
    _menuStateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? context.remix.components.select;
    final configuration = SpecConfiguration(context, SelectSpecUtility.self);
    final appliedStyle =
        style.makeStyle(configuration).applyVariants(widget.variants);

    return SpecBuilder(
      controller: _buttonStateController,
      style: appliedStyle,
      builder: (context) {
        final button = SelectSpec.of(context).button;
        final position = SelectSpec.of(context).position;

        return CompositedTransformTarget(
          link: _link,
          child: OverlayPortal(
            controller: _tooltipController,
            overlayChildBuilder: (BuildContext context) {
              return Stack(children: [
                GestureDetector(
                  onTap: () => hide(),
                  child: Container(color: Colors.transparent),
                ),
                CompositedTransformFollower(
                  link: _link,
                  targetAnchor:
                      position.targetAnchor.resolve(TextDirection.ltr),
                  followerAnchor:
                      position.followerAnchor.resolve(TextDirection.ltr),
                  child: SpecBuilder(
                    controller: _menuStateController,
                    style: appliedStyle.animate(
                      duration: _baseAnimation.duration,
                      curve: _baseAnimation.curve,
                      onEnd: () {
                        if (_menuStateController.selected == false) {
                          _tooltipController.hide();
                        }
                      },
                    ),
                    builder: (context) {
                      final select = SelectSpec.of(context);
                      final menu = select.menu;
                      final Container = menu.container.copyWith(
                        width: menu.autoWidth ? _link.leaderSize!.width : null,
                      );
                      final Flex = menu.flex;

                      return Container(
                        child: Flex(
                          direction: Axis.vertical,
                          children: widget.items.map((item) {
                            final selectedItemStateController =
                                MixWidgetStateController()..selected = true;

                            return Pressable(
                              onPress: () {
                                widget.onChanged(item.value);
                                hide();
                              },
                              controller: (widget.value == item.value)
                                  ? selectedItemStateController
                                  : null,
                              child: SpecBuilder(
                                style: appliedStyle.animate(
                                  duration: _baseAnimation.duration,
                                  curve: _baseAnimation.curve,
                                ),
                                builder: (context) {
                                  final itemSpec = SelectSpec.of(context).item;

                                  return item.childBuilder(itemSpec);
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),
              ]);
            },
            child: RepaintBoundary(
              child: Pressable(
                enabled: !widget.disabled,
                onPress: onTap,
                child: widget.button(button),
              ),
            ),
          ),
        );
      },
    );
  }

  void show() {
    if (!_tooltipController.isShowing) {
      _tooltipController.show();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _menuStateController.selected = true;
    });
  }

  void hide() {
    _menuStateController.selected = false;
  }

  void onTap() {
    if (!_tooltipController.isShowing) {
      show();
    } else {
      hide();
    }
  }
}
