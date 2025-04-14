// import 'package:flutter/material.dart';
// import 'package:naked/naked.dart';

// class NakedSelectExample extends StatefulWidget {
//   const NakedSelectExample({super.key});

//   @override
//   State<NakedSelectExample> createState() => _NakedSelectExampleState();
// }

// class _NakedSelectExampleState extends State<NakedSelectExample> {
//   bool _isOpen1 = false;
//   String? _selectedValue1;
//   final List<String> _options1 = [
//     'Option 1',
//     'Option 2',
//     'Option 3',
//     'Option 4',
//   ];

//   bool _isOpen2 = false;
//   Map<String, String>? _selectedValue2;
//   final List<Map<String, String>> _options2 = [
//     {'code': 'US', 'name': 'United States'},
//     {'code': 'CA', 'name': 'Canada'},
//     {'code': 'GB', 'name': 'United Kingdom'},
//     {'code': 'DE', 'name': 'Germany'},
//     {'code': 'JP', 'name': 'Japan'},
//   ];

//   bool _isOpen3 = false;
//   String? _selectedValue3;
//   final List<String> _options3 = List.generate(20, (i) => 'Item ${i + 1}');
//   String _filterText = '';

//   // State for styling
//   bool _isTrigger1Hovered = false;
//   bool _isTrigger1Focused = false;
//   bool _isTrigger1Pressed = false;
//   final Map<String, bool> _item1HoverStates = {};
//   final Map<String, bool> _item1FocusStates = {};

//   bool _isTrigger2Hovered = false;
//   bool _isTrigger2Focused = false;
//   bool _isTrigger2Pressed = false;
//   final Map<String, bool> _item2HoverStates = {};
//   final Map<String, bool> _item2FocusStates = {};

//   bool _isTrigger3Hovered = false;
//   bool _isTrigger3Focused = false;
//   bool _isTrigger3Pressed = false;
//   final Map<String, bool> _item3HoverStates = {};
//   final Map<String, bool> _item3FocusStates = {};

