// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:naked/src/naked_tooltip.dart';
// import 'package:naked/src/utilities/naked_focus_manager.dart';
// import 'package:naked/src/utilities/naked_positioning.dart';

// /// A fully customizable menu with no default styling.
// ///
// /// NakedMenu provides interaction behavior and accessibility features
// /// for a dropdown menu without imposing any visual styling,
// /// giving consumers complete control over appearance through direct state callbacks.
// ///
// /// This component uses three core utilities to enhance functionality:
// // / - [NakedPortal]: Renders menu content in the app overlay, ensuring proper z-index
// ///   and maintaining context inheritance across the component tree.
// /// - [NakedPositioning]: Handles optimal positioning of the menu relative to its trigger,
// ///   adjusting for screen boundaries and available space.
// /// - [NakedFocusManager]: Manages focus behavior, keyboard navigation, and accessibility
// ///   for menu items, allowing users to navigate using arrow keys and tab/shift+tab.
// ///
// /// Example:
// /// ```dart
// /// class MyMenu extends StatefulWidget {
// ///   @override
// ///   _MyMenuState createState() => _MyMenuState();
// /// }
// ///
// /// class _MyMenuState extends State<MyMenu> {
// ///   bool _isOpen = false;
// ///
// ///   // State variables for styling the trigger
// ///   bool _isTriggerHovered = false;
// ///   bool _isTriggerFocused = false;
// ///   bool _isTriggerPressed = false;
// ///
// ///   // State variables for styling menu items
// ///   int? _hoveredItemIndex;
// ///   int? _focusedItemIndex;
// ///
// ///   @override
// ///   Widget build(BuildContext context) {
// ///     return NakedMenu(
// ///       isOpen: _isOpen,
// ///       onIsOpenChanged: (isOpen) => setState(() => _isOpen = isOpen),
// ///       // Position menu relative to the trigger with these preferred positions
// ///       preferredPositions: [AnchorPosition.bottomCenter, AnchorPosition.topCenter],
// ///       // Enable focus trapping for keyboard navigation within menu
// ///       trapFocus: true,
// ///       // Automatically focus the menu when opened
// ///       autofocus: true,
// ///       child: Column(
// ///         crossAxisAlignment: CrossAxisAlignment.start,
// ///         children: [
// ///           NakedMenuTrigger(
// ///             onHoverState: (isHovered) => setState(() => _isTriggerHovered = isHovered),
// ///             onFocusState: (isFocused) => setState(() => _isTriggerFocused = isFocused),
// ///             onPressedState: (isPressed) => setState(() => _isTriggerPressed = isPressed),
// ///             child: Container(
// ///               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// ///               decoration: BoxDecoration(
// ///                 color: _isTriggerPressed
// ///                     ? Colors.blue.shade700
// ///                     : _isTriggerHovered
// ///                         ? Colors.blue.shade600
// ///                         : Colors.blue.shade500,
// ///                 borderRadius: BorderRadius.circular(4),
// ///                 border: Border.all(
// ///                   color: _isTriggerFocused ? Colors.white : Colors.transparent,
// ///                   width: 2,
// ///                 ),
// ///               ),
// ///               child: Row(
// ///                 mainAxisSize: MainAxisSize.min,
// ///                 children: [
// ///                   Text(
// ///                     'Menu',
// ///                     style: TextStyle(color: Colors.white),
// ///                   ),
// ///                   SizedBox(width: 8),
// ///                   Icon(
// ///                     _isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
// ///                     color: Colors.white,
// ///                   ),
// ///                 ],
// ///               ),
// ///             ),
// ///           ),
// ///           // NakedMenuContent will be rendered through NakedPortal in the app overlay
// ///           // with optimal positioning relative to the trigger
// ///           NakedMenuContent(
// ///             child: Container(
// ///               margin: EdgeInsets.only(top: 4),
// ///               decoration: BoxDecoration(
// ///                 color: Colors.white,
// ///                 borderRadius: BorderRadius.circular(4),
// ///                 boxShadow: [
// ///                   BoxShadow(
// ///                     color: Colors.black.withOpacity(0.1),
// ///                     blurRadius: 4,
// ///                     offset: Offset(0, 2),
// ///                   ),
// ///                 ],
// ///               ),
// ///               child: Column(
// ///                 mainAxisSize: MainAxisSize.min,
// ///                 children: [
// ///                   NakedMenuItem(
// ///                     onPressed: () {
// ///                       setState(() => _isOpen = false);
// ///                       print('Item 1 selected');
// ///                     },
// ///                     onHoverState: (isHovered) =>
// ///                       setState(() => _hoveredItemIndex = isHovered ? 0 : null),
// ///                     onFocusState: (isFocused) =>
// ///                       setState(() => _focusedItemIndex = isFocused ? 0 : null),
// ///                     child: _buildMenuItem(
// ///                       'Item 1',
// ///                       _hoveredItemIndex == 0,
// ///                       _focusedItemIndex == 0,
// ///                     ),
// ///                   ),
// ///                   NakedMenuItem(
// ///                     onPressed: () {
// ///                       setState(() => _isOpen = false);
// ///                       print('Item 2 selected');
// ///                     },
// ///                     onHoverState: (isHovered) =>
// ///                       setState(() => _hoveredItemIndex = isHovered ? 1 : null),
// ///                     onFocusState: (isFocused) =>
// ///                       setState(() => _focusedItemIndex = isFocused ? 1 : null),
// ///                     child: _buildMenuItem(
// ///                       'Item 2',
// ///                       _hoveredItemIndex == 1,
// ///                       _focusedItemIndex == 1,
// ///                     ),
// ///                   ),
// ///                   NakedMenuItem(
// ///                     onPressed: () {
// ///                       setState(() => _isOpen = false);
// ///                       print('Item 3 selected');
// ///                     },
// ///                     onHoverState: (isHovered) =>
// ///                       setState(() => _hoveredItemIndex = isHovered ? 2 : null),
// ///                     onFocusState: (isFocused) =>
// ///                       setState(() => _focusedItemIndex = isFocused ? 2 : null),
// ///                     child: _buildMenuItem(
// ///                       'Item 3',
// ///                       _hoveredItemIndex == 2,
// ///                       _focusedItemIndex == 2,
// ///                     ),
// ///                   ),
// ///                 ],
// ///               ),
// ///             ),
// ///           ),
// ///         ],
// ///       ),
// ///     );
// ///   }
// ///
// ///   Widget _buildMenuItem(String label, bool isHovered, bool isFocused) {
// ///     return Container(
// ///       width: double.infinity,
// ///       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// ///       color: isHovered
// ///           ? Colors.blue.withOpacity(0.1)
// ///           : isFocused
// ///               ? Colors.blue.withOpacity(0.05)
// ///               : Colors.transparent,
// ///       child: Text(label),
// ///     );
// ///   }
// /// }
// /// ```
// class NakedMenu extends StatefulWidget {
//   /// The child widget to display.
//   final Widget target;

