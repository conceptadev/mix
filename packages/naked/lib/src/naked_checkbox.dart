import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naked/src/utilities/naked_focus_manager.dart';

/// A fully customizable checkbox with no default styling.
///
/// NakedCheckbox provides core interaction behavior and accessibility
/// without imposing any visual styling, giving consumers complete design freedom.
/// It integrates with [NakedFocusManager] to provide enhanced keyboard accessibility
/// and focus management including:
///
/// - Space/Enter key toggling
/// - Focus restoration
/// - Improved screen reader announcements
///
/// This component uses direct callbacks for state changes instead of managing its
/// own state, giving consumers control over their state management approach.
///
/// Example:
/// ```dart
/// class MyCheckbox extends StatefulWidget {
///   @override
///   _MyCheckboxState createState() => _MyCheckboxState();
/// }
///
/// class _MyCheckboxState extends State<MyCheckbox> {
///   bool _isChecked = false;
///   bool _isHovered = false;
///   bool _isPressed = false;
///   bool _isFocused = false;
///
///   @override
///   Widget build(BuildContext context) {
///     return NakedCheckbox(
///       isChecked: _isChecked,
///       onChanged: (value) {
///         setState(() {
///           _isChecked = value;
///         });
///       },
///       onStateHover: (isHovered) => setState(() => _isHovered = isHovered),
///       onStatePressed: (isPressed) => setState(() => _isPressed = isPressed),
///       onStateFocus: (isFocused) => setState(() => _isFocused = isFocused),
///       child: Container(
///         height: 20,
///         width: 20,
///         decoration: BoxDecoration(
///           border: Border.all(
///             color: _isFocused
///                 ? Colors.blue.shade400
///                 : _isHovered || _isPressed
///                     ? Colors.blue.shade300
///                     : Colors.grey.shade300,
///             width: 2,
///           ),
///           borderRadius: BorderRadius.circular(4),
///           color: _isChecked ? Colors.blue.shade500 : Colors.transparent,
///         ),
///         child: _isChecked
///             ? Icon(
///                 Icons.check,
///                 size: 16,
///                 color: Colors.white,
///               )
///             : null,
///       ),
///     );
///   }
/// }
/// ```
class NakedCheckbox extends StatelessWidget {
  /// The child widget to display.
  ///
  /// This widget should represent the visual appearance of the checkbox.
  /// You're responsible for rendering different visual states based on
  /// the callback properties (isChecked, onStateHover, etc.).
  final Widget child;

  /// Whether the checkbox is checked.
  ///
  /// Use this to control the checked state of the checkbox.
  /// The checkbox will not change this value on its own.
  final bool isChecked;

  /// Whether the checkbox is in an indeterminate state.
  ///
  /// When true, the checkbox will be rendered in an indeterminate state,
  /// visually distinct from both checked and unchecked states.
  /// Typically used for representing partially selected states in hierarchical checkbox groups.
  final bool isIndeterminate;

  /// Called when the checkbox is toggled.
  ///
  /// The callback provides the new state of the checkbox (true for checked, false for unchecked).
  /// If null, the checkbox will be considered disabled and will not respond to user interaction.
  final ValueChanged<bool>? onChanged;

  /// Called when hover state changes.
  ///
  /// The callback provides the current hover state (true when hovered, false otherwise).
  /// Use this to update the visual appearance when the user hovers over the checkbox.
  final ValueChanged<bool>? onStateHover;

  /// Called when pressed state changes.
  ///
  /// The callback provides the current pressed state (true when pressed, false otherwise).
  /// Use this to update the visual appearance when the user presses on the checkbox.
  final ValueChanged<bool>? onStatePressed;

  /// Called when focus state changes.
  ///
  /// The callback provides the current focus state (true when focused, false otherwise).
  /// Use this to update the visual appearance when the checkbox receives or loses focus.
  final ValueChanged<bool>? onStateFocus;

  /// Whether the checkbox is disabled.
  ///
  /// When true, the checkbox will not respond to user interaction
  /// and should be styled accordingly.
  final bool isDisabled;

