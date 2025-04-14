// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:naked/src/utilities/naked_focus_manager.dart';
// import 'package:naked/src/utilities/naked_portal.dart';
// import 'package:naked/src/utilities/naked_positioning.dart';

// /// A fully customizable select/dropdown with no default styling.
// ///
// /// NakedSelect provides interaction behavior and accessibility features
// /// for a dropdown select menu without imposing any visual styling,
// /// giving consumers complete control over appearance through direct state callbacks.
// ///
// /// This component uses three core utilities to enhance functionality:
// /// - [NakedPortal]: Renders dropdown content in the app overlay, ensuring proper z-index
// ///   and maintaining context inheritance across the component tree.
// /// - [NakedPositioning]: Handles optimal positioning of the dropdown relative to its trigger,
// ///   adjusting for screen boundaries and available space.
// /// - [NakedFocusManager]: Manages focus behavior, keyboard navigation, and accessibility
// ///   for dropdown items.
// ///
// /// Example:
// /// ```dart
// /// class MySelectWidget extends StatefulWidget {
// ///   @override
// ///   _MySelectWidgetState createState() => _MySelectWidgetState();
// /// }
// ///
// /// class _MySelectWidgetState extends State<MySelectWidget> {
// ///   String? _selectedValue;
// ///   bool _isTriggerHovered = false;
// ///   bool _isTriggerFocused = false;
// ///   bool _isTriggerPressed = false;
// ///
// ///   @override
// ///   Widget build(BuildContext context) {
// ///     return NakedSelect<String>(
// ///       selectedValue: _selectedValue,
// ///       onSelected: (value) => setState(() => _selectedValue = value),
// ///       options: const {
// ///         'apple': 'Apple',
// ///         'banana': 'Banana',
// ///         'orange': 'Orange',
// ///       },
// ///       triggerBuilder: (context, controller, child) {
// ///         return NakedMenuTrigger(
// ///           controller: controller,
// ///           isDisabled: false,
// ///           builder: (context, states) {
// ///             // Build your custom trigger UI based on states
// ///             return Container(
// ///               padding: EdgeInsets.all(10),
// ///               decoration: BoxDecoration(
// ///                 border: Border.all(color: _isTriggerFocused ? Colors.blue : Colors.grey),
// ///                 color: _isTriggerHovered ? Colors.grey[200] : Colors.white,
// ///               ),
// ///               child: Text(_selectedValue ?? 'Select an option'),
// ///             );
// ///           },
// ///           onHoverState: (isHovered) => setState(() => _isTriggerHovered = isHovered),
// ///           onFocusState: (isFocused) => setState(() => _isTriggerFocused = isFocused),
// ///           onPressedState: (isPressed) => setState(() => _isTriggerPressed = isPressed),
// ///         );
// ///       },
// ///       contentBuilder: (context, controller, child) {
// ///         // Build your custom dropdown content UI
// ///         return NakedMenuContent(
// ///           controller: controller,
// ///           child: Material(
// ///             elevation: 4,
// ///             child: Container(
// ///               constraints: BoxConstraints(maxHeight: 200),
// ///               child: child,
// ///             ),
// ///           ),
// ///         );
// ///       },
// ///       itemBuilder: (context, value, label, states) {
// ///         // Build your custom item UI based on value, label, and states
// ///         return NakedMenuItem(
// ///           value: value,
// ///           child: Container(
// ///             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
// ///             color: states.isHovered ? Colors.blue.withOpacity(0.1) : Colors.transparent,
// ///             child: Text(label),
// ///           ),
// ///         );
// ///       },
// ///     );
// ///   }
// /// }
// /// ```
// class NakedSelect<T> extends StatefulWidget {
//   /// The child widget to display.
//   final Widget child;

//   /// Whether the select dropdown is open.
//   final bool isOpen;

//   /// Called when the open state changes.
//   final ValueChanged<bool>? onIsOpenChanged;

//   /// The currently selected value.
//   final T? selectedValue;

//   /// Called when the selected value changes.
//   final ValueChanged<T?>? onSelectedValueChanged;

//   /// Selected values for multiple selection mode.
//   final Set<T>? selectedValues;

//   /// Called when selected values change in multiple selection mode.
//   final ValueChanged<Set<T>>? onSelectedValuesChanged;

