// import 'package:flutter/material.dart';

// /// Defines the accordion expansion behavior.
// enum NakedAccordionType {
//   /// Only one item can be expanded at a time.
//   single,

//   /// Multiple items can be expanded simultaneously.
//   multiple,
// }

// /// A fully customizable accordion with no default styling.
// ///
// /// NakedAccordion provides interaction behavior and accessibility features
// /// for an expandable/collapsible content panel without imposing any visual styling,
// /// giving consumers complete control over appearance through direct state callbacks.
// ///
// /// Example:
// /// ```dart
// /// class MyAccordion extends StatefulWidget {
// ///   @override
// ///   _MyAccordionState createState() => _MyAccordionState();
// /// }
// ///
// /// class _MyAccordionState extends State<MyAccordion> {
// ///   Set<String> _expandedItems = {};
// ///
// ///   @override
// ///   Widget build(BuildContext context) {
// ///     return NakedAccordion(
// ///       expandedValues: _expandedItems,
// ///       onExpandedValuesChanged: (values) {
// ///         setState(() {
// ///           _expandedItems = values;
// ///         });
// ///       },
// ///       child: Column(
// ///         children: [
// ///           NakedAccordionItem(
// ///             value: 'item1',
// ///             child: Column(
// ///               children: [
// ///                 NakedAccordionTrigger(
// ///                   isExpanded: _expandedItems.contains('item1'),
// ///                   onPressed: () {
// ///                     setState(() {
// ///                       if (_expandedItems.contains('item1')) {
// ///                         _expandedItems.remove('item1');
// ///                       } else {
// ///                         _expandedItems.add('item1');
// ///                       }
// ///                     });
// ///                   },
// ///                   child: Container(
// ///                     padding: EdgeInsets.all(16),
// ///                     color: _expandedItems.contains('item1')
// ///                         ? Colors.blue.shade100
// ///                         : Colors.grey.shade200,
// ///                     child: Row(
// ///                       children: [
// ///                         Text('Section 1'),
// ///                         Spacer(),
// ///                         Icon(_expandedItems.contains('item1')
// ///                             ? Icons.expand_less
// ///                             : Icons.expand_more),
// ///                       ],
// ///                     ),
// ///                   ),
// ///                 ),
// ///                 NakedAccordionContent(
// ///                   isExpanded: _expandedItems.contains('item1'),
// ///                   child: Container(
// ///                     padding: EdgeInsets.all(16),
// ///                     color: Colors.blue.shade50,
// ///                     child: Text('Content for section 1'),
// ///                   ),
// ///                 ),
// ///               ],
// ///             ),
// ///           ),
// ///           // Additional NakedAccordionItems...
// ///         ],
// ///       ),
// ///     );
// ///   }
// /// }
// /// ```
// /// A multi-expandable accordion component.
// ///
// /// This component manages the state of multiple expandable sections,
// /// and can be configured to allow multiple sections to be expanded at once
// /// or just a single section.
// class NakedAccordion extends StatefulWidget {
//   /// The type of accordion: single or multiple expanded items allowed.
//   ///
//   /// If [type] is [NakedAccordionType.single], only one item can be expanded at a time.
//   /// If [type] is [NakedAccordionType.multiple], multiple items can be expanded.
//   final NakedAccordionType type;

//   /// List of values of initially expanded items.
//   ///
//   /// For [NakedAccordionType.single], only the first value in this list will be used.
//   final List<String> initialExpandedValues;

//   /// Whether the accordion is enabled.
//   ///
//   /// When disabled, no items can be expanded or collapsed.
//   final bool enabled;

//   /// Called when an item's expanded state changes.
//   ///
//   /// The callback provides the item's value and whether it's expanded.
//   final void Function(String value, bool isExpanded)? onExpandedChange;

//   /// Called when an item receives focus.
//   ///
//   /// The callback provides the focused item's value.
//   final void Function(String value)? onFocusItem;

//   /// The child widgets of the accordion.
//   ///
//   /// Typically a list of [NakedAccordionItem] widgets.
//   final List<Widget> children;

//   /// Creates a naked accordion.
//   ///
//   /// The [children] parameter is required.
//   const NakedAccordion({
//     super.key,
//     this.type = NakedAccordionType.single,
//     this.initialExpandedValues = const [],
//     this.enabled = true,
//     this.onExpandedChange,
//     this.onFocusItem,
//     required this.children,
//   });