//   /// The menu widget to display.
//   final Widget menu;

//   /// Whether the menu is open.
//   final bool open;

//   /// Called when the open state changes.
//   final ValueChanged<bool>? onOpenChanged;

//   /// Whether the menu is disabled.
//   final bool enabled;

//   /// Optional semantic label for accessibility.
//   final String? semanticLabel;

//   /// Whether to close the menu when an item is selected.
//   final bool closeOnSelect;

//   /// Whether to close the menu when clicked outside.
//   final bool closeOnClickOutside;

//   /// Whether to trap focus within the menu.
//   final bool trapFocus;

//   /// Whether to automatically focus the menu when opened.
//   final bool autofocus;

//   /// Offset from the anchor position.
//   final Offset offset;

//   /// The anchor position of the follower.
//   final Alignment followerAnchor;

//   /// The anchor position of the target.
//   final Alignment targetAnchor;

//   /// Create a naked menu.
//   ///
//   /// The [child] parameter is required.
//   const NakedMenu({
//     super.key,
//     required this.target,
//     required this.menu,
//     this.open = false,
//     this.onOpenChanged,
//     this.enabled = true,
//     this.semanticLabel,
//     this.closeOnSelect = true,
//     this.closeOnClickOutside = true,
//     this.trapFocus = true,
//     this.autofocus = true,
//     this.offset = const Offset(0, 4),
//     this.targetAnchor = Alignment.bottomLeft,
//     this.followerAnchor = Alignment.topLeft,
//   });

//   @override
//   State<NakedMenu> createState() => _NakedMenuState();
// }

// class _NakedMenuState extends State<NakedMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Semantics(
//       explicitChildNodes: true,
//       container: true,
//       label: widget.semanticLabel,
//       child: NakedTooltip(
//         visible: widget.open,
//         followerAnchor: widget.followerAnchor,
//         targetAnchor: widget.targetAnchor,
//         offset: widget.offset,
//         tooltipWidget: widget.menu,
//         child: widget.target,
//       ),
//     );
//   }
// }

// /// The scope that provides menu state to its descendants.
// class _NakedMenuScope extends InheritedWidget {
//   /// The menu widget.
//   final NakedMenu menu;

//   const _NakedMenuScope({
//     required this.menu,
//     required super.child,
//   });

