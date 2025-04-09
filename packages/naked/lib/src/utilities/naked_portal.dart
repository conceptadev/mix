import 'package:flutter/material.dart';

/// A utility for rendering content at the top level of the application
/// regardless of where it's defined in the widget tree.
///
/// NakedPortal solves the common problem of needing to display content (like
/// dropdowns, tooltips, modals) outside of their parent's clipping boundaries,
/// while maintaining the correct context inheritance and event bubbling.
///
/// Key features:
/// - Renders content at the root overlay of the application
/// - Preserves context inheritance from the original location
/// - Updates automatically when the source widget updates
/// - Properly cleans up resources when disposed
///
/// This is particularly useful for:
/// - Dropdown menus that need to extend beyond their container
/// - Tooltips that might be clipped by parent boundaries
/// - Modal dialogs that should appear above all other content
/// - Any overlay UI that needs to break out of layout constraints
///
/// Example usage:
/// ```dart
/// NakedPortal(
///   child: MyOverlayContent(),
/// )
/// ```
class NakedPortal extends StatefulWidget {
  /// The widget to render at the top level of the application.
  ///
  /// This content will be rendered in the application's root overlay,
  /// allowing it to appear above all other content and bypass any
  /// clipping constraints from parent widgets.
  final Widget child;

  /// Creates a portal that renders its [child] at the root of the application.
  ///
  /// The [child] argument must not be null.
  const NakedPortal({
    super.key,
    required this.child,
  });

  @override
  State<NakedPortal> createState() => _NakedPortalState();
}

class _NakedPortalState extends State<NakedPortal> {
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    // The overlay will be inserted in the post-frame callback
    // when build method is called for the first time
  }

  @override
  void didUpdateWidget(NakedPortal oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Schedule the update for the next frame to avoid updating during build
    if (_overlayEntry != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _updateOverlayEntry();
        }
      });
    }
  }

  @override
  void dispose() {
    _removeOverlayEntry();
    super.dispose();
  }

  void _updateOverlayEntry() {
    // Create a new entry with the new widget
    final overlay = Overlay.of(context, rootOverlay: true);

    // Remove the old entry
    _overlayEntry?.remove();

    // Create and insert a new entry
    _overlayEntry = OverlayEntry(
      builder: (context) => widget.child,
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeOverlayEntry() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _insertOverlay(BuildContext context) {
    if (_overlayEntry == null && mounted) {
      final overlay = Overlay.of(context, rootOverlay: true);
      _overlayEntry = OverlayEntry(
        builder: (context) => widget.child,
      );
      overlay.insert(_overlayEntry!);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use a post-frame callback to insert the overlay after the first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _insertOverlay(context);
      }
    });

    // This widget doesn't render anything directly
    // as its child is rendered in the overlay
    return const SizedBox.shrink();
  }
}