//   @override
//   State<NakedAccordion> createState() => _NakedAccordionState();
// }

// class _NakedAccordionState extends State<NakedAccordion> {
//   /// Set of expanded item values
//   late Set<String> _expandedValues;

//   @override
//   void initState() {
//     super.initState();
//     _initExpandedValues();
//   }

//   @override
//   void didUpdateWidget(NakedAccordion oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     // Reset expanded values if type changes
//     if (oldWidget.type != widget.type) {
//       _initExpandedValues();
//     }
//   }

//   void _initExpandedValues() {
//     _expandedValues = Set<String>.from(widget.initialExpandedValues);

//     // For single type, ensure only one item is expanded
//     if (widget.type == NakedAccordionType.single &&
//         _expandedValues.length > 1) {
//       final firstValue = _expandedValues.first;
//       _expandedValues = {firstValue};
//     }
//   }

//   bool isItemExpanded(String value) {
//     return _expandedValues.contains(value);
//   }

//   void toggleItem(String value) {
//     if (!widget.enabled) return;

//     setState(() {
//       if (_expandedValues.contains(value)) {
//         // Collapse the item
//         _expandedValues.remove(value);
//       } else {
//         // Expand the item
//         if (widget.type == NakedAccordionType.single) {
//           // For single type, collapse other items
//           _expandedValues = {value};
//         } else {
//           // For multiple type, add to expanded items
//           _expandedValues.add(value);
//         }
//       }
//     });

//     // Notify about the change
//     final isExpanded = _expandedValues.contains(value);
//     widget.onExpandedChange?.call(value, isExpanded);
//   }

//   void focusItem(String value) {
//     widget.onFocusItem?.call(value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _NakedAccordionScope(
//       state: this,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: widget.children,
//       ),
//     );
//   }
// }

// /// Internal scope for propagating accordion state to children.
// class _NakedAccordionScope extends InheritedWidget {
//   /// The accordion state
//   final _NakedAccordionState state;

//   /// Creates an accordion scope.
//   const _NakedAccordionScope({
//     required super.child,
//     required this.state,
//   });

//   /// Whether the accordion is enabled.
//   bool get enabled => state.widget.enabled;

//   /// The type of accordion.
//   NakedAccordionType get type => state.widget.type;

//   /// Checks if an item is expanded.
//   bool isItemExpanded(String value) => state.isItemExpanded(value);

//   /// Toggles an item's expanded state.
//   void toggleItem(String value) => state.toggleItem(value);

//   /// Focuses an item.
//   void onFocusItem(String value) => state.focusItem(value);

//   @override
//   bool updateShouldNotify(_NakedAccordionScope oldWidget) {
//     return oldWidget.state != state ||
//         oldWidget.state.widget.enabled != state.widget.enabled ||
//         oldWidget.state.widget.type != state.widget.type;
//   }

//   /// Gets the accordion scope from the given context.
//   static _NakedAccordionScope? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<_NakedAccordionScope>();
//   }
// }

// /// Content part of an accordion item that can be expanded or collapsed.
// ///
// /// This component is typically used as the content part of a NakedAccordionItem
// /// and is controlled by the parent item's expanded state.
// class NakedAccordionContent extends StatefulWidget {
//   /// The content to display when expanded.
//   final Widget child;

//   /// Optional - Whether the content is expanded.
//   ///
//   /// If provided, this will override the parent accordion item's state.
//   final bool? isExpanded;

//   /// Optional - Called when the content's animation state changes.
//   ///
//   /// This allows tracking when the animation completes.
//   final ValueChanged<AnimationStatus>? onAnimationStatusChanged;

//   /// Creates a naked accordion content.
//   ///
//   /// The [child] parameter is required.
//   const NakedAccordionContent({
//     super.key,
//     required this.child,
//     this.isExpanded,
//     this.onAnimationStatusChanged,
//   });

//   @override
//   State<NakedAccordionContent> createState() => _NakedAccordionContentState();
// }

// class _NakedAccordionContentState extends State<NakedAccordionContent>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   bool? _lastKnownExpandedState;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 200),
//     );
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );

//     // Listen for animation status changes
//     if (widget.onAnimationStatusChanged != null) {
//       _animation.addStatusListener(widget.onAnimationStatusChanged!);
//     }
//   }