//   /// Toggles the menu open state.
//   void toggleMenu() {
//     if (menu.onOpenChanged != null) {
//       menu.onOpenChanged!(!menu.open);
//     }
//   }

//   /// Closes the menu.
//   void closeMenu() {
//     if (menu.onOpenChanged != null && menu.open) {
//       menu.onOpenChanged!(false);
//     }
//   }

//   static _NakedMenuScope? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<_NakedMenuScope>();
//   }

//   @override
//   bool updateShouldNotify(_NakedMenuScope oldWidget) {
//     return menu.open != oldWidget.menu.open ||
//         menu.enabled != oldWidget.menu.enabled;
//   }
// }

// /// A trigger button for opening/closing NakedMenu.
// ///
// /// This component is typically used as the button that toggles the menu.
// // class NakedMenuTrigger extends StatelessWidget {
// //   /// The child widget to display.
// //   final Widget child;

// //   /// Called when hover state changes.
// //   final ValueChanged<bool>? onHoverState;

// //   /// Called when pressed state changes.
// //   final ValueChanged<bool>? onPressedState;

// //   /// Called when focus state changes.
// //   final ValueChanged<bool>? onFocusState;

// //   /// Called when the trigger is pressed.
// //   final VoidCallback? onPressed;

// //   /// Whether the trigger is disabled.
// //   final bool enabled;

// //   /// Optional semantic label for accessibility.
// //   final String? semanticLabel;

// //   /// The cursor to show when hovering over the trigger.
// //   final MouseCursor cursor;

// //   /// Whether to provide haptic feedback on tap.
// //   final bool enableHapticFeedback;

// //   /// Optional focus node to control focus behavior.
// //   final FocusNode? focusNode;

// //   /// Creates a naked menu trigger.
// //   ///
// //   /// The [child] parameter is required.
// //   const NakedMenuTrigger({
// //     super.key,
// //     required this.child,
// //     this.onHoverState,
// //     this.onPressedState,
// //     this.onFocusState,
// //     this.onPressed,
// //     this.enabled = true,
// //     this.semanticLabel,
// //     this.cursor = SystemMouseCursors.click,
// //     this.enableHapticFeedback = true,
// //     this.focusNode,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final menuScope = _NakedMenuScope.of(context);
// //     final isMenuEnabled = menuScope?.menu.enabled ?? false;
// //     final isInteractive = enabled || isMenuEnabled;
// //     final effectiveFocusNode = focusNode ?? FocusNode();
// //     final isOpen = menuScope?.menu.open ?? false;

// //     void handleTap() {
// //       if (isInteractive) {
// //         if (enableHapticFeedback) {
// //           HapticFeedback.lightImpact();
// //         }

// //         if (onPressed != null) {
// //           onPressed!();
// //         } else {
// //           menuScope?.toggleMenu();
// //         }
// //       }
// //     }

// //     return Semantics(
// //       button: true,
// //       enabled: isInteractive,
// //       label: semanticLabel ?? 'Menu button',
// //       expanded: isOpen,
// //       onTap: isInteractive ? handleTap : null,
// //       excludeSemantics: true,
// //       child: Focus(
// //         focusNode: effectiveFocusNode,
// //         onFocusChange: onFocusState,
// //         onKeyEvent: (node, event) {
// //           if (!isInteractive) return KeyEventResult.ignored;

// //           if (event is KeyDownEvent) {
// //             if (event.logicalKey == LogicalKeyboardKey.space ||
// //                 event.logicalKey == LogicalKeyboardKey.enter) {
// //               onPressedState?.call(true);
// //               return KeyEventResult.handled;
// //             } else if (event.logicalKey == LogicalKeyboardKey.arrowDown ||
// //                 event.logicalKey == LogicalKeyboardKey.arrowUp) {
// //               // Open menu on arrow down/up if closed
// //               if (!isOpen) {
// //                 menuScope?.toggleMenu();
// //               }
// //               return KeyEventResult.handled;
// //             }
// //           } else if (event is KeyUpEvent) {
// //             if (event.logicalKey == LogicalKeyboardKey.space ||
// //                 event.logicalKey == LogicalKeyboardKey.enter) {
// //               onPressedState?.call(false);
// //               handleTap();
// //               return KeyEventResult.handled;
// //             }
// //           }
// //           return KeyEventResult.ignored;
// //         },
// //         child: MouseRegion(
// //           cursor: isInteractive ? cursor : SystemMouseCursors.forbidden,
// //           onEnter: isInteractive ? (_) => onHoverState?.call(true) : null,
// //           onExit: isInteractive ? (_) => onHoverState?.call(false) : null,
// //           child: GestureDetector(
// //             behavior: HitTestBehavior.opaque,
// //             onTapDown: isInteractive ? (_) => onPressedState?.call(true) : null,
// //             onTapUp: isInteractive ? (_) => onPressedState?.call(false) : null,
// //             onTapCancel:
// //                 isInteractive ? () => onPressedState?.call(false) : null,
// //             onTap: isInteractive ? handleTap : null,
// //             child: child,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // /// A container for the menu items.
// // ///
// // /// This component is used to contain the selectable items in the menu.
// // class NakedMenuContent extends StatelessWidget {
// //   /// The child widget to display.
// //   final Widget child;

