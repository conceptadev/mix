import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'naked_radio_group.dart';
import 'utilities/naked_focus_manager.dart';

/// A fully customizable radio button with no default styling.
///
/// NakedRadioButton provides interaction behavior and accessibility
/// without imposing any visual styling, allowing complete design freedom.
/// It must be used within a NakedRadioGroup to function properly.
/// It uses direct callbacks for state changes, giving consumers control over
/// their own state management.
///
/// Example:
/// ```dart
/// class MyRadioButtons extends StatefulWidget {
///   @override
///   _MyRadioButtonsState createState() => _MyRadioButtonsState();
/// }
///
/// class _MyRadioButtonsState extends State<MyRadioButtons> {
///   String? _selectedValue = 'option1';
///
///   @override
///   Widget build(BuildContext context) {
///     return NakedRadioGroup<String>(
///       value: _selectedValue,
///       onChanged: (value) {
///         setState(() {
///           _selectedValue = value;
///         });
///       },
///       child: Column(
///         children: [
///           _buildRadioOption('option1', 'Option 1'),
///           _buildRadioOption('option2', 'Option 2'),
///           _buildRadioOption('option3', 'Option 3'),
///         ],
///       ),
///     );
///   }
///
///   Widget _buildRadioOption(String value, String label) {
///     bool _isHovered = false;
///     bool _isPressed = false;
///     bool _isFocused = false;
///
///     return StatefulBuilder(
///       builder: (context, setInnerState) {
///         final isSelected = _selectedValue == value;
///
///         return Row(
///           children: [
///             NakedRadioButton<String>(
///               value: value,
///               onStateHover: (isHovered) => setInnerState(() => _isHovered = isHovered),
///               onStatePressed: (isPressed) => setInnerState(() => _isPressed = isPressed),
///               onStateFocus: (isFocused) => setInnerState(() => _isFocused = isFocused),
///               child: Container(
///                 width: 20,
///                 height: 20,
///                 decoration: BoxDecoration(
///                   shape: BoxShape.circle,
///                   border: Border.all(
///                     color: isSelected ? Colors.blue : Colors.grey,
///                     width: 2,
///                   ),
///                   color: _isPressed
///                     ? Colors.grey.shade300
///                     : _isHovered
///                       ? Colors.grey.shade100
///                       : Colors.white,
///                 ),
///                 child: Center(
///                   child: isSelected
///                     ? Container(
///                         width: 10,
///                         height: 10,
///                         decoration: BoxDecoration(
///                           shape: BoxShape.circle,
///                           color: Colors.blue,
///                         ),
///                       )
///                     : null,
///                 ),
///               ),
///             ),
///             SizedBox(width: 8),
///             Text(label),
///           ],
///         );
///       },
///     );
///   }
/// }
/// ```
class NakedRadioButton<T> extends StatefulWidget {
  /// The child widget to display.
  final Widget child;

  /// The value this radio button represents.
  ///
  /// When this value matches the group's value, this radio button is considered selected.
  final T value;

  /// Called when hover state changes.
  final ValueChanged<bool>? onStateHover;

  /// Called when pressed state changes.
  final ValueChanged<bool>? onStatePressed;

  /// Called when focus state changes.
  final ValueChanged<bool>? onStateFocus;

  /// Whether this radio button is disabled.
  ///
  /// When true, the radio button will not respond to user interaction,
  /// regardless of the group's disabled state.
  final bool isDisabled;

  /// Optional semantic label for accessibility.
  ///
  /// This is used by screen readers to describe the radio button.
  final String? semanticLabel;

  /// The cursor to show when hovering over the radio button.
  final MouseCursor cursor;

  /// Whether to provide haptic feedback on tap.
  final bool enableHapticFeedback;

  /// Optional focus node to control focus behavior.
  final FocusNode? focusNode;

  /// Creates a naked radio button.
  ///
  /// The [child] and [value] parameters are required.
  /// This component must be used within a NakedRadioGroup.
  const NakedRadioButton({
    super.key,
    required this.child,
    required this.value,
    this.onStateHover,
    this.onStatePressed,
    this.onStateFocus,
    this.isDisabled = false,
    this.semanticLabel,
    this.cursor = SystemMouseCursors.click,
    this.enableHapticFeedback = true,
    this.focusNode,
  });

  @override
  State<NakedRadioButton<T>> createState() => _NakedRadioButtonState<T>();
}

class _NakedRadioButtonState<T> extends State<NakedRadioButton<T>> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _handleTap() {
    final group = NakedRadioGroupScope.of<T>(context);

    if (group == null) {
      throw FlutterError(
        'NakedRadioButton must be used within a NakedRadioGroup.\n'
        'No NakedRadioGroup ancestor could be found for a NakedRadioButton with value: ${widget.value}',
      );
    }

    // If group is already set to this value, do nothing
    if (group.value == widget.value) {
      return;
    }

    // Notify the group of the selection
    group.onChanged?.call(widget.value);

    // Add haptic feedback if enabled
    if (widget.enableHapticFeedback) {
      HapticFeedback.selectionClick();
    }
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space ||
          event.logicalKey == LogicalKeyboardKey.enter) {
        _handleTap();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the group this radio button belongs to
    final group = NakedRadioGroupScope.of<T>(context);

    // If no group found, show error in debug mode
    if (group == null) {
      assert(() {
        throw FlutterError(
          'NakedRadioButton must be used within a NakedRadioGroup.\n'
          'No NakedRadioGroup ancestor could be found for a NakedRadioButton with value: ${widget.value}',
        );
      }());
      return widget.child;
    }

    // Check if this radio button is selected
    final isSelected = group.value == widget.value;

    // Check if interaction is allowed
    final isInteractive =
        !widget.isDisabled && !group.isDisabled && group.onChanged != null;

    return Semantics(
      checked: isSelected,
      enabled: isInteractive,
      label: widget.semanticLabel,
      onTap: isInteractive ? _handleTap : null,
      excludeSemantics: true,
      child: NakedFocusManager(
        trapFocus: false, // Don't trap focus within individual radio buttons
        restoreFocus: true, // Restore focus when the button is removed
        autofocus:
            false, // Don't automatically request focus unless set by group
        child: MouseRegion(
          cursor: isInteractive ? widget.cursor : SystemMouseCursors.forbidden,
          onEnter:
              isInteractive ? (_) => widget.onStateHover?.call(true) : null,
          onExit:
              isInteractive ? (_) => widget.onStateHover?.call(false) : null,
          child: Focus(
            focusNode: _focusNode,
            onFocusChange: widget.onStateFocus,
            onKeyEvent: (node, event) {
              if (isInteractive) {
                _handleKeyEvent(event);
              }
              return KeyEventResult.handled;
            },
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: isInteractive
                  ? (_) => widget.onStatePressed?.call(true)
                  : null,
              onTapUp: isInteractive
                  ? (_) => widget.onStatePressed?.call(false)
                  : null,
              onTapCancel: isInteractive
                  ? () => widget.onStatePressed?.call(false)
                  : null,
              onTap: isInteractive ? _handleTap : null,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