//   @override
//   void dispose() {
//     // Remove listener before disposing
//     if (widget.onAnimationStatusChanged != null) {
//       _animation.removeStatusListener(widget.onAnimationStatusChanged!);
//     }
//     _controller.dispose();
//     super.dispose();
//   }

//   bool _getExpandedState() {
//     // Priority 1: Widget's own isExpanded property
//     if (widget.isExpanded != null) return widget.isExpanded!;

//     // Priority 2: Parent accordion's expanded value for this item
//     final item = _NakedAccordionItemScope.of(context);
//     final accordion = _NakedAccordionScope.of(context);

//     if (item != null && accordion != null) {
//       return accordion.isItemExpanded(item.value);
//     }

//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool isExpanded = _getExpandedState();

//     // Update animation if expanded state changed
//     if (_lastKnownExpandedState != isExpanded) {
//       _lastKnownExpandedState = isExpanded;
//       if (isExpanded) {
//         _controller.forward();
//       } else {
//         _controller.reverse();
//       }
//     }

//     return SizeTransition(
//       sizeFactor: _animation,
//       child: Semantics(
//         hidden: !isExpanded,
//         child: widget.child,
//       ),
//     );
//   }
// }

// /// An item within an accordion.
// ///
// /// This component represents a single expandable section within an accordion.
// class NakedAccordionItem extends StatefulWidget {
//   /// The unique value for this accordion item.
//   ///
//   /// This value is used to track the expanded state of the item.
//   final String value;

//   /// Whether this accordion item is enabled.
//   ///
//   /// When false, the item cannot be expanded or collapsed.
//   final bool? enabled;

//   /// Whether this accordion item is expanded.
//   ///
//   /// If not provided, the item will use the expanded state from
//   /// the parent accordion.
//   final bool? isExpanded;

//   /// The trigger widget that controls expansion.
//   ///
//   /// This is typically a [NakedAccordionTrigger] widget.
//   final Widget trigger;

//   /// The content that is shown when the accordion item is expanded.
//   ///
//   /// This is typically a [NakedAccordionContent] widget.
//   final Widget content;

//   /// Called when the expanded state changes.
//   ///
//   /// This event is fired after the state has changed, and can be used to
//   /// perform additional actions like scrolling to the item.
//   final ValueChanged<bool>? onExpandedStateChange;

//   /// Creates an accordion item.
//   ///
//   /// The [value], [trigger], and [content] parameters are required.
//   const NakedAccordionItem({
//     super.key,
//     required this.value,
//     this.enabled,
//     this.isExpanded,
//     required this.trigger,
//     required this.content,
//     this.onExpandedStateChange,
//   });

//   @override
//   State<NakedAccordionItem> createState() => _NakedAccordionItemState();
// }

// class _NakedAccordionItemState extends State<NakedAccordionItem> {
//   bool? _lastKnownExpandedState;

//   @override
//   Widget build(BuildContext context) {
//     final accordion = _NakedAccordionScope.of(context);

//     // Determine if the item is expanded from the accordion or local prop
//     final bool isExpanded =
//         widget.isExpanded ?? (accordion?.isItemExpanded(widget.value) ?? false);

//     // Check if expanded state changed
//     if (_lastKnownExpandedState != isExpanded) {
//       _lastKnownExpandedState = isExpanded;
//       // Notify of expanded state change, but after build completes
//       if (widget.onExpandedStateChange != null) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           widget.onExpandedStateChange!(isExpanded);
//         });
//       }
//     }

//     // Determine if the item is enabled from the accordion or local prop
//     final bool enabled = widget.enabled ?? (accordion?.enabled ?? false);

//     return _NakedAccordionItemScope(
//       value: widget.value,
//       enabled: enabled,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           widget.trigger,
//           widget.content,
//         ],
//       ),
//     );
//   }
// }

// /// The scope that provides accordion item state to its descendants.
// class _NakedAccordionItemScope extends InheritedWidget {
//   /// The unique value that identifies this accordion item.
//   final String value;

//   /// Whether the accordion item is enabled.
//   final bool enabled;

//   const _NakedAccordionItemScope({
//     required this.value,
//     required this.enabled,
//     required super.child,
//   });

