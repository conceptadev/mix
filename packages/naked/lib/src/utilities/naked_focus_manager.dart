import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A utility component for managing focus within widgets.
///
/// NakedFocusManager simplifies focus management for complex interactive widgets
/// by providing a unified API for common focus-related behaviors. It handles keyboard
/// interactions, accessibility navigation, and focus state management in a consistent way.
///
/// Key capabilities:
/// - **Focus trapping:** Keeps focus within a specific subtree (useful for modals, dialogs)
/// - **Focus restoration:** Returns focus to the previous element when the widget is removed
/// - **Keyboard navigation:** Handles common keyboard interactions like Escape key
/// - **Initial focus setting:** Automatically focuses the first interactive element
///
/// This component enhances accessibility by ensuring proper keyboard navigation
/// behavior, making widgets more usable for screen reader users and keyboard-only
/// navigation.
///
/// Example usage in a modal dialog:
/// ```dart
/// NakedFocusManager(
///   trapFocus: true,
///   restoreFocus: true,
///   autofocus: true,
///   onEscapePressed: () => Navigator.of(context).pop(),
///   child: Dialog(
///     // Dialog content
///   ),
/// )
/// ```
class NakedFocusManager extends StatefulWidget {
  /// The widget below this widget in the tree.
  ///
  /// This is the content that will have focus management applied to it.
  /// Typically includes interactive elements like buttons, form fields, etc.
  final Widget child;

  /// Whether focus should be trapped within this widget's subtree.
  ///
  /// When true, focus traversal (using Tab key) will be restricted to descendants
  /// of this widget, preventing focus from leaving the component. This is particularly
  /// useful for modals, dialogs, and other overlay UI where focus should remain
  /// contained until the UI is dismissed.
  final bool trapFocus;

  /// Whether focus should be restored to the previously focused widget when this
  /// widget is removed from the tree.
  ///
  /// When true, the component will track which widget had focus before it gained
  /// focus, and restore focus to that widget when this component is disposed.
  /// This ensures a smooth focus transition when temporary UI elements are removed.
  final bool restoreFocus;

  /// Whether to automatically focus the first focusable element when the widget is built.
  ///
  /// When true, the component will request focus for the first focusable descendant
  /// after it's built. This is useful for immediately directing user attention to
  /// an important UI element.
  final bool autofocus;

  /// Called when the escape key is pressed.
  ///
  /// This callback enables easy implementation of escape key handling, which is
  /// commonly used to close dialogs, dismiss popovers, or cancel operations.
  /// If not provided, escape key presses will be ignored.
  final VoidCallback? onEscapePressed;

  /// Creates a focus manager that handles common focus-related behaviors.
  ///
  /// The [child] argument must not be null.
  const NakedFocusManager({
    super.key,
    required this.child,
    this.trapFocus = false,
    this.restoreFocus = false,
    this.autofocus = false,
    this.onEscapePressed,
  });

  @override
  State<NakedFocusManager> createState() => _NakedFocusManagerState();
}

class _NakedFocusManagerState extends State<NakedFocusManager> {
  late final FocusScopeNode _focusScopeNode;
  FocusNode? _previousFocus;

  @override
  void initState() {
    super.initState();
    _focusScopeNode = FocusScopeNode(
      skipTraversal: !widget.trapFocus,
      canRequestFocus: true,
    );

    if (widget.restoreFocus) {
      _previousFocus = FocusManager.instance.primaryFocus;
    }

    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _focusScopeNode.requestFocus();
        }
      });
    }
  }

  @override
  void dispose() {
    if (widget.restoreFocus &&
        _previousFocus != null &&
        _previousFocus!.canRequestFocus) {
      _previousFocus!.requestFocus();
    }
    _focusScopeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      node: _focusScopeNode,
      child: Focus(
        canRequestFocus: false,
        skipTraversal: true,
        onKeyEvent: (node, event) {
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.escape &&
              widget.onEscapePressed != null) {
            widget.onEscapePressed!();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: widget.trapFocus
            ? FocusTraversalGroup(
                child: widget.child,
              )
            : widget.child,
      ),
    );
  }
}