//   @override
//   Widget build(BuildContext context) {
//     // Filter options for search example
//     final filteredOptions3 = _options3
//         .where((option) =>
//             option.toLowerCase().contains(_filterText.toLowerCase()))
//         .toList();

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildSectionTitle('Basic Select (String Options)'),
//         NakedSelect<String>(
//           isOpen: _isOpen1,
//           onIsOpenChanged: (isOpen) => setState(() => _isOpen1 = isOpen),
//           selectedValue: _selectedValue1,
//           onSelectedValueChanged: (value) =>
//               setState(() => _selectedValue1 = value),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               NakedSelectTrigger(
//                 onHoverState: (h) => setState(() => _isTrigger1Hovered = h),
//                 onFocusState: (f) => setState(() => _isTrigger1Focused = f),
//                 onPressedState: (p) => setState(() => _isTrigger1Pressed = p),
//                 child: _buildTriggerVisual(
//                   value: _selectedValue1 ?? 'Select an option',
//                   isOpen: _isOpen1,
//                   isHovered: _isTrigger1Hovered,
//                   isFocused: _isTrigger1Focused,
//                   isPressed: _isTrigger1Pressed,
//                   color: Colors.teal,
//                 ),
//               ),
//               NakedSelectMenu(
//                 child: _buildMenuVisual<String>(
//                   options: _options1,
//                   selectedValue: _selectedValue1,
//                   itemBuilder: (option) => Text(option),
//                   valueGetter: (option) => option,
//                   itemHoverStates: _item1HoverStates,
//                   itemFocusStates: _item1FocusStates,
//                   color: Colors.teal,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 32),
//         _buildSectionTitle('Select with Map Options (Countries)'),
//         NakedSelect<Map<String, String>>(
//           isOpen: _isOpen2,
//           onIsOpenChanged: (isOpen) => setState(() => _isOpen2 = isOpen),
//           selectedValue: _selectedValue2,
//           onSelectedValueChanged: (value) =>
//               setState(() => _selectedValue2 = value),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               NakedSelectTrigger(
//                 onHoverState: (h) => setState(() => _isTrigger2Hovered = h),
//                 onFocusState: (f) => setState(() => _isTrigger2Focused = f),
//                 onPressedState: (p) => setState(() => _isTrigger2Pressed = p),
//                 child: _buildTriggerVisual(
//                   value: _selectedValue2?['name'] ?? 'Select a country',
//                   isOpen: _isOpen2,
//                   isHovered: _isTrigger2Hovered,
//                   isFocused: _isTrigger2Focused,
//                   isPressed: _isTrigger2Pressed,
//                   color: Colors.deepOrange,
//                 ),
//               ),
//               NakedSelectMenu(
//                 child: _buildMenuVisual<Map<String, String>>(
//                   options: _options2,
//                   selectedValue: _selectedValue2,
//                   itemBuilder: (option) => Text(option['name']!),
//                   valueGetter: (option) =>
//                       option['code']!, // Use code for identity
//                   itemHoverStates: _item2HoverStates,
//                   itemFocusStates: _item2FocusStates,
//                   color: Colors.deepOrange,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 32),
//         _buildSectionTitle('Select with Search/Filter (Long List)'),
//         NakedSelect<String>(
//           isOpen: _isOpen3,
//           onIsOpenChanged: (isOpen) {
//             setState(() => _isOpen3 = isOpen);
//             if (!isOpen) {
//               _filterText = ''; // Clear filter on close
//             }
//           },
//           selectedValue: _selectedValue3,
//           onSelectedValueChanged: (value) =>
//               setState(() => _selectedValue3 = value),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               NakedSelectTrigger(
//                 onHoverState: (h) => setState(() => _isTrigger3Hovered = h),
//                 onFocusState: (f) => setState(() => _isTrigger3Focused = f),
//                 onPressedState: (p) => setState(() => _isTrigger3Pressed = p),
//                 child: _buildTriggerVisual(
//                   value: _selectedValue3 ?? 'Select an item',
//                   isOpen: _isOpen3,
//                   isHovered: _isTrigger3Hovered,
//                   isFocused: _isTrigger3Focused,
//                   isPressed: _isTrigger3Pressed,
//                   color: Colors.indigo,
//                 ),
//               ),
//               NakedSelectMenu(
//                 // Add a TextField for filtering within the menu
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: const InputDecoration(
//                           hintText: 'Search...',
//                           isDense: true,
//                           border: OutlineInputBorder(),
//                         ),
//                         onChanged: (text) => setState(() => _filterText = text),
//                       ),
//                     ),
//                     _buildMenuVisual<String>(
//                       options: filteredOptions3,
//                       selectedValue: _selectedValue3,
//                       itemBuilder: (option) => Text(option),
//                       valueGetter: (option) => option,
//                       itemHoverStates: _item3HoverStates,
//                       itemFocusStates: _item3FocusStates,
//                       color: Colors.indigo,
//                       maxHeight: 200, // Limit height for scrolling
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 32),

//         // Focus management example
//         _buildSectionTitle('Focus and Keyboard Navigation'),
//         const FocusSelectExample(),

//         const SizedBox(height: 200), // Add space at the bottom

//         // Form Integration Example
//         _buildSectionTitle('Form Integration'),
//         const FormSelectExample(),
//       ],
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12.0),
//       child: Text(
//         title,
//         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget _buildTriggerVisual({
//     required String value,
//     required bool isOpen,
//     required bool isHovered,
//     required bool isFocused,
//     required bool isPressed,
//     required MaterialColor color,
//     bool hasError = false,
//   }) {
//     Color borderColor =
//         isFocused ? Colors.black.withOpacity(0.7) : Colors.transparent;
//     if (hasError) {
//       borderColor = Theme.of(context).colorScheme.error;
//     } else if (isFocused) {
//       borderColor = color.shade700; // Use accent color for focus border
//     }

//     Color bgColor = color.shade500;
//     if (isPressed) {
//       bgColor = color.shade700;
//     } else if (isHovered || isFocused) {
//       // Combine hover and focus for background highlight
//       bgColor = color.shade600;
//     }

