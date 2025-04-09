import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utilities/naked_focus_manager.dart';

/// A context provider for a radio group that manages a single selection
/// across multiple radio buttons.
///
/// This widget provides a simple callback-based API for managing radio button groups
/// without imposing any visual styling.
class NakedRadioGroup<T> extends StatefulWidget {
  /// The currently selected value within the group.
  final T? value;

  /// Called when a selection changes.
  final ValueChanged<T?>? onChanged;

  /// Child widgets (typically containing NakedRadioButtons).
  final Widget child;

  /// Whether the entire group is disabled.
  ///
  /// When true, all radio buttons in the group will not respond to user interaction.
  final bool isDisabled;

  /// Whether focus should be trapped within this radio group.
  ///
  /// When true, keyboard navigation (tab) will be restricted to radio buttons
  /// within this group.
  final bool trapFocus;

  /// Whether to automatically focus the first radio button when the group is mounted.
  final bool autofocus;

  /// Called when the escape key is pressed while the radio group has focus.
  ///
  /// This can be used to implement custom escape key handling, such as
  /// closing a modal or reverting to a previous selection.
  final VoidCallback? onEscapePressed;

  /// Creates a naked radio group.
  ///
  /// The [child] parameter is required, which typically contains NakedRadioButton widgets.
  /// The [value] parameter represents the currently selected value within the group.
  const NakedRadioGroup({
    super.key,
    required this.value,
    required this.onChanged,
    required this.child,
    this.isDisabled = false,
    this.trapFocus = false,
    this.autofocus = false,
    this.onEscapePressed,
  });

  @override
  State<NakedRadioGroup<T>> createState() => _NakedRadioGroupState<T>();
}

class _NakedRadioGroupState<T> extends State<NakedRadioGroup<T>> {
  // List of radio button values in order
  List<T> _buttonValues = [];

  // Track the values for efficient navigation
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _collectRadioButtonValues();
  }

  @override
  void didUpdateWidget(NakedRadioGroup<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _collectRadioButtonValues();
  }

  void _collectRadioButtonValues() {
    // This will be populated when needed for keyboard navigation
    _buttonValues = [];

    // We'll use this in the actual navigation methods
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _findRadioButtonValues(context);
    });
  }

  void _findRadioButtonValues(BuildContext context) {
    // Reset the list
    _buttonValues.clear();

    // Find all radio button values in a simple way
    void visitor(Element element) {
      // Skip nested radio groups
      if (element.widget is NakedRadioGroupScope<T>) {
        return;
      }

      // Check for a radio button by custom matching
      if (element.widget.runtimeType
          .toString()
          .contains('NakedRadioButton<$T>')) {
        try {
          // We need to use reflection to get the value field
          final dynamic radioButton = element.widget;
          // Only proceed if this widget has a 'value' getter that returns T
          if (radioButton != null) {
            final value = radioButton.value;
            if (value is T && !_buttonValues.contains(value)) {
              _buttonValues.add(value);
            }
          }
        } catch (e) {
          // Ignore errors during reflection
        }
      }

      // Continue searching
      element.visitChildren(visitor);
    }

    // Start the search from this widget's element
    context.visitChildElements(visitor);
  }

  @override
  Widget build(BuildContext context) {
    return NakedFocusManager(
      trapFocus: widget.trapFocus,
      autofocus: widget.autofocus,
      restoreFocus: true,
      onEscapePressed: widget.onEscapePressed,
      child: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: _handleKeyEvent,
        child: NakedRadioGroupScope<T>(
          value: widget.value,
          onChanged: widget.onChanged,
          isDisabled: widget.isDisabled,
          child: widget.child,
        ),
      ),
    );
  }

  void _handleKeyEvent(KeyEvent event) {
    // Handle arrow key navigation between radio buttons
    if (event is KeyDownEvent &&
        !widget.isDisabled &&
        widget.onChanged != null) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown ||
          event.logicalKey == LogicalKeyboardKey.arrowRight) {
        _moveToNextRadioButton();
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp ||
          event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        _moveToPreviousRadioButton();
      } else if (event.logicalKey == LogicalKeyboardKey.home) {
        _moveToFirstRadioButton();
      } else if (event.logicalKey == LogicalKeyboardKey.end) {
        _moveToLastRadioButton();
      }
    }
  }

  void _moveToNextRadioButton() {
    if (_buttonValues.isEmpty || widget.value == null) {
      return;
    }

    // Find current index
    final currentIndex = _buttonValues.indexOf(widget.value as T);
    if (currentIndex == -1) {
      // Current value not found, select first button
      if (_buttonValues.isNotEmpty) {
        widget.onChanged?.call(_buttonValues.first);
      }
      return;
    }

    // Move to next button, or loop back to first
    final nextIndex = (currentIndex + 1) % _buttonValues.length;
    widget.onChanged?.call(_buttonValues[nextIndex]);
  }

  void _moveToPreviousRadioButton() {
    if (_buttonValues.isEmpty || widget.value == null) {
      return;
    }

    // Find current index
    final currentIndex = _buttonValues.indexOf(widget.value as T);
    if (currentIndex == -1) {
      // Current value not found, select last button
      if (_buttonValues.isNotEmpty) {
        widget.onChanged?.call(_buttonValues.last);
      }
      return;
    }

    // Move to previous button, or loop to last
    final prevIndex =
        (currentIndex - 1 + _buttonValues.length) % _buttonValues.length;
    widget.onChanged?.call(_buttonValues[prevIndex]);
  }

  void _moveToFirstRadioButton() {
    if (_buttonValues.isNotEmpty) {
      widget.onChanged?.call(_buttonValues.first);
    }
  }

  void _moveToLastRadioButton() {
    if (_buttonValues.isNotEmpty) {
      widget.onChanged?.call(_buttonValues.last);
    }
  }
}

/// Internal InheritedWidget that provides radio group state to child radio buttons.
class NakedRadioGroupScope<T> extends InheritedWidget {
  /// The currently selected value within the group.
  final T? value;

  /// Called when a selection changes.
  final ValueChanged<T?>? onChanged;

  /// Whether the entire group is disabled.
  final bool isDisabled;

  /// Creates a radio group scope.
  const NakedRadioGroupScope({
    super.key,
    required this.value,
    required this.onChanged,
    required this.isDisabled,
    required super.child,
  });

  /// Allows radio buttons to access their parent group.
  static NakedRadioGroupScope<T>? of<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NakedRadioGroupScope<T>>();
  }

  @override
  bool updateShouldNotify(NakedRadioGroupScope<T> oldWidget) {
    return value != oldWidget.value ||
        isDisabled != oldWidget.isDisabled ||
        onChanged != oldWidget.onChanged;
  }
}
