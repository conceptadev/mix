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
///       onHoverState: (isHovered) => setState(() => _isHovered = isHovered),
///       onPressedState: (isPressed) => setState(() => _isPressed = isPressed),
///       onFocusState: (isFocused) => setState(() => _isFocused = isFocused),
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
///
/// See also:
///
///  * [NakedRadio], a component that allows users to select one option from a set.
///  * [NakedSwitch], a component that allows users to toggle between two states.
///  * The Flutter `Checkbox` widget, which provides a similar functionality with
///    Material Design styling.
///  * The Naked library documentation for more examples and customization options.
class NakedCheckbox extends StatelessWidget {
  /// The child widget to display.
  ///
  /// This widget should represent the visual appearance of the checkbox.
  /// You're responsible for rendering different visual states based on
  /// the callback properties (isChecked, onHoverState, etc.).
  final Widget child;

  /// Whether the checkbox is checked.
  ///
  /// Use this to control the checked state of the checkbox.
  /// The checkbox will not change this value on its own.
  final bool checked;

  /// Whether the checkbox is in an indeterminate state.
  ///
  /// When true, the checkbox will be rendered in an indeterminate state,
  /// visually distinct from both checked and unchecked states.
  /// Typically used for representing partially selected states in hierarchical checkbox groups.
  final bool indeterminate;

  /// Called when the checkbox is toggled.
  ///
  /// The callback provides the new state of the checkbox (true for checked, false for unchecked).
  /// If null, the checkbox will be considered disabled and will not respond to user interaction.
  final ValueChanged<bool>? onChanged;

  /// Callback triggered when the checkbox's hover state changes.
  ///
  /// Passes `true` when the pointer enters the checkbox bounds, and `false`
  /// when it exits. Useful for implementing hover effects.
  final ValueChanged<bool>? onHoverState;

  /// Callback triggered when the checkbox is pressed or released.
  ///
  /// Passes `true` when the checkbox is pressed down, and `false` when released.
  /// Useful for implementing press effects.
  final ValueChanged<bool>? onPressedState;

  /// Callback triggered when the checkbox gains or loses focus.
  ///
  /// Passes `true` when the checkbox gains focus, and `false` when it loses focus.
  /// Useful for implementing focus indicators.
  final ValueChanged<bool>? onFocusState;

  /// Whether the checkbox is disabled.
  ///
  /// When true, the checkbox will not respond to user interaction
  /// and should be styled accordingly.
  final bool enabled;

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
    this.checked = false,
    this.indeterminate = false,
    this.onChanged,
    this.onHoverState,
    this.onPressedState,
    this.onFocusState,
    this.enabled = true,
    this.semanticLabel,
    this.cursor = SystemMouseCursors.click,
    this.enableHapticFeedback = true,
    this.focusNode,
    this.onEscapePressed,
  }) : assert(!(checked && indeterminate),
            'Checkbox cannot be both checked and indeterminate');

  @override
  Widget build(BuildContext context) {
    final isInteractive = enabled && onChanged != null;
    final effectiveFocusNode = focusNode ?? FocusNode();

    // Gets the current state of the checkbox
    bool? getCurrentValue() {
      if (indeterminate) return null;
      return checked;
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
      checked: checked,
      toggled: indeterminate,
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
          onFocusChange: onFocusState,
          onKeyEvent: (node, event) {
            if (!isInteractive) return KeyEventResult.ignored;

            if (event is KeyDownEvent &&
                (event.logicalKey == LogicalKeyboardKey.space ||
                    event.logicalKey == LogicalKeyboardKey.enter)) {
              onPressedState?.call(true);
              return KeyEventResult.handled;
            } else if (event is KeyUpEvent &&
                (event.logicalKey == LogicalKeyboardKey.space ||
                    event.logicalKey == LogicalKeyboardKey.enter)) {
              onPressedState?.call(false);
              toggleValue();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: MouseRegion(
            cursor: isInteractive ? cursor : SystemMouseCursors.forbidden,
            onEnter: isInteractive ? (_) => onHoverState?.call(true) : null,
            onExit: isInteractive ? (_) => onHoverState?.call(false) : null,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown:
                  isInteractive ? (_) => onPressedState?.call(true) : null,
              onTapUp:
                  isInteractive ? (_) => onPressedState?.call(false) : null,
              onTapCancel:
                  isInteractive ? () => onPressedState?.call(false) : null,
              onTap: isInteractive ? toggleValue : null,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