//   /// Whether the select allows multiple selection.
//   final bool allowMultiple;

//   /// Whether the select is disabled.
//   final bool isDisabled;

//   /// Optional semantic label for accessibility.
//   final String? semanticLabel;

//   /// Whether to close the dropdown when an item is selected.
//   final bool closeOnSelect;

//   /// Whether to enable focus trap for the dropdown.
//   final bool trapFocus;

//   /// Whether to automatically focus the dropdown when opened.
//   final bool autofocus;

//   /// Preferred positions for the dropdown menu.
//   final List<AnchorPosition> preferredPositions;

//   /// Offset from the anchor position.
//   final Offset offset;

//   /// Whether to enable type-ahead selection for quick option selection.
//   final bool enableTypeAhead;

//   /// Duration to reset the type-ahead buffer.
//   final Duration typeAheadDebounceTime;

//   /// Whether to focus the selected item when dropdown opens.
//   final bool focusSelectedItemOnOpen;

//   /// Creates a naked select/dropdown.
//   ///
//   /// The [child] parameter is required.
//   const NakedSelect({
//     super.key,
//     required this.child,
//     this.isOpen = false,
//     this.onIsOpenChanged,
//     this.selectedValue,
//     this.onSelectedValueChanged,
//     this.selectedValues,
//     this.onSelectedValuesChanged,
//     this.allowMultiple = false,
//     this.isDisabled = false,
//     this.semanticLabel,
//     this.closeOnSelect = true,
//     this.trapFocus = true,
//     this.autofocus = true,
//     this.enableTypeAhead = true,
//     this.typeAheadDebounceTime = const Duration(milliseconds: 500),
//     this.focusSelectedItemOnOpen = true,
//     this.preferredPositions = const [
//       AnchorPosition.bottomCenter,
//       AnchorPosition.topCenter,
//       AnchorPosition.bottomLeft,
//       AnchorPosition.bottomRight,
//     ],
//     this.offset = const Offset(0, 4),
//   }) : assert(
//           !allowMultiple || (allowMultiple && selectedValues != null),
//           'selectedValues must be provided when allowMultiple is true',
//         );

//   @override
//   State<NakedSelect<T>> createState() => _NakedSelectState<T>();
// }

// class _NakedSelectState<T> extends State<NakedSelect<T>> {
//   // For positioning the dropdown menu
//   final LayerLink _layerLink = LayerLink();
//   final GlobalKey _triggerKey = GlobalKey();
//   Rect? _triggerRect;

//   // For type-ahead functionality
//   String _typeAheadBuffer = '';
//   Timer? _typeAheadResetTimer;
//   final List<FocusNode> _itemFocusNodes = [];
//   final List<T> _selectableValues = [];

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _updateTriggerRect();
//     });
//   }

//   @override
//   void dispose() {
//     _cancelTypeAheadTimer();
//     super.dispose();
//   }

//   void _cancelTypeAheadTimer() {
//     _typeAheadResetTimer?.cancel();
//     _typeAheadResetTimer = null;
//   }

//   void _resetTypeAheadBuffer() {
//     _cancelTypeAheadTimer();
//     _typeAheadBuffer = '';
//   }

//   void _handleTypeAhead(String character) {
//     if (!widget.enableTypeAhead) return;

//     _cancelTypeAheadTimer();
//     _typeAheadBuffer += character.toLowerCase();

//     // Find the first matching item
//     for (int i = 0; i < _selectableValues.length; i++) {
//       final option = _selectableValues[i];
//       final stringValue = option.toString().toLowerCase();
//       if (stringValue.startsWith(_typeAheadBuffer)) {
//         // Focus this item
//         if (i < _itemFocusNodes.length && _itemFocusNodes[i].canRequestFocus) {
//           _itemFocusNodes[i].requestFocus();
//         }
//         break;
//       }
//     }

//     // Reset the buffer after a delay
//     _typeAheadResetTimer =
//         Timer(widget.typeAheadDebounceTime, _resetTypeAheadBuffer);
//   }

//   @override
//   void didUpdateWidget(NakedSelect<T> oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.isOpen != widget.isOpen) {
//       if (widget.isOpen) {
//         // Update trigger rect when opening
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           _updateTriggerRect();
//         });
//       }