//     return Container(
//       width: 250,
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//       decoration: BoxDecoration(
//         color: bgColor, // Use calculated background color
//         borderRadius: BorderRadius.circular(6), // Slightly more rounded
//         border: Border.all(
//           color: borderColor,
//           width:
//               isFocused || hasError ? 2 : 1.5, // Thicker border on focus/error
//         ),
//         boxShadow: isHovered && !isPressed // Add subtle shadow on hover
//             ? [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.2),
//                   blurRadius: 4,
//                   offset: const Offset(0, 2),
//                 ),
//               ]
//             : null,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(color: Colors.white),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Icon(
//             isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMenuVisual<T>({
//     required List<T> options,
//     required T? selectedValue,
//     required Widget Function(T option) itemBuilder,
//     required String Function(T option) valueGetter, // Used for state map keys
//     required Map<String, bool> itemHoverStates,
//     required Map<String, bool> itemFocusStates,
//     required MaterialColor color,
//     double maxHeight = 300,
//   }) {
//     return Container(
//       constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: 250),
//       margin: const EdgeInsets.only(top: 4),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(6), // Match trigger rounding
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 8,
//               offset: const Offset(0, 3))
//         ], // Slightly more prominent shadow
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: options.isEmpty
//               ? [
//                   const Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Text('No options found'))
//                 ]
//               : options.map((option) {
//                   final itemValueKey = valueGetter(option);
//                   final bool isSelected = selectedValue == option;
//                   final bool isItemHovered =
//                       itemHoverStates[itemValueKey] ?? false;
//                   final bool isItemFocused =
//                       itemFocusStates[itemValueKey] ?? false;

//                   return NakedSelectItem<T>(
//                     value: option,
//                     isSelected: isSelected,
//                     onHoverState: (hovered) =>
//                         setState(() => itemHoverStates[itemValueKey] = hovered),
//                     onFocusState: (focused) =>
//                         setState(() => itemFocusStates[itemValueKey] = focused),
//                     child: Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 12), // Increase padding slightly
//                       color: isItemFocused
//                           ? color.shade100 // More prominent focus color
//                           : isItemHovered
//                               ? color.shade50 // Subtle hover color
//                               : isSelected
//                                   ? color.shade50.withOpacity(0.5)
//                                   : Colors
//                                       .transparent, // Slight background if selected but not hovered/focused
//                       child: Row(
//                         children: [
//                           Expanded(child: itemBuilder(option)),
//                           if (isSelected)
//                             Icon(
//                               Icons.check,
//                               size: 18,
//                               color: color.shade700,
//                             ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }).toList(),
//         ),
//       ),
//     );
//   }
// }

// // New StatefulWidget for the Form Integration Example
// class FormSelectExample extends StatefulWidget {
//   const FormSelectExample({super.key});

//   @override
//   State<FormSelectExample> createState() => _FormSelectExampleState();
// }

// class _FormSelectExampleState extends State<FormSelectExample> {
//   final _formKey = GlobalKey<FormState>();
//   String? _selectedFruit;
//   bool _isOpen = false;

//   // Styling states
//   bool _isTriggerHovered = false;
//   bool _isTriggerFocused = false;
//   bool _isTriggerPressed = false;
//   final Map<String, bool> _itemHoverStates = {};
//   final Map<String, bool> _itemFocusStates = {};

