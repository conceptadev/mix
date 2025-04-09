import 'package:flutter/material.dart';
import 'package:naked/naked.dart';

/// Example showcasing the enhanced NakedSelect component with:
/// - Type-ahead functionality
/// - Improved keyboard navigation (Home/End keys)
/// - Focus management for accessibility
/// - Dynamic positioning
class NakedSelectEnhancedExample extends StatefulWidget {
  const NakedSelectEnhancedExample({super.key});

  @override
  State<NakedSelectEnhancedExample> createState() =>
      _NakedSelectEnhancedExampleState();
}

class _NakedSelectEnhancedExampleState
    extends State<NakedSelectEnhancedExample> {
  bool _isOpen = false;
  String? _selectedCountry;

  // State variables for trigger styling
  bool _isTriggerHovered = false;
  bool _isTriggerFocused = false;
  bool _isTriggerPressed = false;

  // State variables for individual options
  int? _hoveredOptionIndex;
  int? _focusedOptionIndex;

  // Define countries for selection
  final List<String> _countries = [
    'Argentina',
    'Australia',
    'Brazil',
    'Canada',
    'China',
    'France',
    'Germany',
    'India',
    'Italy',
    'Japan',
    'Mexico',
    'Netherlands',
    'Russia',
    'South Korea',
    'Spain',
    'United Kingdom',
    'United States'
  ];

  // Last keyboard interaction for demo purposes
  String _lastKeyboardAction = 'None';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enhanced NakedSelect Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enhanced NakedSelect with Type-ahead',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Features demonstrated:\n'
              '• Type-ahead to quickly find options (start typing to select)\n'
              '• Home/End keys to jump to first/last items\n'
              '• Auto-focus on selected item when dropdown opens\n'
              '• Arrow keys to navigate between options\n'
              '• Space/Enter to select\n'
              '• Escape to close',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            Text(
              'Last keyboard action: $_lastKeyboardAction',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 24),
            const Text(
              'Select a country:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),

            // Enhanced NakedSelect implementation
            NakedSelect<String>(
              isOpen: _isOpen,
              onIsOpenChanged: (isOpen) => setState(() => _isOpen = isOpen),
              selectedValue: _selectedCountry,
              onSelectedValueChanged: (value) =>
                  setState(() => _selectedCountry = value),
              enableTypeAhead: true,
              focusSelectedItemOnOpen: true,
              trapFocus: true,
              autofocus: true,
              preferredPositions: const [
                AnchorPosition.bottomLeft,
                AnchorPosition.bottomRight,
                AnchorPosition.topLeft,
                AnchorPosition.topRight,
              ],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NakedSelectTrigger(
                    onStateHover: (isHovered) =>
                        setState(() => _isTriggerHovered = isHovered),
                    onStateFocus: (isFocused) {
                      setState(() => _isTriggerFocused = isFocused);
                      if (isFocused) {
                        setState(() => _lastKeyboardAction = 'Trigger focused');
                      }
                    },
                    onStatePressed: (isPressed) =>
                        setState(() => _isTriggerPressed = isPressed),
                    child: _buildTrigger(),
                  ),
                  NakedSelectMenu(
                    child: _buildSelectMenu(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            if (_selectedCountry != null)
              Text(
                'You selected: $_selectedCountry',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrigger() {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _isTriggerPressed
            ? Colors.blue.shade700
            : _isTriggerHovered
                ? Colors.blue.shade600
                : Colors.blue.shade500,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: _isTriggerFocused ? Colors.white : Colors.transparent,
          width: 2,
        ),
        boxShadow: _isTriggerHovered || _isTriggerFocused
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              _selectedCountry ?? 'Select a country',
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            _isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildSelectMenu() {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 300,
        maxWidth: 300,
      ),
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(_countries.length, (index) {
            final country = _countries[index];
            final isSelected = _selectedCountry == country;

            return NakedSelectItem<String>(
              value: country,
              isSelected: isSelected,
              onStateHover: (isHovered) => setState(
                  () => _hoveredOptionIndex = isHovered ? index : null),
              onStateFocus: (isFocused) {
                setState(() {
                  _focusedOptionIndex = isFocused ? index : null;
                  if (isFocused) {
                    _lastKeyboardAction = "Focus on '$country'";
                  }
                });
              },
              child: _buildSelectItem(
                country,
                isSelected,
                _hoveredOptionIndex == index,
                _focusedOptionIndex == index,
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildSelectItem(
      String label, bool isSelected, bool isHovered, bool isFocused) {
    final backgroundColor = isSelected
        ? Colors.blue.withOpacity(0.1)
        : isHovered
            ? Colors.grey.withOpacity(0.05)
            : isFocused
                ? Colors.grey.withOpacity(0.1)
                : Colors.transparent;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: backgroundColor,
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.blue.shade700 : Colors.black87,
              ),
            ),
          ),
          if (isSelected)
            Icon(
              Icons.check,
              size: 18,
              color: Colors.blue.shade700,
            ),
        ],
      ),
    );
  }
}
