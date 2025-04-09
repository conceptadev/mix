# Naked

A collection of behavior-first UI components for Flutter that separate state management and interaction logic from visual rendering.

## Features

- Complete separation of state from presentation
- Fully customizable appearance
- Consistent interaction patterns
- Built-in accessibility support
- Comprehensive testing
- Core utilities for advanced component building

## Installation

Add this package to your pubspec.yaml:

```yaml
dependencies:
  naked: ^0.0.1-dev.0
```

## Usage

### NakedButton

A naked button component that manages interaction state while allowing complete visual customization.

```dart
import 'package:flutter/material.dart';
import 'package:naked/naked.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return NakedButton(
      onPressed: widget.onPressed,
      isLoading: widget.isLoading,
      semanticLabel: widget.text,
      onStateHover: (isHovered) => setState(() => _isHovered = isHovered),
      onStatePressed: (isPressed) => setState(() => _isPressed = isPressed),
      onStateFocus: (isFocused) => setState(() => _isFocused = isFocused),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _isPressed
              ? Colors.blue.shade700
              : _isHovered
                  ? Colors.blue.shade500
                  : Colors.blue.shade600,
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isPressed
              ? null
              : [BoxShadow(color: Colors.black26, blurRadius: _isHovered ? 4 : 2)],
        ),
        child: widget.isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: _isPressed ? FontWeight.bold : FontWeight.normal,
                ),
              ),
      ),
    );
  }
}
```

## Design Philosophy

The "naked" pattern provides components that:

1. Manage interaction behavior and accessibility
2. Provide direct callbacks for state changes
3. Delegate visual rendering entirely to the consumer

This approach allows for unlimited visual customization while maintaining consistent behavior and accessibility. For a detailed explanation of our approach, see the [Naked Component Development Guide](.context/plan/naked_component_development_guide.md).

## Component Architecture

Naked components use a callback-driven approach where:

1. **Direct Callbacks**: Components provide callbacks like `onStateHover`, `onStateFocus`, etc.
2. **Consumer-Managed State**: You maintain your own state variables using these callbacks
3. **Full Styling Control**: You implement your own visual rendering using state variables

This approach:
- Aligns with Flutter's existing patterns
- Gives you maximum flexibility
- Creates a simple mental model
- Reduces abstraction layers

### Core Utilities

Naked components leverage three powerful core utilities to enhance functionality:

1. **NakedPortal** - Renders content in app overlays with proper context inheritance
2. **NakedPositioning** - Handles optimal positioning relative to anchor elements
3. **NakedFocusManager** - Manages focus behavior and keyboard navigation

These utilities are used internally by components like NakedSelect and NakedMenu to provide robust functionality without compromising on customization.

For detailed implementation patterns, best practices, and examples, refer to our [Naked Component Development Guide](.context/plan/naked_component_development_guide.md).

## Accessibility

All Naked components implement proper accessibility features, including:
- Semantic roles for screen readers
- Keyboard navigation
- Focus management

When implementing custom styling, ensure you preserve these accessibility features by following the guidelines in our development guide.

## Available Components

- NakedAccordion - Expandable/collapsible content panels
- NakedButton - Interactive button behavior
- NakedCheckbox - Selectable checkbox with indeterminate state
- NakedMenu - Customizable dropdown menu with positioning and focus management
- NakedRadioButton/NakedRadioGroup - Exclusive selection controls
- NakedSelect - Customizable dropdown select with positioning and focus management
- NakedSlider - Range selection slider
- NakedTabs - Tab-based navigation component

## License

MIT
