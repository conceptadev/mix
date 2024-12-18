import 'package:flutter/material.dart';

class OverlayWrapper extends StatefulWidget {
  const OverlayWrapper({
    super.key,
    required this.target,
    required this.overlayChild,
    this.offset = const Offset(0, 4),
    this.targetAnchor = Alignment.bottomCenter,
    this.followerAnchor = Alignment.topCenter,
    required this.controller,
    this.onTapOutside,
    this.showOverlay = true,
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

  /// Whether the overlay should be shown.
  final bool showOverlay;

  final VoidCallback? onTapOutside;

  @override
  State<OverlayWrapper> createState() => OverlayWrapperState();
}

class OverlayWrapperState extends State<OverlayWrapper> {
  final _link = LayerLink();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: widget.controller,
        overlayChildBuilder: (BuildContext context) {
          return Stack(children: [
            if (widget.onTapOutside != null)
              GestureDetector(
                onTap: widget.onTapOutside,
                child: Container(color: Colors.transparent),
              ),
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
