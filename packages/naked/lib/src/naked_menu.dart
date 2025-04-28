import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naked/naked.dart';

/// A fully customizable menu with no default styling.
///
/// NakedMenu provides interaction behavior and accessibility features
/// for a dropdown menu without imposing any visual styling,
/// giving consumers complete control over appearance through direct state callbacks.
///
/// This component uses [NakedPortal] to render menu content in the app overlay,
/// ensuring proper z-index and maintaining context inheritance across the component tree.
///
/// Example:
/// ```dart
/// NakedMenu(
///   child: NakedButton(
///     onPressed: () => setState(() => isOpen = !isOpen),
///     child: Text('Open Menu'),
///   ),
///   menu: NakedMenuContent(
///     child: Column(
///       children: [
///         NakedMenuItem(
///           onPressed: () => print('Item 1'),
///           child: Text('Item 1'),
///         ),
///         NakedMenuItem(
///           onPressed: () => print('Item 2'),
///           child: Text('Item 2'),
///         ),
///       ],
///     ),
///   ),
///   open: isOpen,
///   onMenuClose: () => setState(() => isOpen = false),
///   menuAlignment: AlignmentPair(
///     target: Alignment.bottomLeft,
///     follower: Alignment.topLeft,
///   ),
///   offset: Offset(0, 4),
/// )
/// ```
///
/// The menu can be controlled through the [open] property and [onMenuClose] callback.
/// When open, the menu content will be positioned relative to the target using [menuAlignment]
/// and [offset]. If the menu doesn't fit in the preferred position, it will try the positions
/// specified in [fallbackAlignments].
///
/// Focus management and keyboard navigation are handled automatically. The menu can be closed
/// by pressing Escape, clicking outside (if [closeOnClickOutside] is true), or selecting an
/// item (if [closeOnSelect] is true). When opened, focus is automatically moved to the menu
/// content if [autofocus] is true.
///
/// For accessibility, the menu supports screen readers and keyboard navigation. The [semanticLabel]
/// property can be used to provide a description of the menu's purpose. The menu can be disabled
/// using the [enabled] property, which will prevent all interactions.
///
/// The menu content should be wrapped in a [NakedMenuContent] widget, which handles click-outside
/// behavior and proper event handling. Menu items should use [NakedMenuItem] which provides
/// proper interaction states and accessibility features.
class NakedMenu extends StatefulWidget {
  /// The target widget that triggers the menu.
  /// This is typically a button or other interactive element.
  final Widget child;

  /// The menu widget to display when open.
  /// This should be wrapped in a [NakedMenuContent].
  final Widget menu;

  /// Whether the menu is currently open.
  final bool open;

  /// Called when the menu should open or close.
  final VoidCallback? onMenuClose;

  /// Whether the menu is enabled and can be interacted with.
  final bool enabled;

  /// Optional semantic label for accessibility.
  /// Provides a description of the menu's purpose for screen readers.
  final String? semanticLabel;

  /// Whether to close the menu when an item is selected.
  final bool closeOnSelect;

  // /// Whether to trap focus within the menu when open.
  // /// When true, focus will cycle through menu items and not escape to other elements.
  // final bool trapFocus;

  /// Whether to automatically focus the menu when opened.
  final bool autofocus;

  /// Offset from the target position.
  /// This can be used to create spacing between the target and menu.
  final Offset offset;

  /// The alignment of the menu relative to its target.
  /// Specifies how the menu should be positioned.
  final AlignmentPair menuAlignment;

  /// Fallback alignments to try if the menu doesn't fit in the preferred position.
  /// The menu will try each alignment in order until it finds one that fits.
  final List<AlignmentPair> fallbackAlignments;

  /// Create a naked menu.
  ///
  /// The [child] and [menu] parameters are required.
  /// The [child] is the widget that triggers the menu (typically a button).
  /// The [menu] is the content to display when open.
  const NakedMenu({
    super.key,
    required this.child,
    required this.menu,
    this.open = false,
    this.onMenuClose,
    this.enabled = true,
    this.semanticLabel,
    this.closeOnSelect = true,
    // this.trapFocus = true,
    this.autofocus = true,
    this.offset = const Offset(0, 4),
    this.menuAlignment = const AlignmentPair(
      target: Alignment.bottomLeft,
      follower: Alignment.topLeft,
    ),
    this.fallbackAlignments = const [
      AlignmentPair(
        target: Alignment.topLeft,
        follower: Alignment.bottomLeft,
        offset: Offset(0, -8),
      ),
    ],
  });

  @override
  State<NakedMenu> createState() => _NakedMenuState();
}

class _NakedMenuState extends State<NakedMenu> {
  final _overlayController = OverlayPortalController();
  final _focusScopeNode = FocusScopeNode();

  @override
  void initState() {
    super.initState();
    handleOpen();
  }

  @override
  void dispose() {
    _focusScopeNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(NakedMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.open == oldWidget.open) return;
    handleOpen();
  }

  void handleOpen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.open) {
        _overlayController.show();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _focusScopeNode.requestFocus();
        });
      } else {
        _overlayController.hide();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      explicitChildNodes: true,
      container: true,
      label: widget.semanticLabel,
      child: NakedPortal(
        alignment: AlignmentPair(
          target: widget.menuAlignment.target,
          follower: widget.menuAlignment.follower,
          offset: widget.offset,
        ),
        fallbackAlignments: widget.fallbackAlignments,
        controller: _overlayController,
        overlayChildBuilder: (context) {
          return FocusScope(
            onKeyEvent: (node, event) {
              if (event is KeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.escape) {
                _overlayController.hide();
                widget.onMenuClose?.call();
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            },
            node: _focusScopeNode,
            child: widget.menu,
          );
        },
        child: widget.child,
      ),
    );
  }
}