  /// Optional semantic label for accessibility.
  ///
  /// Provides a description of the checkbox's purpose for screen readers.
  /// If not provided, screen readers will use a default description.
  final String? semanticLabel;

  /// The cursor to show when hovering over the checkbox.
  ///
  /// Defaults to [SystemMouseCursors.click] when enabled,
  /// or [SystemMouseCursors.forbidden] when disabled.
  final MouseCursor cursor;

  /// Whether to provide haptic feedback on tap.
  ///
  /// When true (the default), the device will produce a haptic feedback effect
  /// when the checkbox is toggled.
  final bool enableHapticFeedback;

  /// Optional focus node to control focus behavior.
  ///
  /// If not provided, the checkbox will create its own focus node.
  final FocusNode? focusNode;

  /// Called when the escape key is pressed while the checkbox has focus.
  ///
  /// This can be used to implement custom escape key handling, such as
  /// closing a dialog or reverting to a previous state.
  final VoidCallback? onEscapePressed;

  /// Creates a naked checkbox.
  ///
  /// The [child] parameter is required and represents the visual appearance
  /// of the checkbox in all states.
  const NakedCheckbox({
    super.key,
    required this.child,
    this.isChecked = false,
    this.isIndeterminate = false,
    this.onChanged,
    this.onStateHover,
    this.onStatePressed,
    this.onStateFocus,
    this.isDisabled = false,
    this.semanticLabel,
    this.cursor = SystemMouseCursors.click,
    this.enableHapticFeedback = true,
    this.focusNode,
    this.onEscapePressed,
  }) : assert(!(isChecked && isIndeterminate),
            'Checkbox cannot be both checked and indeterminate');

  @override
  Widget build(BuildContext context) {
    final isInteractive = !isDisabled && onChanged != null;
    final effectiveFocusNode = focusNode ?? FocusNode();

    // Gets the current state of the checkbox
    bool? getCurrentValue() {
      if (isIndeterminate) return null;
      return isChecked;
    }

    // Toggle functionality
    void toggleValue() {
      if (!isInteractive) return;

      if (enableHapticFeedback) {
        HapticFeedback.selectionClick();
      }

      // Calculate the next state:
      // - If null (indeterminate), go to true (checked)
      // - If false (unchecked), go to true (checked)
      // - If true (checked), go to false (unchecked)
      final currentValue = getCurrentValue();
      final bool newValue;

      if (currentValue == null) {
        newValue = true;
      } else {
        newValue = !currentValue;
      }

      onChanged?.call(newValue);
    }

    return Semantics(
      checked: isChecked,
      toggled: isIndeterminate,
      enabled: isInteractive,
      label: semanticLabel,
      onTap: isInteractive ? toggleValue : null,
      excludeSemantics: true,
      child: NakedFocusManager(
        restoreFocus: true, // Good UX to restore focus when removed
        autofocus: false, // Let the consumer control autofocus
        onEscapePressed: onEscapePressed,
        child: Focus(
          focusNode: effectiveFocusNode,
          onFocusChange: onStateFocus,
          onKeyEvent: (node, event) {
            if (!isInteractive) return KeyEventResult.ignored;

            if (event is KeyDownEvent &&
                (event.logicalKey == LogicalKeyboardKey.space ||
                    event.logicalKey == LogicalKeyboardKey.enter)) {
              onStatePressed?.call(true);
              return KeyEventResult.handled;
            } else if (event is KeyUpEvent &&
                (event.logicalKey == LogicalKeyboardKey.space ||
                    event.logicalKey == LogicalKeyboardKey.enter)) {
              onStatePressed?.call(false);
              toggleValue();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: MouseRegion(
            cursor: isInteractive ? cursor : SystemMouseCursors.forbidden,
            onEnter: isInteractive ? (_) => onStateHover?.call(true) : null,
            onExit: isInteractive ? (_) => onStateHover?.call(false) : null,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown:
                  isInteractive ? (_) => onStatePressed?.call(true) : null,
              onTapUp:
                  isInteractive ? (_) => onStatePressed?.call(false) : null,
              onTapCancel:
                  isInteractive ? () => onStatePressed?.call(false) : null,
              onTap: isInteractive ? toggleValue : null,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
