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
    required this.button,
    required this.items,
    this.variants = const [],
    this.style,
    this.disabled = false,
  });

  final T value;
  final SelectStyle? style;
  final List<Variant> variants;
  final ValueChanged<T> onChanged;
  final WidgetSpecBuilder<SelectButtonSpec> button;
  final bool disabled;

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
                  child: Container(color: Colors.transparent),
                  onTap: () => hide(),
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
                          children: widget.items.map((item) {
                            return Pressable(
                              child: SpecBuilder(
                                style: appliedStyle.animate(
                                  duration: _baseAnimation.duration,
                                  curve: _baseAnimation.curve,
                                ),
                                builder: (context) {
                                  return item.child;
                                },
                              ),
                              onPress: () {
                                widget.onChanged(item.value);
                                hide();
                              },
                            );
                          }).toList(),
                          direction: Axis.vertical,
                        ),
                      );
                    },
                  ),
                ),
              ]);
            },
            child: RepaintBoundary(
              child: Pressable(
                child: widget.button(button),
                enabled: !widget.disabled,
                onPress: onTap,
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
