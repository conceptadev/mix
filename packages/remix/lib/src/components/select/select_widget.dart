part of 'select.dart';

class SelectMenuItem<T> {
  final T value;
  final Widget child;

  const SelectMenuItem({required this.value, required this.child});
}

class Select<T> extends StatefulWidget {
  const Select({
    super.key,
    required this.value,
    required this.onChanged,
    required this.trigger,
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
  final WidgetSpecBuilder<SelectButtonSpec> trigger;

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
  late final MixWidgetStateController _menuStateController;
  late final MixWidgetStateController _buttonStateController;

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

  void openMenu() {
    setState(() {
      _menuStateController.selected = true;
    });
  }

  void closeMenu() {
    setState(() {
      _menuStateController.selected = false;
    });
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

    final animatedStyle = appliedStyle.cast<AnimatedStyle>();

    return OverlayWrapper(
      target: RepaintBoundary(
        child: SpecBuilder(
          controller: _buttonStateController,
          style: appliedStyle,
          builder: (context) {
            final buttonSpec = SelectSpec.of(context).button;

            return widget.trigger(buttonSpec);
          },
        ),
      ),
      overlayChild: SpecBuilder(
        controller: _menuStateController,
        style: appliedStyle,
        builder: (context) {
          final select = SelectSpec.of(context);
          final menu = select.menu;

          final FlexContainer = menu.container.copyWith(
            box: menu.container.box.copyWith(
              width: menu.autoWidth ? _link.leaderSize!.width : null,
            ),
          );

          return AnimatedBoxSpecWidget(
            spec: FlexContainer.box,
            duration: animatedStyle?.animated.duration ?? Duration.zero,
            curve: animatedStyle?.animated.curve ?? Curves.easeInOut,
            child: FlexContainer.flex(
              direction: Axis.vertical,
              children: widget.items
                  .map(
                    (item) => Pressable(
                      onPress: () {
                        widget.onChanged(item.value);
                        closeMenu();
                      },
                      child: SpecBuilder(
                        style: appliedStyle,
                        builder: (context) {
                          return item.child;
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
      onTapOutside: closeMenu,
      showOverlay: _menuStateController.selected,
      animationDuration: animatedStyle?.animated.duration ?? Duration.zero,
      link: _link,
    );
  }
}