//       // Reset type-ahead when dropdown state changes
//       _resetTypeAheadBuffer();
//     }
//   }

//   void _updateTriggerRect() {
//     final RenderBox? renderBox =
//         _triggerKey.currentContext?.findRenderObject() as RenderBox?;
//     if (renderBox != null && renderBox.hasSize) {
//       final position = renderBox.localToGlobal(Offset.zero);
//       setState(() {
//         _triggerRect = Rect.fromLTWH(
//           position.dx,
//           position.dy,
//           renderBox.size.width,
//           renderBox.size.height,
//         );
//       });
//     }
//   }

//   void _registerSelectableValue(T value, FocusNode focusNode) {
//     if (!_selectableValues.contains(value)) {
//       _selectableValues.add(value);
//       _itemFocusNodes.add(focusNode);
//     }
//   }

//   void _clearRegisteredValues() {
//     _selectableValues.clear();
//     _itemFocusNodes.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Semantics(
//       container: true,
//       label: widget.semanticLabel,
//       explicitChildNodes: true,
//       child: CompositedTransformTarget(
//         link: _layerLink,
//         child: KeyedSubtree(
//           key: _triggerKey,
//           child: _NakedSelectScope<T>(
//             select: widget,
//             state: this,
//             child: widget.child,
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// The scope that provides select state to its descendants.
// class _NakedSelectScope<T> extends InheritedWidget {
//   /// The NakedSelect instance.
//   final NakedSelect<T> select;

//   /// The state of the NakedSelect.
//   final _NakedSelectState<T> state;

//   const _NakedSelectScope({
//     required this.select,
//     required this.state,
//     required super.child,
//   });

//   /// Toggles the dropdown open state.
//   void toggleDropdown() {
//     if (select.onIsOpenChanged != null) {
//       select.onIsOpenChanged!(!select.isOpen);
//     }
//   }

//   /// Selects a value.
//   void selectValue(T value) {
//     if (select.isDisabled) return;

//     if (select.allowMultiple) {
//       if (select.onSelectedValuesChanged != null) {
//         final newValues = Set<T>.from(select.selectedValues!);
//         if (newValues.contains(value)) {
//           newValues.remove(value);
//         } else {
//           newValues.add(value);
//         }
//         select.onSelectedValuesChanged!(newValues);
//       }
//     } else {
//       if (select.onSelectedValueChanged != null) {
//         select.onSelectedValueChanged!(value);
//       }

//       if (select.closeOnSelect && select.onIsOpenChanged != null) {
//         select.onIsOpenChanged!(false);
//       }
//     }
//   }

//   /// Registers a selectable value with its focus node for type-ahead and keyboard navigation.
//   void registerSelectableValue(T value, FocusNode focusNode) {
//     state._registerSelectableValue(value, focusNode);
//   }

//   /// Clears all registered selectable values.
//   void clearRegisteredValues() {
//     state._clearRegisteredValues();
//   }

//   /// Handle type-ahead input.
//   void handleTypeAhead(String character) {
//     state._handleTypeAhead(character);
//   }

//   /// Whether an item is selected.
//   bool isItemSelected(T value) {
//     if (select.allowMultiple) {
//       return select.selectedValues?.contains(value) ?? false;
//     } else {
//       return select.selectedValue == value;
//     }
//   }

//   static _NakedSelectScope<T>? of<T>(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<_NakedSelectScope<T>>();
//   }

//   @override
//   bool updateShouldNotify(_NakedSelectScope<T> oldWidget) {
//     return select.isOpen != oldWidget.select.isOpen ||
//         select.selectedValue != oldWidget.select.selectedValue ||
//         select.selectedValues != oldWidget.select.selectedValues ||
//         select.isDisabled != oldWidget.select.isDisabled;
//   }
// }

// /// A trigger button for opening/closing NakedSelect dropdown.
// ///
// /// This component is typically used as the button that displays the current selection
// /// and opens the dropdown menu.
// class NakedSelectTrigger extends StatelessWidget {
//   /// The child widget to display.
//   final Widget child;

//   /// Called when hover state changes.
//   final ValueChanged<bool>? onHoverState;

//   /// Called when pressed state changes.
//   final ValueChanged<bool>? onPressedState;

//   /// Called when focus state changes.
//   final ValueChanged<bool>? onFocusState;