//   final List<String> _fruitOptions = [
//     'Apple',
//     'Banana',
//     'Cherry',
//     'Date',
//     'Elderberry'
//   ];

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Form submitted with fruit: $_selectedFruit')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a fruit')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Using FormField to wrap NakedSelect for validation
//           FormField<String>(
//             initialValue: _selectedFruit,
//             validator: (value) {
//               if (value == null) {
//                 return 'Please select a fruit.';
//               }
//               return null;
//             },
//             onSaved: (value) {
//               // This could be useful if the FormField manages the state
//               // In this case, we manage _selectedFruit directly via NakedSelect's onChanged
//             },
//             builder: (FormFieldState<String> field) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   NakedSelect<String>(
//                     isOpen: _isOpen,
//                     onIsOpenChanged: (isOpen) =>
//                         setState(() => _isOpen = isOpen),
//                     selectedValue: field.value, // Use FormField value
//                     onSelectedValueChanged: (value) {
//                       setState(() {
//                         _selectedFruit = value; // Update local state
//                         field.didChange(value); // Update FormField state
//                       });
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         NakedSelectTrigger(
//                           onHoverState: (h) =>
//                               setState(() => _isTriggerHovered = h),
//                           onFocusState: (f) =>
//                               setState(() => _isTriggerFocused = f),
//                           onPressedState: (p) =>
//                               setState(() => _isTriggerPressed = p),
//                           child: _buildTriggerVisual(
//                             value: field.value ?? 'Select a fruit',
//                             isOpen: _isOpen,
//                             isHovered: _isTriggerHovered,
//                             isFocused: _isTriggerFocused,
//                             isPressed: _isTriggerPressed,
//                             color: Colors.blueGrey,
//                             hasError: field.hasError, // Indicate error state
//                           ),
//                         ),
//                         NakedSelectMenu(
//                           child: _buildMenuVisual<String>(
//                             options: _fruitOptions,
//                             selectedValue: field.value,
//                             itemBuilder: (option) => Text(option),
//                             valueGetter: (option) => option,
//                             itemHoverStates: _itemHoverStates,
//                             itemFocusStates: _itemFocusStates,
//                             color: Colors.blueGrey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   if (field.hasError)
//                     Padding(
//                       padding: const EdgeInsets.only(top: 8.0, left: 12.0),
//                       child: Text(
//                         field.errorText!,
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.error,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                 ],
//               );
//             },
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: _submitForm,
//             child: const Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }

//   // Re-using helper methods from _NakedSelectExampleState, adapt if needed
//   // Assuming _buildTriggerVisual and _buildMenuVisual are accessible or copied here
//   // Need to add hasError parameter to _buildTriggerVisual

//   Widget _buildTriggerVisual({
//     required String value,
//     required bool isOpen,
//     required bool isHovered,
//     required bool isFocused,
//     required bool isPressed,
//     required MaterialColor color,
//     bool hasError = false, // Added parameter
//   }) {
//     Color borderColor =
//         isFocused ? Colors.black.withOpacity(0.7) : Colors.transparent;
//     if (hasError) {
//       borderColor = Theme.of(context).colorScheme.error;
//     }

//     return Container(
//       width: 250,
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//       decoration: BoxDecoration(
//         color: isPressed
//             ? color.shade700
//             : isHovered
//                 ? color.shade600
//                 : color.shade500,
//         borderRadius: BorderRadius.circular(4),
//         border: Border.all(
//           color: borderColor,
//           width: 2,
//         ),
//         boxShadow: isHovered || isFocused
//             ? [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 3,
//                   offset: const Offset(0, 1),
//                 ),
//               ]
//             : null,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             value,
//             style: TextStyle(
//               color:
//                   hasError ? Theme.of(context).colorScheme.error : Colors.white,
//             ),
//           ),
//           Icon(
//             isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }

//   // Assuming _buildMenuVisual is defined similarly to the main example state
//   // This is a simplified placeholder - copy/adapt the full method
//   Widget _buildMenuVisual<T>({
//     required List<T> options,
//     required T? selectedValue,
//     required Widget Function(T) itemBuilder,
//     required String Function(T) valueGetter,
//     required Map<String, bool> itemHoverStates,
//     required Map<String, bool> itemFocusStates,
//     required MaterialColor color,
//     double maxHeight = 300,
//   }) {
//     return Container(
//       constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: 250),
//       margin: const EdgeInsets.only(top: 4),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(4),
//         boxShadow: [
//           BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)
//         ],
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: options.map((option) {
//             final String itemValue = valueGetter(option);
//             final bool isSelected = selectedValue == option;
//             final bool isHovered = itemHoverStates[itemValue] ?? false;
//             final bool isFocused = itemFocusStates[itemValue] ?? false;

//             return NakedSelectItem<T>(
//               value: option,
//               isSelected: isSelected,
//               onHoverState: (hovered) =>
//                   setState(() => itemHoverStates[itemValue] = hovered),
//               onFocusState: (focused) =>
//                   setState(() => itemFocusStates[itemValue] = focused),
//               child: Container(
//                 width: double.infinity,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                 color: isFocused
//                     ? color.shade100.withOpacity(0.5)
//                     : isHovered
//                         ? color.shade50.withOpacity(0.5)
//                         : Colors.transparent,
//                 child: DefaultTextStyle(
//                   style: TextStyle(
//                     color: Colors.black87,
//                     fontWeight: isSelected || isFocused
//                         ? FontWeight.bold
//                         : FontWeight.normal,
//                   ),
//                   child: itemBuilder(option),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

// class FocusSelectExample extends StatefulWidget {
//   const FocusSelectExample({super.key});

//   @override
//   State<FocusSelectExample> createState() => _FocusSelectExampleState();
// }

// class _FocusSelectExampleState extends State<FocusSelectExample> {
//   bool _isOpen = false;
//   String? _selectedValue;
//   String _lastAction = 'No action yet';

//   final List<Map<String, dynamic>> _options = [
//     {'id': 'small', 'label': 'Small', 'icon': Icons.crop_7_5},
//     {'id': 'medium', 'label': 'Medium', 'icon': Icons.crop_16_9},
//     {'id': 'large', 'label': 'Large', 'icon': Icons.crop_din},
//     {'id': 'xlarge', 'label': 'Extra Large', 'icon': Icons.aspect_ratio},
//   ];

//   // State for styling
//   bool _isTriggerHovered = false;
//   bool _isTriggerFocused = false;
//   bool _isTriggerPressed = false;
//   final Map<String, bool> _itemHoverStates = {};
//   final Map<String, bool> _itemFocusStates = {};

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Keyboard navigation instructions
//         Container(
//           padding: const EdgeInsets.all(16),
//           margin: const EdgeInsets.only(bottom: 20),
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: Colors.blue.shade200),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Icon(Icons.keyboard, color: Colors.blue.shade700),
//                   const SizedBox(width: 8),
//                   Text(
//                     'Keyboard Navigation',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue.shade800,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               const Wrap(
//                 spacing: 16,
//                 runSpacing: 8,
//                 children: [
//                   Text('• Tab: Focus trigger'),
//                   Text('• Enter/Space: Open menu'),
//                   Text('• ↑/↓: Navigate items'),
//                   Text('• Enter: Select item'),
//                   Text('• Esc: Close menu'),
//                 ],
//               ),
//             ],
//           ),
//         ),

//         // Status display
//         Container(
//           padding: const EdgeInsets.all(12),
//           margin: const EdgeInsets.only(bottom: 24),
//           decoration: BoxDecoration(
//             color: const Color(0xFFF3F4F6),
//             borderRadius: BorderRadius.circular(6),
//           ),
//           child: Row(
//             children: [
//               const Text(
//                 'Last Action:',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(width: 8),
//               Expanded(child: Text(_lastAction)),
//             ],
//           ),
//         ),

//         // Select with focus management
//         NakedSelect<String>(
//           isOpen: _isOpen,
//           onIsOpenChanged: (isOpen) {
//             setState(() {
//               _isOpen = isOpen;
//               if (isOpen) {
//                 _lastAction = 'Menu opened';
//               } else {
//                 _lastAction = 'Menu closed';
//               }
//             });
//           },
//           selectedValue: _selectedValue,
//           onSelectedValueChanged: (value) {
//             setState(() {
//               _selectedValue = value;
//               _lastAction = 'Selected: ${_getLabelById(value)}';
//             });
//           },
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               NakedSelectTrigger(
//                 onHoverState: (h) {
//                   setState(() {
//                     _isTriggerHovered = h;
//                     if (h) _lastAction = 'Trigger hovered';
//                   });
//                 },
//                 onFocusState: (f) {
//                   setState(() {
//                     _isTriggerFocused = f;
//                     if (f) _lastAction = 'Trigger focused';
//                   });
//                 },
//                 onPressedState: (p) {
//                   setState(() {
//                     _isTriggerPressed = p;
//                     if (p) _lastAction = 'Trigger pressed';
//                   });
//                 },
//                 child: _buildAccessibleTrigger(),
//               ),
//               NakedSelectMenu(
//                 child: _buildAccessibleMenu(),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildAccessibleTrigger() {
//     final String displayValue = _selectedValue != null
//         ? 'Size: ${_getLabelById(_selectedValue)}'
//         : 'Select a size';

//     return Container(
//       width: 300,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: _isTriggerPressed
//             ? Colors.grey.shade200
//             : _isTriggerHovered
//                 ? Colors.grey.shade50
//                 : Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(
//           color: _isTriggerFocused
//               ? Colors.blue
//               : _isOpen
//                   ? Colors.blue.shade300
//                   : Colors.grey.shade300,
//           width: _isTriggerFocused ? 2 : 1,
//         ),
//         boxShadow: _isTriggerFocused || _isOpen
//             ? [
//                 BoxShadow(
//                   color: Colors.blue.withOpacity(0.2),
//                   blurRadius: 4,
//                   offset: const Offset(0, 1),
//                 )
//               ]
//             : null,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               if (_selectedValue != null) ...[
//                 Icon(
//                   _getIconById(_selectedValue),
//                   color: Colors.blue,
//                   size: 20,
//                 ),
//                 const SizedBox(width: 8),
//               ],
//               Text(
//                 displayValue,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: _selectedValue != null
//                       ? Colors.black
//                       : Colors.grey.shade600,
//                 ),
//               ),
//             ],
//           ),
//           Icon(
//             _isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
//             color: _isTriggerFocused ? Colors.blue : Colors.grey.shade600,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAccessibleMenu() {
//     return Container(
//       width: 300,
//       constraints: const BoxConstraints(maxHeight: 250),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey.shade300),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: _options.length,
//         itemBuilder: (context, index) {
//           final option = _options[index];
//           final String id = option['id'];
//           final String label = option['label'];
//           final IconData icon = option['icon'];

//           final bool isSelected = _selectedValue == id;
//           final bool isHovered = _itemHoverStates[id] ?? false;
//           final bool isFocused = _itemFocusStates[id] ?? false;

//           return NakedSelectItem(
//             value: id,
//             onHoverState: (hover) {
//               setState(() {
//                 _itemHoverStates[id] = hover;
//                 if (hover) _lastAction = 'Hovering: $label';
//               });
//             },
//             onFocusState: (focus) {
//               setState(() {
//                 _itemFocusStates[id] = focus;
//                 if (focus) _lastAction = 'Focus on: $label';
//               });
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               color: isSelected
//                   ? Colors.blue.withOpacity(0.1)
//                   : isHovered
//                       ? Colors.grey.shade100
//                       : Colors.white,
//               child: Row(
//                 children: [
//                   Icon(
//                     icon,
//                     color: isSelected ? Colors.blue : Colors.grey.shade600,
//                     size: 20,
//                   ),
//                   const SizedBox(width: 12),
//                   Text(
//                     label,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight:
//                           isSelected ? FontWeight.bold : FontWeight.normal,
//                       color: isSelected ? Colors.blue : Colors.black,
//                     ),
//                   ),
//                   const Spacer(),
//                   if (isSelected)
//                     const Icon(
//                       Icons.check,
//                       color: Colors.blue,
//                       size: 18,
//                     ),
//                   if (isFocused && !isSelected)
//                     Icon(
//                       Icons.keyboard_tab,
//                       color: Colors.blue.withOpacity(0.3),
//                       size: 16,
//                     ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   String _getLabelById(String? id) {
//     if (id == null) return 'None';
//     final option = _options.firstWhere(
//       (opt) => opt['id'] == id,
//       orElse: () => {'label': 'Unknown'},
//     );
//     return option['label'] as String;
//   }

//   IconData _getIconById(String? id) {
//     if (id == null) return Icons.crop_7_5;
//     final option = _options.firstWhere(
//       (opt) => opt['id'] == id,
//       orElse: () => {'icon': Icons.crop_7_5},
//     );
//     return option['icon'] as IconData;
//   }
// }