//   static _NakedAccordionItemScope? of(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<_NakedAccordionItemScope>();
//   }

//   @override
//   bool updateShouldNotify(_NakedAccordionItemScope oldWidget) {
//     return value != oldWidget.value || enabled != oldWidget.enabled;
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AccordionController<T> {
  final Set<T> values = {};

  void open(T value) {
    values.add(value);
  }

  void close(T value) {
    values.remove(value);
  }

  void toggle(T value) {
    if (values.contains(value)) {
      close(value);
    } else {
      open(value);
    }
  }

  void clear() {
    values.clear();
  }

  void openAll(List<T> newValues) {
    values.addAll(newValues);
  }

  @override
  bool operator ==(Object other) {
    return other is AccordionController &&
        runtimeType == other.runtimeType &&
        setEquals(values, other.values);
  }

  @override
  int get hashCode => values.hashCode;
}

class NakedAccordion<T> extends StatefulWidget {
  final List<NakedAccordionItem<T>> children;
  final AccordionController<T> controller;
  final List<T> initialExpandedValues;
  final void Function(T value)? onTriggerPressed;
  const NakedAccordion({
    super.key,
    required this.children,
    required this.controller,
    this.initialExpandedValues = const [],
    this.onTriggerPressed,
  });

  @override
  State<NakedAccordion<T>> createState() => _NakedAccordionState<T>();
}

class _NakedAccordionState<T> extends State<NakedAccordion<T>> {
  @override
  void initState() {
    super.initState();
    widget.controller.values.addAll(widget.initialExpandedValues);
  }

  @override
  void didUpdateWidget(covariant NakedAccordion<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialExpandedValues != widget.initialExpandedValues) {
      widget.controller.clear();
      widget.controller.openAll(widget.initialExpandedValues);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _NakedAccordionScope<T>(
      controller: widget.controller,
      onTriggerPressed: widget.onTriggerPressed,
      child: Column(
        children: widget.children,
      ),
    );
  }
}

class _NakedAccordionScope<T> extends InheritedWidget {
  final AccordionController<T> controller;
  final void Function(T value)? onTriggerPressed;

  const _NakedAccordionScope({
    required this.controller,
    required this.onTriggerPressed,
    required super.child,
  });

  static _NakedAccordionScope<T> of<T>(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_NakedAccordionScope<T>>();
    if (scope == null) {
      throw Exception('No _NakedAccordionScope found in context');
    }
    return scope;
  }

  @override
  bool updateShouldNotify(_NakedAccordionScope<T> oldWidget) {
    return controller != oldWidget.controller ||
        onTriggerPressed != oldWidget.onTriggerPressed;
  }
}

class NakedAccordionItem<T> extends StatefulWidget {
  final Widget trigger;
  final Widget content;
  final T value;

  /// Optional semantic label describing the section for screen readers.
  final String? semanticLabel;

  final bool enabled;

  const NakedAccordionItem({
    super.key,
    required this.trigger,
    required this.content,
    required this.value,
    this.semanticLabel,
    this.enabled = true,
  });

  @override
  State<NakedAccordionItem<T>> createState() => _NakedAccordionItemState<T>();
}

class _NakedAccordionItemState<T> extends State<NakedAccordionItem<T>> {
  @override
  Widget build(BuildContext context) {
    final scope = _NakedAccordionScope.of<T>(context);
    final controller = scope.controller;
    final isExpanded = controller.values.contains(widget.value);

    return _NakedAccordionItemScope<T>(
      value: widget.value,
      enabled: widget.enabled,
      child: Semantics(
        container: true,
        label: widget.semanticLabel,
        explicitChildNodes: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.trigger,
            if (isExpanded)
              Semantics(
                container: true,
                liveRegion: true, // Announces changes when content appears
                child: widget.content,
              ),
          ],
        ),
      ),
    );
  }
}

class _NakedAccordionItemScope<T> extends InheritedWidget {
  final T value;
  final bool enabled;

  const _NakedAccordionItemScope({
    required this.value,
    required this.enabled,
    required super.child,
  });

  static _NakedAccordionItemScope<T> of<T>(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<_NakedAccordionItemScope<T>>();
    if (scope == null) {
      throw Exception('No _NakedAccordionItemScope found in context');
    }
    return scope;
  }