//   /// Whether the trigger is disabled.
//   final bool isDisabled;

//   /// Optional semantic label for accessibility.
//   final String? semanticLabel;

//   /// The cursor to show when hovering over the trigger.
//   final MouseCursor cursor;

//   /// Whether to provide haptic feedback on tap.
//   final bool enableHapticFeedback;

//   /// Optional focus node to control focus behavior.
//   final FocusNode? focusNode;

//   /// Creates a naked select trigger.
//   ///
//   /// The [child] parameter is required.
//   const NakedSelectTrigger({
//     super.key,
//     required this.child,
//     this.onHoverState,
//     this.onPressedState,
//     this.onFocusState,
//     this.isDisabled = false,
//     this.semanticLabel,
//     this.cursor = SystemMouseCursors.click,
//     this.enableHapticFeedback = true,
//     this.focusNode,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final selectScope = _NakedSelectScope.of(context);
//     final isSelectDisabled = selectScope?.select.isDisabled ?? false;
//     final isEffectivelyDisabled = isDisabled || isSelectDisabled;
//     final isInteractive = !isEffectivelyDisabled;
//     final effectiveFocusNode = focusNode ?? FocusNode();

//     void handleTap() {
//       if (isInteractive) {
//         if (enableHapticFeedback) {
//           HapticFeedback.lightImpact();
//         }
//         selectScope?.toggleDropdown();
//       }
//     }

//     return Semantics(
//       button: true,
//       enabled: isInteractive,
//       label: semanticLabel ?? 'Select button',
//       onTap: isInteractive ? handleTap : null,
//       excludeSemantics: true,
//       child: Focus(
//         focusNode: effectiveFocusNode,
//         onFocusChange: onFocusState,
//         onKeyEvent: (node, event) {
//           if (!isInteractive) return KeyEventResult.ignored;

//           if (event is KeyDownEvent) {
//             if (event.logicalKey == LogicalKeyboardKey.space ||
//                 event.logicalKey == LogicalKeyboardKey.enter) {
//               onPressedState?.call(true);
//               return KeyEventResult.handled;
//             } else if (event.logicalKey == LogicalKeyboardKey.arrowDown ||
//                 event.logicalKey == LogicalKeyboardKey.arrowUp) {
//               // Open dropdown on arrow down/up
//               final isOpen = selectScope?.select.isOpen ?? false;
//               if (!isOpen) {
//                 selectScope?.toggleDropdown();
//               }
//               return KeyEventResult.handled;
//             }
//           } else if (event is KeyUpEvent) {
//             if (event.logicalKey == LogicalKeyboardKey.space ||
//                 event.logicalKey == LogicalKeyboardKey.enter) {
//               onPressedState?.call(false);
//               handleTap();
//               return KeyEventResult.handled;
//             }
//           }
//           return KeyEventResult.ignored;
//         },
//         child: MouseRegion(
//           cursor: isInteractive ? cursor : SystemMouseCursors.forbidden,
//           onEnter: isInteractive ? (_) => onHoverState?.call(true) : null,
//           onExit: isInteractive ? (_) => onHoverState?.call(false) : null,
//           child: GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             onTapDown: isInteractive ? (_) => onPressedState?.call(true) : null,
//             onTapUp: isInteractive ? (_) => onPressedState?.call(false) : null,
//             onTapCancel:
//                 isInteractive ? () => onPressedState?.call(false) : null,
//             onTap: isInteractive ? handleTap : null,
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// A container for the dropdown menu items.
// ///
// /// This component is used to contain the selectable items in the dropdown.
// class NakedSelectMenu extends StatefulWidget {
//   /// The child widget to display.
//   final Widget child;

//   /// Optional semantic label for accessibility.
//   final String? semanticLabel;

//   /// Optional focus node to control focus behavior.
//   final FocusNode? focusNode;

//   /// Creates a naked select menu.
//   ///
//   /// The [child] parameter is required.
//   const NakedSelectMenu({
//     super.key,
//     required this.child,
//     this.semanticLabel,
//     this.focusNode,
//   });

//   @override
//   State<NakedSelectMenu> createState() => _NakedSelectMenuState();
// }

// class _NakedSelectMenuState extends State<NakedSelectMenu> {
//   final FocusNode _focusNode = FocusNode();

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final selectScope = _NakedSelectScope.of(context);