// //   /// Optional semantic label for accessibility.
// //   final String? semanticLabel;

// //   /// Optional focus node to control focus behavior.
// //   final FocusNode? focusNode;

// //   /// Creates a naked menu content.
// //   ///
// //   /// The [child] parameter is required.
// //   const NakedMenuContent({
// //     super.key,
// //     required this.child,
// //     this.semanticLabel,
// //     this.focusNode,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final menuScope = _NakedMenuScope.of(context);

// //     if (menuScope == null) {
// //       return child;
// //     }

// //     // Get target rectangle for positioning
// //     final state = context.findAncestorStateOfType<_NakedMenuState>();
// //     if (state == null || state._triggerRect == null) {
// //       return child;
// //     }

// //     return Builder(
// //       builder: (context) {
// //         final menuWidget = menuScope.menu;

// //         // Use NakedPortal to render content in overlay
// //         return NakedPortal(
// //           child: Material(
// //             color: Colors.transparent,
// //             child: NakedPositioning(
// //               target: state._triggerRect!,
// //               preferredPositions: menuWidget.preferredPositions,
// //               offset: menuWidget.offset,
// //               child: const Text('data'),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// /// An individual menu item.
// ///
// /// This component is typically used to create selectable items within a menu.
// class NakedMenuItem extends StatelessWidget {
//   /// The child widget to display.
//   final Widget child;

//   /// Called when hover state changes.
//   final ValueChanged<bool>? onHoverState;

//   /// Called when pressed state changes.
//   final ValueChanged<bool>? onPressedState;

//   /// Called when focus state changes.
//   final ValueChanged<bool>? onFocusState;

//   /// Called when the item is pressed.
//   final VoidCallback? onPressed;

//   /// Whether the item is disabled.
//   final bool enabled;

//   /// Optional semantic label for accessibility.
//   final String? semanticLabel;

//   /// The cursor to show when hovering over the item.
//   final MouseCursor cursor;

//   /// Whether to provide haptic feedback on tap.
//   final bool enableHapticFeedback;

//   /// Optional focus node to control focus behavior.
//   final FocusNode? focusNode;

//   /// Creates a naked menu item.
//   ///
//   /// The [child] parameter is required.
//   const NakedMenuItem({
//     super.key,
//     required this.child,
//     this.onHoverState,
//     this.onPressedState,
//     this.onFocusState,
//     this.onPressed,
//     this.enabled = false,
//     this.semanticLabel,
//     this.cursor = SystemMouseCursors.click,
//     this.enableHapticFeedback = true,
//     this.focusNode,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final menuScope = _NakedMenuScope.of(context);
//     final isMenuEnabled = menuScope?.menu.enabled ?? false;
//     final isInteractive = enabled || isMenuEnabled;
//     final effectiveFocusNode = focusNode ?? FocusNode();

//     void handleTap() {
//       if (isInteractive) {
//         if (enableHapticFeedback) {
//           HapticFeedback.lightImpact();
//         }

//         if (onPressed != null) {
//           onPressed!();
//         }

//         if (menuScope?.menu.closeOnSelect ?? false) {
//           menuScope?.closeMenu();
//         }
//       }
//     }

//     return Semantics(
//       button: true,
//       enabled: isInteractive,
//       label: semanticLabel,
//       onTap: isInteractive ? handleTap : null,
//       excludeSemantics: true,
//       child: Focus(
//         focusNode: effectiveFocusNode,
//         onFocusChange: onFocusState,
//         onKeyEvent: (node, event) {
//           if (!isInteractive) return KeyEventResult.ignored;

//           if (event is KeyDownEvent &&
//               (event.logicalKey == LogicalKeyboardKey.space ||
//                   event.logicalKey == LogicalKeyboardKey.enter)) {
//             onPressedState?.call(true);
//             return KeyEventResult.handled;
//           } else if (event is KeyUpEvent &&
//               (event.logicalKey == LogicalKeyboardKey.space ||
//                   event.logicalKey == LogicalKeyboardKey.enter)) {
//             onPressedState?.call(false);
//             handleTap();
//             return KeyEventResult.handled;
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