/// A container for menu items that handles click-outside behavior.
///
/// This component should wrap the menu content to enable closing the menu
/// when clicking outside. It also provides proper event handling and
/// positioning for the menu items.
class NakedMenuContent extends StatefulWidget {
  /// The menu content to display.
  /// This should contain the menu items and any other menu content.
  final Widget child;

  /// Whether to close the menu when clicking outside.
  final bool closeOnClickOutside;

  /// Creates a naked menu content container.
  ///
  /// The [child] parameter is required and should contain the menu items.
  const NakedMenuContent({
    super.key,
    required this.child,
    this.closeOnClickOutside = true,
  });

  @override
  State<NakedMenuContent> createState() => _NakedMenuContentState();
}

enum _GlobalRouteEvent {
  add,
  remove;
}

class _NakedMenuContentState extends State<NakedMenuContent> {
  late final _NakedMenuState? menuState =
      context.findAncestorStateOfType<_NakedMenuState>();

  @override
  void initState() {
    super.initState();
    _handlePointerDown(_GlobalRouteEvent.add);
  }

  @override
  void dispose() {
    _handlePointerDown(_GlobalRouteEvent.remove);
    super.dispose();
  }

  void _handlePointerDown(
    _GlobalRouteEvent eventType,
  ) {
    if (!widget.closeOnClickOutside) return;

    if (eventType == _GlobalRouteEvent.add) {
      WidgetsBinding.instance.pointerRouter.addGlobalRoute(handlePointerDown);
    } else {
      WidgetsBinding.instance.pointerRouter
          .removeGlobalRoute(handlePointerDown);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void handlePointerDown(PointerEvent event) {
    if (event is! PointerDownEvent) return;

    final contentRenderBox = context.findRenderObject() as RenderBox?;
    if (contentRenderBox == null) return;

    final menuPosition = contentRenderBox.localToGlobal(Offset.zero);
    final menuSize = contentRenderBox.size;
    final menuRect = menuPosition & menuSize;

    if (menuRect.contains(event.position)) return;
    menuState?._overlayController.hide();
    menuState?.widget.onMenuClose?.call();
  }
}

/// An individual menu item that can be selected.
///
/// This component provides interaction states (hover, press, focus) and
/// accessibility features for menu items. It handles keyboard navigation
/// and screen reader support.
class NakedMenuItem extends StatelessWidget {
  /// The content to display in the menu item.
  final Widget child;

  /// Called when the hover state changes.
  /// Can be used to update visual feedback.
  final ValueChanged<bool>? onHoverState;

  /// Called when the pressed state changes.
  /// Can be used to update visual feedback.
  final ValueChanged<bool>? onPressedState;

  /// Called when the focus state changes.
  /// Can be used to update visual feedback.
  final ValueChanged<bool>? onFocusState;

  /// Called when the item is selected.
  final VoidCallback? onPressed;

  /// Whether the item is enabled and can be selected.
  final bool enabled;

  /// Optional semantic label for accessibility.
  /// Provides a description of the item's purpose for screen readers.
  final String? semanticLabel;

  /// The cursor to show when hovering over the item.
  final MouseCursor cursor;

  /// Whether to provide haptic feedback when selecting the item.
  final bool enableHapticFeedback;

  /// Optional focus node to control focus behavior.
  final FocusNode? focusNode;

  /// Creates a naked menu item.
  ///
  /// The [child] parameter is required and represents the item's content.
  /// Use [onPressed] to handle selection, and the state callbacks
  /// ([onHoverState], [onPressedState], [onFocusState]) to customize appearance.
  const NakedMenuItem({
    super.key,
    required this.child,
    this.onHoverState,
    this.onPressedState,
    this.onFocusState,
    this.onPressed,
    this.enabled = true,
    this.semanticLabel,
    this.cursor = SystemMouseCursors.click,
    this.enableHapticFeedback = true,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final menuState = context.findAncestorStateOfType<_NakedMenuState>();

    void onPress() {
      if (!enabled) return;
      if (enableHapticFeedback) {
        HapticFeedback.lightImpact();
      }
      onPressed?.call();
      if (menuState != null && menuState.widget.closeOnSelect) {
        menuState._overlayController.hide();
        menuState.widget.onMenuClose?.call();
      }
    }

    return Semantics(
      button: true,
      enabled: enabled,
      label: semanticLabel,
      onTap: enabled ? onPress : null,
      excludeSemantics: true,
      child: Focus(
        focusNode: focusNode,
        onFocusChange: onFocusState,
        onKeyEvent: (node, event) {
          if (!enabled) return KeyEventResult.ignored;

          if (event is KeyDownEvent &&
              (event.logicalKey == LogicalKeyboardKey.space ||
                  event.logicalKey == LogicalKeyboardKey.enter)) {
            onPressedState?.call(true);
            return KeyEventResult.handled;
          } else if (event is KeyUpEvent &&
              (event.logicalKey == LogicalKeyboardKey.space ||
                  event.logicalKey == LogicalKeyboardKey.enter)) {
            onPressedState?.call(false);
            onPress();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: MouseRegion(
          cursor: enabled ? cursor : SystemMouseCursors.forbidden,
          onEnter: enabled ? (_) => onHoverState?.call(true) : null,
          onExit: enabled ? (_) => onHoverState?.call(false) : null,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: enabled ? (_) => onPressedState?.call(true) : null,
            onTapUp: enabled ? (_) => onPressedState?.call(false) : null,
            onTapCancel: enabled ? () => onPressedState?.call(false) : null,
            onTap: enabled ? onPress : null,
            child: child,
          ),
        ),
      ),
    );
  }
}
