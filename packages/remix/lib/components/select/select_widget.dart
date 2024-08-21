part of 'select.dart';

typedef XSelectButtonBuilder = XComponentBuilder<SelectButtonSpec>;
typedef XSelectMenuBuilder = XComponentBuilder<SelectMenuSpec>;

class XSelectMenuItem<T> {
  final T value;
  final Widget child;

  const XSelectMenuItem({required this.value, required this.child});
}

class XSelect<T> extends StatefulWidget {
  const XSelect({
    super.key,
    required this.value,
    required this.onChanged,
    required this.button,
    required this.items,
    this.style = const Style.empty(),
  }) : _blank = false;

  const XSelect.blank({
    super.key,
    required this.value,
    required this.onChanged,
    required this.button,
    required this.items,
    required this.style,
  }) : _blank = true;

  final T value;
  final Style style;
  final ValueChanged<T> onChanged;
  final XSelectButtonBuilder button;

  final List<XSelectMenuItem<T>> items;
  final bool _blank;

  @override
  State<XSelect> createState() => XSelectState<T>();
}

class XSelectState<T> extends State<XSelect<T>>
    with SingleTickerProviderStateMixin {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  late final MixWidgetStateController _stateController;

  final _baseAnimation = (
    duration: const Duration(milliseconds: 100),
    curve: Curves.decelerate,
  );

  final _link = LayerLink();

  @override
  void initState() {
    super.initState();

    _stateController = MixWidgetStateController();
    _stateController.selected = false;
  }

  @override
  void dispose() {
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style:
          widget._blank ? widget.style : XSelectStyle.base.merge(widget.style),
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
                    controller: _stateController,
                    style: widget._blank
                        ? widget.style
                        : XSelectStyle.base.animate(
                            duration: _baseAnimation.duration,
                            curve: _baseAnimation.curve,
                            onEnd: () {
                              if (_stateController.selected == false) {
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
                            return Pressable(
                              onPress: () {
                                widget.onChanged(item.value);
                                hide();
                              },
                              child: SpecBuilder(
                                style: widget._blank
                                    ? widget.style
                                    : XSelectStyle.base
                                        .merge(widget.style)
                                        .animate(
                                          duration: _baseAnimation.duration,
                                          curve: _baseAnimation.curve,
                                        ),
                                builder: (context) {
                                  return item.child;
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
            child: Pressable(onPress: onTap, child: widget.button(button)),
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
      _stateController.selected = true;
    });
  }

  void hide() {
    _stateController.selected = false;
  }

  void onTap() {
    if (!_tooltipController.isShowing) {
      show();
    } else {
      hide();
    }
  }
}
