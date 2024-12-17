import 'package:flutter/widgets.dart';

class OverlayWrapper extends StatefulWidget {
  const OverlayWrapper({
    super.key,
    required this.target,
    required this.overlayChild,
    this.offset = const Offset(0, 4),
    this.targetAnchor = Alignment.bottomCenter,
    this.followerAnchor = Alignment.topCenter,
    required this.controller,
    this.onPressOutside,
  });

  /// The trigger widget that opens the dropdown menu.
  /// It is a builder that returns a widget and a callback to open the menu
  final Widget target;

  /// The widget that will be displayed when the overlay is shown.
  final Widget overlayChild;

  /// The offset of the dropdown menu relative to the trigger widget.
  final Offset offset;

  /// The anchor point on the trigger widget that the dropdown menu should be aligned to.
  final Alignment targetAnchor;

  /// The anchor point on the dropdown menu that the trigger widget should be aligned to.
  final Alignment followerAnchor;

  /// The controller that controls the overlay.
  final OverlayPortalController controller;

  final VoidCallback? onPressOutside;

  @override
  State<OverlayWrapper> createState() => DropdownMenuState();
}

class DropdownMenuState extends State<OverlayWrapper>
    with SingleTickerProviderStateMixin {
  final OverlayPortalController _tooltipController = OverlayPortalController();

  final _link = LayerLink();

  void show() {
    if (!_tooltipController.isShowing) {
      _tooltipController.show();
    }

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _menuStateController.selected = true;
    // });
  }

  // void hide() {
  //   _menuStateController.selected = false;
  // }

  // void onTap() {
  //   if (!_tooltipController.isShowing) {
  //     show();
  //   } else {
  //     hide();
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   _menuStateController = MixWidgetStateController()..selected = false;
  // }

  // @override
  // void dispose() {
  //   _menuStateController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _tooltipController,
        overlayChildBuilder: (BuildContext context) {
          return Stack(children: [
            // GestureDetector(
            //   onTap: () => hide(),
            //   child: Container(color: Colors.transparent),
            // ),
            CompositedTransformFollower(
              link: _link,
              offset: widget.offset,
              targetAnchor: widget.targetAnchor,
              followerAnchor: widget.followerAnchor,
              child: widget.overlayChild,
            ),
          ]);
        },
        child: RepaintBoundary(child: widget.target),
      ),
    );
  }
}