//     if (selectScope == null) {
//       return widget.child;
//     }

//     // Get target rectangle for positioning
//     final state = context.findAncestorStateOfType<_NakedSelectState>();
//     if (state == null || state._triggerRect == null) {
//       return widget.child;
//     }

//     return Builder(
//       builder: (context) {
//         final selectWidget = selectScope.select;

//         // Clear any previously registered items when dropdown opens
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           selectScope.clearRegisteredValues();
//         });

//         // First, we use NakedPortal to render content in overlay
//         return NakedPortal(
//           child: Material(
//             color: Colors.transparent,
//             child: GestureDetector(
//               behavior: HitTestBehavior.opaque,
//               onTap: () {}, // Prevent taps from reaching background
//               child: NakedPositioning(
//                 target: state._triggerRect!,
//                 preferredPositions: selectWidget.preferredPositions,
//                 offset: selectWidget.offset,
//                 dynamicSizing: true,
//                 child: Focus(
//                   // Handle type-ahead functionality
//                   onKeyEvent: (FocusNode node, KeyEvent event) {
//                     // Handle type-ahead functionality
//                     if (event is KeyDownEvent) {
//                       // Home and End keys for first and last items
//                       if (event.logicalKey == LogicalKeyboardKey.home) {
//                         if (state._itemFocusNodes.isNotEmpty) {
//                           state._itemFocusNodes.first.requestFocus();
//                           return KeyEventResult.handled;
//                         }
//                       } else if (event.logicalKey == LogicalKeyboardKey.end) {
//                         if (state._itemFocusNodes.isNotEmpty) {
//                           state._itemFocusNodes.last.requestFocus();
//                           return KeyEventResult.handled;
//                         }
//                       }

//                       // Type-ahead with character keys
//                       final character = event.character;
//                       if (character != null && character.isNotEmpty) {
//                         selectScope.handleTypeAhead(character);
//                         return KeyEventResult.handled;
//                       }
//                     }

//                     return KeyEventResult.ignored;
//                   },
//                   child: NakedFocusManager(
//                     trapFocus: selectWidget.trapFocus,
//                     autofocus: selectWidget.autofocus,
//                     restoreFocus: true,
//                     onEscapePressed: () {
//                       selectScope.toggleDropdown();
//                     },
//                     child: widget.child,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// /// An individual selectable item in the dropdown menu.
// ///
// /// This component represents a selectable option within the dropdown.
// class NakedSelectItem<T> extends StatefulWidget {
//   /// The child widget to display.
//   final Widget child;

//   /// The value associated with this item.
//   final T value;

//   /// Whether this item is selected.
//   final bool isSelected;

//   /// Called when hover state changes.
//   final ValueChanged<bool>? onHoverState;

//   /// Called when pressed state changes.
//   final ValueChanged<bool>? onPressedState;

//   /// Called when focus state changes.
//   final ValueChanged<bool>? onFocusState;

//   /// Whether this item is disabled.
//   final bool isDisabled;

//   /// Optional semantic label for accessibility.
//   final String? semanticLabel;

//   /// The cursor to show when hovering over this item.
//   final MouseCursor cursor;

//   /// Whether to provide haptic feedback on tap.
//   final bool enableHapticFeedback;

//   /// Optional focus node to control focus behavior.
//   final FocusNode? focusNode;

//   /// Whether to focus the selected item when dropdown opens.
//   final bool focusSelectedItemOnOpen;

//   /// Creates a naked select item.
//   ///
//   /// The [child] and [value] parameters are required.
//   const NakedSelectItem({
//     super.key,
//     required this.child,
//     required this.value,
//     this.isSelected = false,
//     this.onHoverState,
//     this.onPressedState,
//     this.onFocusState,
//     this.isDisabled = false,
//     this.semanticLabel,
//     this.cursor = SystemMouseCursors.click,
//     this.enableHapticFeedback = true,
//     this.focusNode,
//     this.focusSelectedItemOnOpen = true,
//   });

//   @override
//   State<NakedSelectItem<T>> createState() => _NakedSelectItemState<T>();
// }

// class _NakedSelectItemState<T> extends State<NakedSelectItem<T>> {
//   late FocusNode _focusNode;
//   bool _isRegistered = false;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = widget.focusNode ?? FocusNode();