  @override
  bool updateShouldNotify(_NakedAccordionItemScope<T> oldWidget) {
    return value != oldWidget.value || enabled != oldWidget.enabled;
  }
}

class NakedAccordionTrigger<T> extends StatefulWidget {
  final Widget child;

  /// Called when hover state changes.
  ///
  /// Provides the current hover state (true when hovered, false otherwise).
  final ValueChanged<bool>? onHoverState;

  /// Called when pressed state changes.
  ///
  /// Provides the current pressed state (true when pressed, false otherwise).
  final ValueChanged<bool>? onPressedState;

  /// Optional semantic label for accessibility.
  ///
  /// If not provided, the system will attempt to infer a label from the child.
  final String? semanticLabel;

  /// Optional focus node for the trigger.
  ///
  /// If provided, the trigger will use this focus node.
  final FocusNode? focusNode;

  /// Called when focus state changes.
  ///
  /// Provides the current focus state (true when focused, false otherwise).
  final ValueChanged<bool>? onFocusState;

  const NakedAccordionTrigger({
    super.key,
    required this.child,
    this.onHoverState,
    this.onPressedState,
    this.semanticLabel,
    this.focusNode,
    this.onFocusState,
  });

  @override
  State<NakedAccordionTrigger<T>> createState() =>
      _NakedAccordionTriggerState<T>();
}

class _NakedAccordionTriggerState<T> extends State<NakedAccordionTrigger<T>> {
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accordionScope = _NakedAccordionScope.of<T>(context);
    final itemScope = _NakedAccordionItemScope.of<T>(context);
    final isExpanded =
        accordionScope.controller.values.contains(itemScope.value);
    final isInteractive = itemScope.enabled;

    void handleTap() {
      accordionScope.onTriggerPressed?.call(itemScope.value);
    }

