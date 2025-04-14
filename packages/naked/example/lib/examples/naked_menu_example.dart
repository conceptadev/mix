// import 'package:flutter/material.dart';
// import 'package:naked/naked.dart';

// class NakedMenuExample extends StatefulWidget {
//   const NakedMenuExample({super.key});

//   @override
//   State<NakedMenuExample> createState() => _NakedMenuExampleState();
// }

// class _NakedMenuExampleState extends State<NakedMenuExample> {
//   bool _isMenuOpen = false;
//   String _lastAction = 'None';

//   // State for trigger styling
//   final bool _isTriggerHovered = false;
//   final bool _isTriggerFocused = false;
//   final bool _isTriggerPressed = false;

//   // State for menu items (for styling, if needed)
//   final Map<String, bool> _itemHoverStates = {};
//   final Map<String, bool> _itemFocusStates = {};

//   // State for nested menu example
//   final bool _isSubmenuOpen = false;

//   void _handleAction(String action) {
//     setState(() {
//       _lastAction = 'Action: $action';
//       _isMenuOpen = false; // Close menu after action
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('$action selected')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Removed Scaffold/AppBar, returning content directly
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'NakedMenu Example',
//           style: Theme.of(context).textTheme.headlineSmall,
//         ),
//         const SizedBox(height: 8),
//         Text('Last Action: $_lastAction'),
//         const SizedBox(height: 24),
//         const Text(
//           'Click the button to open the menu. Uses NakedPortal & NakedPositioning.',
//           style: TextStyle(fontStyle: FontStyle.italic),
//         ),
//         const SizedBox(height: 16),
//         NakedMenu(
//           open: _isMenuOpen,
//           // onOpenChanged: (isOpen) => setState(() => _isMenuOpen = !isOpen),
//           // No onItemSelected here
//           menu: _buildMenuContentVisual(),
//           offset: const Offset(0, 4),
//           target: TextButton(
//             onPressed: () => setState(() => _isMenuOpen = !_isMenuOpen),
//             child: const Text('data'),
//           ),
//         ),
//         const SizedBox(height: 200), // Add space at the bottom for menu

//         const Divider(height: 40, thickness: 1),

//         // Focus/Keyboard Example Section
//         const Text(
//           'Focus & Keyboard Navigation Example',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         const Text(
//           'Use Tab to focus the trigger, Space/Enter to open/close.\n'
//           'Use Arrow keys to navigate items, Space/Enter to select.\n'
//           'Use Escape to close the menu.',
//           style: TextStyle(fontStyle: FontStyle.italic),
//         ),
//         const SizedBox(height: 16),
//         _FocusMenuExample(), // Add the focus example widget

//         // // const Divider(height: 40, thickness: 1),

//         // // // Nested Menu Example Section
//         // // const Text(
//         // //   'Nested Menu Example',
//         // //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         // // ),
//         // // const SizedBox(height: 8),
//         // // const Text(
//         // //   'Clicking "Share" opens a submenu.',
//         // //   style: TextStyle(fontStyle: FontStyle.italic),
//         // // ),
//         // // const SizedBox(height: 16),
//         // // _NestedMenuExample(), // Add the nested menu example widget
//       ],
//     );
//   }

//   // Builds the visual appearance of the trigger button
//   Widget _buildMenuButtonVisual() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       decoration: BoxDecoration(
//         color: _isTriggerPressed
//             ? Colors.indigo.shade700
//             : _isTriggerHovered
//                 ? Colors.indigo.shade600
//                 : Colors.indigo.shade500,
//         borderRadius: BorderRadius.circular(4),
//         border: Border.all(
//           color: _isTriggerFocused ? Colors.white : Colors.transparent,
//           width: 2,
//         ),
//         boxShadow: _isTriggerHovered || _isTriggerFocused
//             ? [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 4,
//                   offset: const Offset(0, 2),
//                 ),
//               ]
//             : null,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text('Actions ABC', style: TextStyle(color: Colors.white)),
//           const SizedBox(width: 8),
//           Icon(
//             _isMenuOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }

//   // Builds the visual appearance of the menu content (dropdown)
//   Widget _buildMenuContentVisual() {
//     return Container(
//       width: 200,
//       constraints: const BoxConstraints(
//         maxWidth: 200,
//         maxHeight: 300,
//       ),
//       margin: const EdgeInsets.only(top: 4),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(4),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       // Uses SingleChildScrollView if content might overflow
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ListTile(
//             //   title: const Text('Edit'),
//             //   leading: const Icon(Icons.edit),
//             //   focusColor: Colors.indigo,
//             //   hoverColor: Colors.indigo,
//             //   onTap: () => print('edit'),
//             // ),
//             _buildMenuItemVisual(
//                 'edit', 'Edit', Icons.edit, () => _handleAction('Edit')),
//             _buildMenuItemVisual('duplicate', 'Duplicate', Icons.copy,
//                 () => _handleAction('Duplicate')),
//             _buildMenuItemVisual(
//                 'share', 'Share', Icons.share, () => _handleAction('Share')),
//             _buildDivider(),
//             _buildMenuItemVisual('archive', 'Archive', Icons.archive,
//                 () => _handleAction('Archive')),
//             _buildMenuItemVisual(
//                 'delete', 'Delete', Icons.delete, () => _handleAction('Delete'),
//                 isDestructive: true),
//           ],
//         ),
//       ),
//     );
//   }

//   // Builds an individual NakedMenuItem with its visual child
//   Widget _buildMenuItemVisual(
//       String value, // Unique value for state tracking (optional here)
//       String label,
//       IconData icon,
//       VoidCallback onPressed,
//       {bool isDestructive = false,
//       bool enabled = true}) {
//     return NakedMenuItem(
//       onPressed: onPressed,
//       enabled: enabled,
//       onHoverState: (isHovered) =>
//           setState(() => _itemHoverStates[value] = isHovered),
//       onFocusState: (isFocused) =>
//           setState(() => _itemFocusStates[value] = isFocused),
//       // The child is the visual representation of the item
//       child: Builder(
//         builder: (context) {
//           // Use state to style the item visual
//           final bool isHovered = _itemHoverStates[value] ?? false;
//           final bool isFocused = _itemFocusStates[value] ?? false;
//           final Color textColor = isDestructive ? Colors.red : Colors.black87;
//           final Color iconColor =
//               isDestructive ? Colors.red : Colors.grey.shade600;

//           return Container(
//             width: double.infinity,
//             color: isFocused
//                 ? Colors.indigo.withOpacity(0.1)
//                 : isHovered
//                     ? Colors.grey.withOpacity(0.05)
//                     : Colors.transparent,
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: Row(
//               children: [
//                 Icon(icon, size: 18, color: iconColor),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Text(
//                     label,
//                     style: TextStyle(
//                       color: textColor,
//                       fontWeight:
//                           isFocused ? FontWeight.bold : FontWeight.normal,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildDivider() {
//     return Container(
//       height: 1,
//       color: Colors.grey.shade200,
//       margin: const EdgeInsets.symmetric(vertical: 4),
//     );
//   }
// }

// // New StatefulWidget for the Focus/Keyboard Example
// class _FocusMenuExample extends StatefulWidget {
//   @override
//   __FocusMenuExampleState createState() => __FocusMenuExampleState();
// }

// class __FocusMenuExampleState extends State<_FocusMenuExample> {
//   bool _isMenuOpen = false;
//   String _lastAction = 'None';

//   // States for styling
//   final bool _isTriggerHovered = false;
//   final bool _isTriggerFocused = false;
//   final bool _isTriggerPressed = false;
//   final Map<String, bool> _itemHoverStates = {};
//   final Map<String, bool> _itemFocusStates = {};

//   void _handleAction(String action) {
//     setState(() {
//       _lastAction = 'Action: $action';
//       _isMenuOpen = false;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('$action selected')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Last KB Action: $_lastAction'),
//         const SizedBox(height: 16),
//         NakedMenu(
//           open: _isMenuOpen,
//           target: TextButton(
//             style: TextButton.styleFrom(
//               backgroundColor: Colors.indigo,
//               foregroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
//             ),
//             onPressed: () => setState(() {
//               _isMenuOpen = !_isMenuOpen;
//             }),
//             child: const Text('data'),
//           ),
//           menu: _buildFocusMenuContentVisual(),
//         ),
//       ],
//     );
//   }

// //   // Re-use or adapt styling logic from the main example
//   Widget _buildFocusMenuButtonVisual() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       decoration: BoxDecoration(
//         color: _isTriggerPressed
//             ? Colors.teal.shade700
//             : _isTriggerHovered
//                 ? Colors.teal.shade600
//                 : Colors.teal.shade500,
//         borderRadius: BorderRadius.circular(4),
//         border: Border.all(
//           color: _isTriggerFocused ? Colors.white : Colors.transparent,
//           width: 2,
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text('Focus Menu', style: TextStyle(color: Colors.white)),
//           const SizedBox(width: 8),
//           Icon(
//             _isMenuOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }

//   final FocusNode focusNode = FocusNode();

//   Widget _buildFocusMenuContentVisual() {
//     // Simplified: copy/adapt the main example's _buildMenuContentVisual
//     // and _buildMenuItemVisual, ensuring state maps (_itemFocusStates etc.) are used
//     return Container(
//       width: 200,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(4),
//         boxShadow: [
//           BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)
//         ],
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           MenuItem(focusNode: focusNode),
//           // const Padding(
//           //   padding: EdgeInsets.all(8.0),
//           //   child: Text('Focus Menu'),
//           // ),

//           // TextButton(
//           //   onPressed: () => print('Delete'),
//           //   child: const Text('Delete'),
//           // ),
//           // TextButton(
//           //   onPressed: () => print('Edit'),
//           //   child: const Text('Edit'),
//           // ),
//           // TextButton(
//           //   onPressed: () => print('View'),
//           //   child: const Text('View'),
//           // ),

//           // _buildMenuItemVisual('focus_view', 'View', Icons.visibility,
//           //     () => _handleAction('View')),
//           // _buildMenuItemVisual(
//           //     'focus_edit', 'Edit', Icons.edit, () => _handleAction('Edit')),
//           // _buildMenuItemVisual('focus_delete', 'Delete', Icons.delete,
//           //     () => _handleAction('Delete'),
//           //     isDestructive: true),
//         ],
//       ),
//     );
//   }

// //   // Assume _buildMenuItemVisual exists here, adapted from the main example
// //   // Needs to use __FocusMenuExampleState's state maps
//   Widget _buildMenuItemVisual(
//       String value, String label, IconData icon, VoidCallback onPressed,
//       {bool isDestructive = false, bool enabled = true}) {
//     return NakedMenuItem(
//       onPressed: onPressed,
//       enabled: enabled,
//       onHoverState: (isHovered) =>
//           setState(() => _itemHoverStates[value] = isHovered),
//       onFocusState: (isFocused) {
//         setState(() => _itemFocusStates[value] = isFocused);
//         // Provide feedback when item gains focus via keyboard
//         if (isFocused) {
//           setState(() => _lastAction = '$label Focused');
//         }
//       },
//       child: Builder(
//         builder: (context) {
//           final bool isHovered = _itemHoverStates[value] ?? false;
//           final bool isFocused = _itemFocusStates[value] ?? false;
//           final Color textColor = isDestructive ? Colors.red : Colors.black87;
//           final Color iconColor =
//               isDestructive ? Colors.red : Colors.grey.shade600;

//           return Container(
//             width: double.infinity,
//             color: isFocused
//                 ? Colors.teal.withOpacity(0.1)
//                 : isHovered
//                     ? Colors.grey.withOpacity(0.05)
//                     : Colors.transparent,
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: Row(
//               children: [
//                 Icon(icon, size: 18, color: iconColor),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Text(
//                     label,
//                     style: TextStyle(
//                       color: textColor,
//                       fontWeight:
//                           isFocused ? FontWeight.bold : FontWeight.normal,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class MenuItem extends StatefulWidget {
//   const MenuItem({
//     super.key,
//     required this.focusNode,
//   });

//   final FocusNode focusNode;

//   @override
//   State<MenuItem> createState() => _MenuItemState();
// }

// class _MenuItemState extends State<MenuItem> {
//   bool _isFocused = false;
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return NakedButton(
//       // focusNode: widget.focusNode,
//       onPressed: () => print('View'),
//       onHoverState: (isHovered) => setState(() {
//         print('isHovered: $isHovered');
//         _isHovered = isHovered;
//       }),
//       onFocusState: (isFocused) => setState(() {
//         print('isFocused: $isFocused');
//         _isFocused = isFocused;
//       }),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         child: Row(
//           spacing: 8,
//           children: [
//             Icon(
//               Icons.edit,
//               size: 18,
//               color: _isFocused
//                   ? Colors.indigo
//                   : _isHovered
//                       ? Colors.indigo
//                       : Colors.grey,
//             ),
//             const Text('Edit'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // // --- Nested Menu Example ---

// // class _NestedMenuExample extends StatefulWidget {
// //   @override
// //   __NestedMenuExampleState createState() => __NestedMenuExampleState();
// // }

// // class __NestedMenuExampleState extends State<_NestedMenuExample> {
// //   bool _isMainMenuOpen = false;
// //   bool _isSubmenuOpen = false;
// //   String _lastAction = 'None';

// //   // Main menu trigger/item states
// //   bool _mainTriggerHovered = false;
// //   bool _mainTriggerFocused = false;
// //   bool _mainTriggerPressed = false;
// //   final Map<String, bool> _mainItemHoverStates = {};
// //   final Map<String, bool> _mainItemFocusStates = {};

// //   // Submenu trigger/item states (if needed for styling)
// //   bool _subTriggerHovered = false;
// //   bool _subTriggerFocused = false;
// //   final Map<String, bool> _subItemHoverStates = {};
// //   final Map<String, bool> _subItemFocusStates = {};

// //   void _handleMainAction(String action) {
// //     setState(() {
// //       _lastAction = 'Action: $action';
// //       _isMainMenuOpen = false; // Close main menu
// //       _isSubmenuOpen = false; // Ensure submenu is closed too
// //     });
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text('$action selected')),
// //     );
// //   }

// //   void _handleSubmenuAction(String action) {
// //     setState(() {
// //       _lastAction = 'Sub Action: $action';
// //       _isMainMenuOpen = false; // Close parent menu
// //       _isSubmenuOpen = false; // Close submenu
// //     });
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text('$action selected')),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text('Last Nested Action: $_lastAction'),
// //         const SizedBox(height: 16),
// //         NakedMenu(
// //           open: _isMainMenuOpen,
// //           onOpenChanged: (isOpen) {
// //             setState(() {
// //               _isMainMenuOpen = isOpen;
// //               if (!isOpen)
// //                 _isSubmenuOpen = false; // Close submenu if main closes
// //             });
// //           },
// //           preferredPositions: const [AnchorPosition.bottomLeft],
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               NakedMenuTrigger(
// //                 onHoverState: (h) => setState(() => _mainTriggerHovered = h),
// //                 onFocusState: (f) => setState(() => _mainTriggerFocused = f),
// //                 onPressedState: (p) => setState(() => _mainTriggerPressed = p),
// //                 child: _buildNestedMenuTriggerVisual(),
// //               ),
// //               NakedMenuContent(
// //                 child: _buildNestedMainMenuContent(),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildNestedMenuTriggerVisual() {
// //     // Adapt from _buildFocusMenuButtonVisual or _buildMenuButtonVisual
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //       decoration: BoxDecoration(
// //         color: _mainTriggerPressed
// //             ? Colors.red.shade700
// //             : _mainTriggerHovered
// //                 ? Colors.red.shade600
// //                 : Colors.red.shade500,
// //         borderRadius: BorderRadius.circular(4),
// //         border: Border.all(
// //           color: _mainTriggerFocused ? Colors.white : Colors.transparent,
// //           width: 2,
// //         ),
// //       ),
// //       child: Row(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           const Text('Nested Menu Trigger',
// //               style: TextStyle(color: Colors.white)),
// //           const SizedBox(width: 8),
// //           Icon(
// //             _isMainMenuOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
// //             color: Colors.white,
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildNestedMainMenuContent() {
// //     // Container for the main menu items
// //     return Container(
// //       width: 200,
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(4),
// //         boxShadow: [
// //           BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)
// //         ],
// //         border: Border.all(color: Colors.grey.shade300),
// //       ),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           _buildMainMenuItem('main_view', 'View', Icons.visibility,
// //               () => _handleMainAction('View')),
// //           _buildSubmenuTriggerItem(
// //               'share', 'Share', Icons.share), // Our special trigger item
// //           _buildMainMenuItem('main_delete', 'Delete', Icons.delete,
// //               () => _handleMainAction('Delete'),
// //               isDestructive: true),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildMainMenuItem(
// //       String value, String label, IconData icon, VoidCallback onPressed,
// //       {bool isDestructive = false}) {
// //     // Adapt from previous _buildMenuItemVisual, using main state maps
// //     return NakedMenuItem(
// //         onPressed: onPressed,
// //         onHoverState: (h) => setState(() => _mainItemHoverStates[value] = h),
// //         onFocusState: (f) => setState(() => _mainItemFocusStates[value] = f),
// //         child: Builder(builder: (context) {
// //           final isHovered = _mainItemHoverStates[value] ?? false;
// //           final isFocused = _mainItemFocusStates[value] ?? false;
// //           final textColor = isDestructive ? Colors.red : Colors.black87;
// //           final iconColor = isDestructive ? Colors.red : Colors.grey.shade600;
// //           return Container(
// //             width: double.infinity,
// //             color: isFocused
// //                 ? Colors.red.withOpacity(0.1)
// //                 : isHovered
// //                     ? Colors.grey.withOpacity(0.05)
// //                     : Colors.transparent,
// //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //             child: Row(children: [
// //               Icon(icon, size: 18, color: iconColor),
// //               const SizedBox(width: 12),
// //               Expanded(
// //                   child: Text(label,
// //                       style: TextStyle(
// //                           color: textColor,
// //                           fontWeight: isFocused
// //                               ? FontWeight.bold
// //                               : FontWeight.normal))),
// //             ]),
// //           );
// //         }));
// //   }

// //   Widget _buildSubmenuTriggerItem(String value, String label, IconData icon) {
// //     // This item visually looks like a menu item but contains a nested NakedMenu
// //     return NakedMenu(
// //       // Nested Menu
// //       open: _isSubmenuOpen,
// //       onOpenChanged: (isOpen) => setState(() => _isSubmenuOpen = isOpen),
// //       // Use known valid positions and remove const from list
// //       preferredPositions: const [
// //         AnchorPosition.bottomLeft,
// //         AnchorPosition.bottomRight,
// //         AnchorPosition.topLeft,
// //         AnchorPosition.topRight,
// //       ],
// //       offset: const Offset(4, -8), // Adjust offset slightly
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           NakedMenuTrigger(
// //             onHoverState: (h) => setState(() => _subTriggerHovered = h),
// //             onFocusState: (f) => setState(() => _subTriggerFocused = f),
// //             // No onPressed here, hover/focus triggers open via onIsOpenChanged logic (can be added if click needed)
// //             child: Builder(builder: (context) {
// //               // Visually mimics a main menu item, potentially indicating nesting
// //               final isHovered = _subTriggerHovered;
// //               final isFocused = _subTriggerFocused;
// //               return Container(
// //                 width: double.infinity,
// //                 color: isFocused
// //                     ? Colors.red.withOpacity(0.1)
// //                     : isHovered
// //                         ? Colors.grey.withOpacity(0.05)
// //                         : Colors.transparent,
// //                 padding:
// //                     const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //                 child: Row(children: [
// //                   Icon(icon, size: 18, color: Colors.grey.shade600),
// //                   const SizedBox(width: 12),
// //                   Expanded(
// //                       child: Text(label,
// //                           style: TextStyle(
// //                               fontWeight: isFocused
// //                                   ? FontWeight.bold
// //                                   : FontWeight.normal))),
// //                   const Icon(Icons.arrow_right,
// //                       size: 20, color: Colors.grey), // Indicator for submenu
// //                 ]),
// //               );
// //             }),
// //           ),
// //           NakedMenuContent(
// //             child: _buildSubmenuContent(), // Content of the nested menu
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildSubmenuContent() {
// //     // Actual content of the submenu
// //     return Container(
// //       width: 180, // Slightly narrower maybe
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(4),
// //         boxShadow: [
// //           BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)
// //         ],
// //         border: Border.all(color: Colors.grey.shade300),
// //       ),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           _buildSubmenuItem('sub_email', 'Email', Icons.email,
// //               () => _handleSubmenuAction('Email')),
// //           _buildSubmenuItem('sub_link', 'Copy Link', Icons.link,
// //               () => _handleSubmenuAction('Copy Link')),
// //           _buildSubmenuItem('sub_message', 'Message', Icons.message,
// //               () => _handleSubmenuAction('Message')),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildSubmenuItem(
// //       String value, String label, IconData icon, VoidCallback onPressed) {
// //     // Adapt from _buildMenuItemVisual, using sub state maps
// //     return NakedMenuItem(
// //         onPressed: onPressed,
// //         onHoverState: (h) => setState(() => _subItemHoverStates[value] = h),
// //         onFocusState: (f) => setState(() => _subItemFocusStates[value] = f),
// //         child: Builder(builder: (context) {
// //           final isHovered = _subItemHoverStates[value] ?? false;
// //           final isFocused = _subItemFocusStates[value] ?? false;
// //           return Container(
// //             width: double.infinity,
// //             color: isFocused
// //                 ? Colors.red.withOpacity(0.1)
// //                 : isHovered
// //                     ? Colors.grey.withOpacity(0.05)
// //                     : Colors.transparent,
// //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //             child: Row(children: [
// //               Icon(icon, size: 18, color: Colors.grey.shade600),
// //               const SizedBox(width: 12),
// //               Expanded(
// //                   child: Text(label,
// //                       style: TextStyle(
// //                           fontWeight: isFocused
// //                               ? FontWeight.bold
// //                               : FontWeight.normal))),
// //             ]),
// //           );
// //         }));
// //   }
// // }
// // // --- End Nested Menu Example ---
