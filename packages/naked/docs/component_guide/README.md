# Naked Components Guide

This guide provides documentation for the Naked component library, focusing on usage patterns, best practices, and technical details.

## Contents

- [State Callback Naming Convention](./state_callbacks.md) - Understanding the standardized callback naming pattern

## About Naked Components

Naked components are unstyled, headless UI components for Flutter that provide behavior without visual styling. They give you complete control over appearance while handling complex interaction patterns, accessibility, and state management.

Key features:
- State callbacks for fine-grained UI control
- Built-in keyboard accessibility
- Screen reader support
- Flexible composition

## Getting Started

To use the Naked library, add it to your `pubspec.yaml`:

```yaml
dependencies:
  naked: ^latest_version
```

Then import it in your Dart code:

```dart
import 'package:naked/naked.dart';
```

Basic usage example:

```dart
class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return NakedButton(
      onPressed: () {
        print('Button pressed!');
      },
      onHoverState: (isHovered) => setState(() => _isHovered = isHovered),
      onPressedState: (isPressed) => setState(() => _isPressed = isPressed),
      onFocusState: (isFocused) => setState(() => _isFocused = isFocused),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _isPressed
            ? Colors.blue.shade700
            : _isHovered
              ? Colors.blue.shade500
              : Colors.blue.shade400,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: _isFocused ? Colors.white : Colors.transparent,
            width: 2,
          ),
        ),
        child: Text(
          'Click Me',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
```