//     // Register this item after build
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _registerWithSelect();
//     });
//   }

//   @override
//   void didUpdateWidget(NakedSelectItem<T> oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     if (widget.focusNode != oldWidget.focusNode) {
//       if (oldWidget.focusNode == null) {
//         _focusNode.dispose();
//       }
//       _focusNode = widget.focusNode ?? FocusNode();
//     }

//     if (widget.value != oldWidget.value) {
//       _registerWithSelect();
//     }

//     // Automatically focus this item if it's newly selected and menu is open
//     if (!oldWidget.isSelected && widget.isSelected) {
//       final selectScope = _NakedSelectScope.of<T>(context);
//       final select = selectScope?.select;

//       if (select?.isOpen == true && select?.focusSelectedItemOnOpen == true) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (_focusNode.canRequestFocus) {
//             _focusNode.requestFocus();
//           }
//         });
//       }
//     }
//   }

//   @override
//   void dispose() {
//     if (widget.focusNode == null) {
//       _focusNode.dispose();
//     }
//     super.dispose();
//   }

//   void _registerWithSelect() {
//     if (_isRegistered) return;

//     final selectScope = _NakedSelectScope.of<T>(context);
//     if (selectScope != null) {
//       selectScope.registerSelectableValue(widget.value, _focusNode);
//       _isRegistered = true;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final selectScope = _NakedSelectScope.of<T>(context);
//     final isSelectDisabled = selectScope?.select.isDisabled ?? false;
//     final isEffectivelySelected = widget.isSelected ||
//         (selectScope?.isItemSelected(widget.value) ?? false);
//     final isEffectivelyDisabled = widget.isDisabled || isSelectDisabled;
//     final isInteractive = !isEffectivelyDisabled;

//     // Auto-focus the selected item when dropdown opens
//     if (isEffectivelySelected) {
//       final select = selectScope?.select;
//       if (select?.isOpen == true && select?.focusSelectedItemOnOpen == true) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (_focusNode.canRequestFocus && !_focusNode.hasFocus) {
//             _focusNode.requestFocus();
//           }
//         });
//       }
//     }

//     void handleTap() {
//       if (isInteractive) {
//         if (widget.enableHapticFeedback) {
//           HapticFeedback.lightImpact();
//         }
//         selectScope?.selectValue(widget.value);
//       }
//     }

//     return Semantics(
//       button: true,
//       enabled: isInteractive,
//       label: widget.semanticLabel ?? widget.value.toString(),
//       onTap: isInteractive ? handleTap : null,
//       selected: isEffectivelySelected,
//       excludeSemantics: true,
//       child: Focus(
//         focusNode: _focusNode,
//         onFocusChange: widget.onFocusState,
//         onKeyEvent: (node, event) {
//           if (!isInteractive) return KeyEventResult.ignored;

//           if (event is KeyDownEvent &&
//               (event.logicalKey == LogicalKeyboardKey.space ||
//                   event.logicalKey == LogicalKeyboardKey.enter)) {
//             widget.onPressedState?.call(true);
//             return KeyEventResult.handled;
//           } else if (event is KeyUpEvent &&
//               (event.logicalKey == LogicalKeyboardKey.space ||
//                   event.logicalKey == LogicalKeyboardKey.enter)) {
//             widget.onPressedState?.call(false);
//             handleTap();
//             return KeyEventResult.handled;
//           }
//           return KeyEventResult.ignored;
//         },
//         child: MouseRegion(
//           cursor: isInteractive ? widget.cursor : SystemMouseCursors.forbidden,
//           onEnter:
//               isInteractive ? (_) => widget.onHoverState?.call(true) : null,
//           onExit:
//               isInteractive ? (_) => widget.onHoverState?.call(false) : null,
//           child: GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             onTapDown:
//                 isInteractive ? (_) => widget.onPressedState?.call(true) : null,
//             onTapUp: isInteractive
//                 ? (_) => widget.onPressedState?.call(false)
//                 : null,
//             onTapCancel:
//                 isInteractive ? () => widget.onPressedState?.call(false) : null,
//             onTap: isInteractive ? handleTap : null,
//             child: widget.child,
//           ),
//         ),
//       ),
//     );
//   }
// }