    return Focus(
      focusNode: widget.focusNode,
      canRequestFocus: isInteractive,
      onKeyEvent: (node, event) {
        if (!isInteractive) return KeyEventResult.ignored;

        if (event is KeyDownEvent && event.logicalKey.isSpaceOrEnter) {
          widget.onPressedState?.call(true);

          return KeyEventResult.handled;
        } else if (event is KeyUpEvent && event.logicalKey.isSpaceOrEnter) {
          widget.onPressedState?.call(false);
          handleTap();

          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      },
      onFocusChange: (focused) {
        if (focused) {
          widget.onFocusState?.call(true);
        } else {
          widget.onFocusState?.call(false);
        }
      },
      child: MouseRegion(
        onEnter: isInteractive ? (_) => widget.onHoverState?.call(true) : null,
        onExit: isInteractive ? (_) => widget.onHoverState?.call(false) : null,
        cursor: isInteractive
            ? SystemMouseCursors.click
            : SystemMouseCursors.forbidden,
        child: GestureDetector(
          onTap: isInteractive ? handleTap : null,
          onTapDown:
              isInteractive ? (_) => widget.onPressedState?.call(true) : null,
          onTapUp:
              isInteractive ? (_) => widget.onPressedState?.call(false) : null,
          onTapCancel:
              isInteractive ? () => widget.onPressedState?.call(false) : null,
          child: Semantics(
            button: true,
            label: widget.semanticLabel,
            excludeSemantics: widget.semanticLabel != null,
            onTap: isInteractive ? handleTap : null,
            toggled: isExpanded,
            hint: isExpanded ? 'Collapse' : 'Expand',
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

extension on LogicalKeyboardKey {
  bool get isSpaceOrEnter =>
      this == LogicalKeyboardKey.space || this == LogicalKeyboardKey.enter;
}

// /// A component that serves as the trigger for an accordion item.
// ///
// /// This component is typically used as the trigger part of a NakedAccordionItem
// /// and controls the expansion state of its associated content. It uses a pure
// /// callback pattern, reporting interaction states (hover, press, focus) via
// /// callbacks without managing internal state.
// class NakedAccordionTrigger extends StatefulWidget {
//   /// Whether the trigger is enabled.
//   ///
//   /// When disabled, the trigger will not respond to user interaction.
//   /// This overrides any parent accordion or item enabled state.
//   final bool? enabled;

//   /// Called when the trigger is tapped.
//   ///
//   /// If provided, this will override the default behavior of toggling
//   /// the accordion item's expanded state.
//   final VoidCallback? onTap;

//   /// Optional icon to indicate the expanded/collapsed state.
//   ///
//   /// If not provided, no icon will be shown.
//   final Widget? icon;

//   /// The main content of the trigger.
//   final Widget child;

//   /// Called when hover state changes (true if hovered, false otherwise).
//   final ValueChanged<bool>? onHoverState;

//   /// Called when pressed state changes (true if pressed, false otherwise).
//   final ValueChanged<bool>? onPressedState;

//   /// Called when focus state changes (true if focused, false otherwise).
//   final ValueChanged<bool>? onFocusState;

//   /// The cursor to display when hovering over the trigger.
//   final MouseCursor cursor;

//   /// Creates a naked accordion trigger.
//   ///
//   /// The [child] parameter is required.
//   const NakedAccordionTrigger({
//     super.key,
//     this.enabled,
//     this.onTap,
//     this.icon,
//     required this.child,
//     this.onHoverState,
//     this.onPressedState,
//     this.onFocusState,
//     this.cursor = SystemMouseCursors.click, // Default cursor
//   });

//   @override
//   State<NakedAccordionTrigger> createState() => _NakedAccordionTriggerState();
// }

// class _NakedAccordionTriggerState extends State<NakedAccordionTrigger> {
//   final FocusNode _focusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     // Add listener to report focus changes via callback
//     _focusNode.addListener(_handleFocusChange);
//   }

//   @override
//   void dispose() {
//     _focusNode.removeListener(_handleFocusChange);
//     _focusNode.dispose();
//     super.dispose();
//   }

//   void _handleFocusChange() {
//     widget.onFocusState?.call(_focusNode.hasFocus);
//   }

//   void _handleTap() {
//     final item = _NakedAccordionItemScope.of(context);
//     if (item == null) return;

//     final accordion = _NakedAccordionScope.of(context);
//     if (accordion == null) return;

//     // Check for enabled state from widget, item, or accordion scope
//     final bool isEnabled = widget.enabled ?? item.enabled && accordion.enabled;

//     // Don't allow changes if not enabled
//     if (!isEnabled) return;

//     // Request focus when tapped, but only if not already focused
//     if (!_focusNode.hasFocus) {
//       _focusNode.requestFocus();
//     }

//     // If custom onTap is provided, use that instead of default behavior
//     if (widget.onTap != null) {
//       widget.onTap!();
//       return;
//     }

//     // Toggle the expanded state via the accordion scope
//     accordion.toggleItem(item.value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final item = _NakedAccordionItemScope.of(context);
//     final accordion = _NakedAccordionScope.of(context);

//     // Determine if the item is expanded from accordion state
//     final bool isExpanded = item != null && accordion != null
//         ? accordion.isItemExpanded(item.value)
//         : false;

//     // Determine if the component is effectively enabled
//     final bool isEffectivelyEnabled = widget.enabled ??
//         (item?.enabled ?? false) && (accordion?.enabled ?? false);
//     final bool isInteractive = isEffectivelyEnabled;

//     return MouseRegion(
//       cursor: isInteractive ? widget.cursor : SystemMouseCursors.forbidden,
//       onEnter: isInteractive ? (_) => widget.onHoverState?.call(true) : null,
//       onExit: isInteractive ? (_) => widget.onHoverState?.call(false) : null,
//       child: GestureDetector(
//         onTapDown:
//             isInteractive ? (_) => widget.onPressedState?.call(true) : null,
//         onTapUp:
//             isInteractive ? (_) => widget.onPressedState?.call(false) : null,
//         onTapCancel:
//             isInteractive ? () => widget.onPressedState?.call(false) : null,
//         onTap: isInteractive ? _handleTap : null,
//         child: Focus(
//           focusNode: _focusNode,
//           // No Builder needed here anymore
//           child: DefaultTextStyle(
//             style: DefaultTextStyle.of(context).style,
//             child: IconTheme(
//               data: IconTheme.of(context),
//               child: AnimatedContainer(
//                 // Keep animation for visual feedback
//                 duration: const Duration(milliseconds: 100),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(child: widget.child),
//                     if (widget.icon != null)
//                       AnimatedRotation(
//                         turns: isExpanded ? 0.5 : 0,
//                         duration: const Duration(milliseconds: 200),
//                         child: widget.icon!,
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
