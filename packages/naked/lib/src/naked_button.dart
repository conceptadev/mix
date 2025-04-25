import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naked/src/utilities/naked_focus_manager.dart';

/// A fully customizable button with no default styling.
///
/// NakedButton provides interaction behavior and accessibility features
/// without imposing any visual styling, giving consumers complete design freedom.
/// It integrates with [NakedFocusManager] to provide enhanced keyboard accessibility
/// and focus management.
///
/// This component handles various interaction states (hover, pressed, focused, disabled, loading)
/// and provides direct callbacks to allow consumers to manage their own visual state.
///
/// Example:
/// ```dart
/// class MyButton extends StatefulWidget {
///   @override
///   _MyButtonState createState() => _MyButtonState();
/// }
///
/// class _MyButtonState extends State<MyButton> {
///   bool _isHovered = false;
///   bool _isPressed = false;
///   bool _isFocused = false;
///
///   @override
///   Widget build(BuildContext context) {
///     return NakedButton(
///       onPressed: () {
///         print('Button pressed!');
///       },
///       onHoverState: (isHovered) => setState(() => _isHovered = isHovered),
///       onPressedState: (isPressed) => setState(() => _isPressed = isPressed),
///       onFocusState: (isFocused) => setState(() => _isFocused = isFocused),
///       child: Container(
///         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
///         decoration: BoxDecoration(
///           color: _isPressed
///               ? Colors.blue.shade700
///               : _isHovered
///                   ? Colors.blue.shade600
///                   : Colors.blue.shade500,
///           borderRadius: BorderRadius.circular(4),
///           border: Border.all(
///             color: _isFocused ? Colors.white : Colors.transparent,
///             width: 2,
///           ),
///         ),
///         child: Text(
///           'Click Me',
///           style: TextStyle(color: Colors.white),
///         ),
///       ),
///     );
///   }
/// }
/// ```
class NakedButton extends StatefulWidget {
  /// The child widget to display.
  ///
  /// This widget should represent the visual appearance of the button.
  /// You're responsible for styling this widget based on the button's state
  /// using the provided callback properties.
  final Widget child;

  /// Called when the button is tapped or activated via keyboard.
  ///
  /// If null, the button will be considered disabled and will not respond
  /// to user interaction.
  final VoidCallback? onPressed;

  /// Called when hover state changes.
  ///
  /// Provides the current hover state (true when hovered, false otherwise).
  /// Use this to update the visual appearance when the user hovers over the button.
  final ValueChanged<bool>? onHoverState;

  /// Called when pressed state changes.
  ///
  /// Provides the current pressed state (true when pressed, false otherwise).
  /// Use this to update the visual appearance when the user presses the button.
  final ValueChanged<bool>? onPressedState;

  /// Called when focus state changes.
  ///
  /// Provides the current focus state (true when focused, false otherwise).
  /// Use this to update the visual appearance when the button receives or loses focus.
  final ValueChanged<bool>? onFocusState;

  /// Whether the button is in a loading state.
  ///
  /// When true, the button will not respond to user interaction.
  /// Use this to display a loading indicator or similar visual feedback.
  final bool loading;

  /// Whether the button is disabled.
  ///
  /// When true, the button will not respond to user interaction regardless of
  /// whether [onPressed] is provided.
  final bool enabled;

  /// Optional semantic label for accessibility.
  ///
  /// Provides a description of the button's purpose for screen readers.
  /// If not provided, screen readers will use the text content of the button.
  final String? semanticLabel;

  /// The cursor to show when hovering over the button.
  ///
  /// Defaults to [SystemMouseCursors.click] when enabled,
  /// or [SystemMouseCursors.forbidden] when disabled.
  final MouseCursor cursor;

  /// Whether to provide haptic feedback on press.
  ///
  /// When true (the default), the device will produce a haptic feedback
  /// effect when the button is pressed.
  final bool enableHapticFeedback;

  /// Optional focus node to control focus behavior.
  ///
  /// If not provided, the button will create its own focus node.
  final FocusNode? focusNode;

  /// Called when the escape key is pressed while the button has focus.
  ///
  /// This can be used to cancel actions or dismiss dialogs.
  final VoidCallback? onEscapePressed;

  /// Creates a naked button.
  ///
  /// The [child] parameter is required and represents the visual appearance
  /// of the button in all states.
  const NakedButton({
    super.key,
    required this.child,
    this.onPressed,
    this.onHoverState,
    this.onPressedState,
    this.onFocusState,
    this.loading = false,
    this.enabled = true,
    this.semanticLabel,
    this.cursor = SystemMouseCursors.click,
    this.enableHapticFeedback = true,
    this.focusNode,
    this.onEscapePressed,
  });

  @override
  State<NakedButton> createState() => _NakedButtonState();
}

class _NakedButtonState extends State<NakedButton> {
  late final FocusNode effectiveFocusNode = widget.focusNode ?? FocusNode();

  @override
  void dispose() {
    if (widget.focusNode == null) {
      effectiveFocusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isInteractive =
        widget.enabled && !widget.loading && widget.onPressed != null;

    void handleTap() {
      if (isInteractive) {
        if (widget.enableHapticFeedback) {
          HapticFeedback.lightImpact();
        }
        widget.onPressed?.call();
      }
    }

    return Semantics(
      button: true,
      enabled: isInteractive,
      label: widget.semanticLabel,
      hint: widget.loading ? 'Loading' : null,
      onTap: isInteractive ? handleTap : null,
      excludeSemantics: true,
      child: Focus(
        focusNode: effectiveFocusNode,
        onFocusChange: widget.onFocusState,
        onKeyEvent: (node, event) {
          if (!isInteractive) return KeyEventResult.ignored;

          if (event is KeyDownEvent && event.logicalKey.isSpaceOrEnter) {
            widget.onPressedState?.call(true);
            return KeyEventResult.handled;
          } else if (event is KeyUpEvent && event.logicalKey.isSpaceOrEnter) {
            widget.onPressedState?.call(false);
            handleTap();
            return KeyEventResult.handled;
          } else if (event is KeyUpEvent &&
              event.logicalKey == LogicalKeyboardKey.escape) {
            widget.onEscapePressed?.call();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: MouseRegion(
          cursor: isInteractive ? widget.cursor : SystemMouseCursors.forbidden,
          onEnter:
              isInteractive ? (_) => widget.onHoverState?.call(true) : null,
          onExit:
              isInteractive ? (_) => widget.onHoverState?.call(false) : null,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown:
                isInteractive ? (_) => widget.onPressedState?.call(true) : null,
            onTapUp: isInteractive
                ? (_) => widget.onPressedState?.call(false)
                : null,
            onTapCancel:
                isInteractive ? () => widget.onPressedState?.call(false) : null,
            onTap: isInteractive ? handleTap : null,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

extension LogicalKeyboardKeyExtension on LogicalKeyboardKey {
  bool get isSpaceOrEnter =>
      this == LogicalKeyboardKey.space || this == LogicalKeyboardKey.enter;
}
