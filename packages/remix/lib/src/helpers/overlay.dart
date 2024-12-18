import 'dart:async';

import 'package:flutter/material.dart';

class OverlayWrapper extends StatefulWidget {
  const OverlayWrapper({
    super.key,
    required this.target,
    required this.overlayChild,
    this.offset = const Offset(0, 4),
    this.targetAnchor = Alignment.bottomCenter,
    this.followerAnchor = Alignment.topCenter,
    this.controller,
    this.onTapOutside,
    this.showOverlay = true,
    this.animationDuration = const Duration(),
    required this.link,
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
  final OverlayPortalController? controller;

  /// Whether the overlay should be shown.
  final bool showOverlay;

  final VoidCallback? onTapOutside;

  final Duration animationDuration;

  final LayerLink link;

  @override
  State<OverlayWrapper> createState() => OverlayWrapperState();
}

class OverlayWrapperState extends State<OverlayWrapper> {
  OverlayPortalController? _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? OverlayPortalController();

    if (widget.showOverlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller!.show();
      });
    }
  }

  @override
  void didUpdateWidget(OverlayWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.showOverlay == oldWidget.showOverlay) return;
    if (widget.showOverlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller!.show();
      });
    } else {
      if (_timer != null) {
        _timer!.cancel();
      }
      _timer = Timer(widget.animationDuration, () {
        _controller!.hide();
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: widget.link,
      child: OverlayPortal(
        controller: _controller!,
        overlayChildBuilder: (BuildContext context) {
          return Stack(children: [
            if (widget.onTapOutside != null)
              GestureDetector(
                onTap: widget.onTapOutside,
                child: Container(color: Colors.transparent),
              ),
            CompositedTransformFollower(
              link: widget.link,
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
