---
title: Naked Component Development Guide
created: 2025-04-01T18:15:19-0400
updated: 2025-04-01T18:15:19-0400
type: guide
tags: [development, documentation, naked-components]
---

# Naked Component Development Guide

## Introduction

This guide provides comprehensive documentation for developing components using the Naked component architecture. It replaces the previous headless component guide and reflects our transition to a more intuitive, callback-driven approach that separates behavior from presentation while maintaining accessibility and proper interaction patterns.

## Table of Contents

1. [Philosophy and Principles](#philosophy-and-principles)
2. [Callback-Driven Architecture](#callback-driven-architecture)
3. [Component Structure](#component-structure)
4. [State Management Patterns](#state-management-patterns)
5. [Accessibility Implementation](#accessibility-implementation)
6. [Keyboard Navigation](#keyboard-navigation)
7. [Testing Guidelines](#testing-guidelines)
8. [Example Implementations](#example-implementations)
9. [Migration from Headless to Naked](#migration-from-headless-to-naked)
10. [Best Practices](#best-practices)

## Philosophy and Principles

### Core Philosophy: Separation of Behavior from Presentation

The Naked component architecture is built on the fundamental principle of separating interactive behavior from visual presentation. This approach allows developers to:

1. **Focus on design** without reimplementing complex interaction patterns
2. **Avoid fighting against** built-in styles from Material or Cupertino widgets
3. **Create custom UI components** that match exact design specifications
4. **Maintain accessibility** without compromising on design

### Why "Naked" instead of "Headless"

We've chosen to rebrand our components from "Headless" to "Naked" to better reflect their nature:

1. **More descriptive**: The term "Naked" better conveys that these components provide behavior without appearance
2. **Less confusing**: "Headless" has multiple meanings in software development
3. **Positive framing**: "Naked" suggests a blank canvas ready for styling, rather than something missing a part

### Design Principles

All Naked components follow these core design principles:

1. **Behavior First**: Components handle complex interaction patterns, state transitions, and accessibility concerns
2. **Zero Styling**: Components never impose any visual styling decisions
3. **Direct Callbacks**: State changes are communicated through simple, direct callbacks
4. **Consumer Control**: The consumer has complete control over state management and visual rendering
5. **Accessibility by Default**: All components implement proper accessibility without requiring additional work

## Callback-Driven Architecture

### The Callback Approach

Naked components use a direct callback approach for state management:

1. Components provide callbacks for all relevant state changes (`onStateHover`, `onStateFocus`, etc.)
2. Consumers use these callbacks to update their own state variables
3. Consumers use these state variables to control the appearance of the component

This approach:

- Aligns with Flutter's existing patterns (like `ValueChanged<T>`)
- Creates a simple mental model for developers
- Gives consumers maximum flexibility
- Reduces abstraction and indirection

### Standard Callback Pattern

All Naked components follow this standard callback pattern:

```dart
// Core functionality callback
onPressed: () => doSomething(),

// State callbacks
onStateHover: (isHovered) => setState(() => _isHovered = isHovered),
onStateFocus: (isFocused) => setState(() => _isFocused = isFocused),
onStatePressed: (isPressed) => setState(() => _isPressed = isPressed),
```

### Consumer-Managed State

Unlike the previous builder-based approach, Naked components delegate state management entirely to the consumer:

```dart
// Consumer-managed state variables
bool _isHovered = false;
bool _isPressed = false;
bool _isFocused = false;

// Using state variables for styling
Container(
  decoration: BoxDecoration(
    color: _isPressed
        ? pressedColor
        : _isHovered
            ? hoveredColor
            : defaultColor,
    border: Border.all(
      color: _isFocused ? focusedBorderColor : borderColor,
      width: _isFocused ? 2.0 : 1.0,
    ),
  ),
  child: Text('Button Label'),
)
```

## Component Structure

### Basic Template

All Naked components follow this basic structure:

```dart
class Naked[Component] extends StatelessWidget {
  // Child widget
  final Widget child;

  // Core functionality callbacks
  final ValueChanged<T>? onChange;

  // State callbacks
  final ValueChanged<bool>? onStateHover;
  final ValueChanged<bool>? onStatePressed;
  final ValueChanged<bool>? onStateFocus;

  // Component-specific properties
  final bool isProp1;
  final bool isProp2;

  // Standard properties
  final bool isDisabled;
  final String? semanticLabel;
  final MouseCursor cursor;
  final FocusNode? focusNode;

  const Naked[Component]({
    super.key,
    required this.child,
    this.onChange,
    this.onStateHover,
    this.onStatePressed,
    this.onStateFocus,
    this.isProp1 = false,
    this.isProp2 = false,
    this.isDisabled = false,
    this.semanticLabel,
    this.cursor = SystemMouseCursors.click,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    // Implementation
  }
}
```

### Layered Implementation

All interactive Naked components use a layered implementation approach:

1. **Semantics Layer**: Provides accessibility information
2. **Focus Layer**: Handles keyboard focus and navigation
3. **Mouse Region Layer**: Manages hover state
4. **Gesture Layer**: Handles touch/click interactions
5. **Child Layer**: The consumer-provided visual representation

```dart
@override
Widget build(BuildContext context) {
  final isInteractive = !isDisabled && onChange != null;
  final effectiveFocusNode = focusNode ?? FocusNode();
  
  return Semantics(
    // Accessibility properties
    button: true,  // Component-specific role
    enabled: isInteractive,
    label: semanticLabel,
    onTap: isInteractive ? handleTap : null,
    excludeSemantics: true,
    child: Focus(
      focusNode: effectiveFocusNode,
      onFocusChange: onStateFocus,
      onKeyEvent: (node, event) {
        // Keyboard event handling
      },
      child: MouseRegion(
        cursor: isInteractive ? cursor : SystemMouseCursors.forbidden,
        onEnter: isInteractive ? (_) => onStateHover?.call(true) : null,
        onExit: isInteractive ? (_) => onStateHover?.call(false) : null,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: isInteractive ? (_) => onStatePressed?.call(true) : null,
          onTapUp: isInteractive ? (_) => onStatePressed?.call(false) : null,
          onTapCancel: isInteractive ? () => onStatePressed?.call(false) : null,
          onTap: isInteractive ? handleTap : null,
          child: child,
        ),
      ),
    ),
  );
}
```

### Property Naming Conventions

Naked components follow these property naming conventions:

1. **State properties**: Use `is` prefix for boolean state (e.g., `isDisabled`, `isChecked`)
2. **Callbacks**: 
   - Core functionality: `onAction` (e.g., `onPressed`, `onChanged`)
   - State changes: `onStateX` (e.g., `onStateHover`, `onStateFocus`)
3. **Required widgets**: Name them based on their role (e.g., `child`, `label`, `icon`)

## State Management Patterns

### Individual Component State

For individual components, the state management pattern is straightforward:

```dart
class MyCustomButton extends StatefulWidget {
  @override
  _MyCustomButtonState createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return NakedButton(
      onPressed: () {
        // Handle press
      },
      onStateHover: (isHovered) => setState(() => _isHovered = isHovered),
      onStatePressed: (isPressed) => setState(() => _isPressed = isPressed),
      onStateFocus: (isFocused) => setState(() => _isFocused = isFocused),
      child: Container(
        // Styling based on state variables
      ),
    );
  }
}
```

### Compound Component State

For compound components (like AccordionItem within Accordion), we use a layered approach:

1. **Parent component**: Manages shared state using InheritedWidget
2. **Child components**: Access parent state through the InheritedWidget
3. **Override capability**: Child components can override parent state when needed

Example using NakedAccordion and NakedAccordionItem:

```dart
// Parent component (simplified)
class NakedAccordion extends StatelessWidget {
  final Set<Object> expandedValues;
  final ValueChanged<Set<Object>>? onExpandedValuesChanged;
  
  @override
  Widget build(BuildContext context) {
    return _NakedAccordionScope(
      expandedValues: expandedValues,
      onExpandedValuesChanged: onExpandedValuesChanged,
      child: child,
    );
  }
}

// Child component (simplified)
class NakedAccordionItem extends StatelessWidget {
  final Object value;
  final bool? isExpanded; // Optional override
  
  @override
  Widget build(BuildContext context) {
    final accordionScope = _NakedAccordionScope.of(context);
    final isItemExpanded = isExpanded ?? 
        accordionScope?.isItemExpanded(value) ?? false;
    
    // Use isItemExpanded for rendering
  }
}
```

## Accessibility Implementation

### Core Accessibility Principles

All Naked components must implement these core accessibility features:

1. **Semantic Roles**: Provide appropriate roles (button, checkbox, etc.)
2. **State Information**: Communicate component state (checked, expanded, etc.)
3. **Labels**: Support descriptive labels via `semanticLabel`
4. **Navigation**: Support keyboard navigation and focus
5. **Interaction**: Ensure all interactions are accessible

### Component-Specific Semantics

Each component type requires specific semantic properties:

- **Button**: `button: true`
- **Checkbox**: `checked: isChecked`
- **Radio**: `checked: isSelected, inMutuallyExclusiveGroup: true`
- **Accordion**: `expandable: true, expanded: isExpanded`

### Example Accessibility Implementation

```dart
Semantics(
  button: true,
  enabled: isInteractive,
  label: semanticLabel,
  onTap: isInteractive ? handleTap : null,
  excludeSemantics: true,
  child: // Rest of the component
)
```

## Keyboard Navigation

### Focus Management

All interactive Naked components must implement proper focus management:

1. **Focus Node**: Accept an optional `focusNode` parameter
2. **Focus Change**: Notify via `onStateFocus` callback
3. **Focus Visibility**: Support focus indication (consumer responsibility)

```dart
Focus(
  focusNode: focusNode ?? FocusNode(),
  onFocusChange: onStateFocus,
  child: // Rest of the component
)
```

### Keyboard Event Handling

Components must respond to appropriate keyboard events:

- **Space/Enter**: Activate the component (e.g., press a button)
- **Arrow Keys**: Navigate within composite components
- **Escape**: Cancel or close (where appropriate)

```dart
Focus(
  onKeyEvent: (node, event) {
    if (!isInteractive) return KeyEventResult.ignored;
    
    if (event is KeyDownEvent &&
        (event.logicalKey == LogicalKeyboardKey.space ||
         event.logicalKey == LogicalKeyboardKey.enter)) {
      onStatePressed?.call(true);
      return KeyEventResult.handled;
    } else if (event is KeyUpEvent &&
              (event.logicalKey == LogicalKeyboardKey.space ||
               event.logicalKey == LogicalKeyboardKey.enter)) {
      onStatePressed?.call(false);
      handleTap();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  },
  child: // Rest of the component
)
```

## Testing Guidelines

### Testing Principles

When testing Naked components, focus on:

1. **Behavior verification**: Test that callbacks are called correctly
2. **State management**: Test that state changes propagate correctly
3. **Accessibility**: Test that semantics are applied correctly
4. **Keyboard navigation**: Test keyboard event handling

### Basic Test Structure

```dart
testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
  bool wasPressed = false;
  
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: NakedButton(
          onPressed: () => wasPressed = true,
          child: Container(width: 100, height: 50),
        ),
      ),
    ),
  );
  
  await tester.tap(find.byType(NakedButton));
  await tester.pump();
  
  expect(wasPressed, true);
});
```

### Testing State Callbacks

```dart
testWidgets('calls onStateHover when hovered', (WidgetTester tester) async {
  bool isHovered = false;
  
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: NakedButton(
          onPressed: () {},
          onStateHover: (hover) => isHovered = hover,
          child: Container(width: 100, height: 50),
        ),
      ),
    ),
  );
  
  final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
  await gesture.addPointer(location: Offset.zero);
  await gesture.moveTo(tester.getCenter(find.byType(NakedButton)));
  await tester.pump();
  
  expect(isHovered, true);
});
```

## Example Implementations

This section provides example implementations for common component patterns.

### Basic Button Example

```dart
class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
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
      onStateHover: (hover) => setState(() => _isHovered = hover),
      onStatePressed: (pressed) => setState(() => _isPressed = pressed),
      onStateFocus: (focused) => setState(() => _isFocused = focused),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _isPressed
              ? Colors.blue.shade800
              : _isHovered
                  ? Colors.blue.shade600
                  : Colors.blue.shade500,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: _isFocused ? Colors.white : Colors.transparent,
            width: 2,
          ),
          boxShadow: _isPressed
              ? []
              : [BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 4,
                )],
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
```

### Checkbox Example

```dart
class CustomCheckbox extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  
  const CustomCheckbox({
    Key? key,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);
  
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;
  
  @override
  Widget build(BuildContext context) {
    return NakedCheckbox(
      isChecked: widget.isChecked,
      onChanged: widget.onChanged,
      onStateHover: (hover) => setState(() => _isHovered = hover),
      onStatePressed: (pressed) => setState(() => _isPressed = pressed),
      onStateFocus: (focused) => setState(() => _isFocused = focused),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: widget.isChecked
              ? Colors.blue.shade600
              : _isPressed
                  ? Colors.grey.shade300
                  : _isHovered
                      ? Colors.grey.shade100
                      : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: _isFocused
                ? Colors.blue.shade700
                : widget.isChecked
                    ? Colors.blue.shade600
                    : Colors.grey.shade400,
            width: _isFocused ? 2 : 1,
          ),
        ),
        child: widget.isChecked
            ? Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
```

## Migration from Headless to Naked

This section provides guidance for migrating from the old Headless components to the new Naked components.

### Key Differences

1. **No Builders**: Naked components use direct `child` widgets instead of builder functions
2. **Direct Callbacks**: Naked components provide direct state callbacks instead of state objects
3. **No Controllers**: Naked components don't use controllers for state management
4. **Simpler API**: Naked components have fewer abstractions and a more intuitive API

### Migration Steps

1. **Replace Imports**: Update imports from `headless.dart` to `naked.dart`
2. **Update Component Names**: Replace `Headless*` with `Naked*`
3. **Replace Builders**: Convert builder functions to direct child widgets with state variables
4. **Update State Management**: Use callback-based state management instead of controllers

### Migration Example

**Before (HeadlessButton)**:
```dart
HeadlessButton(
  onPressed: handlePress,
  builder: (context, state) {
    return Container(
      color: state.isPressed
          ? Colors.blue.shade800
          : state.isHovered
              ? Colors.blue.shade600
              : Colors.blue,
      child: Text('Button'),
    );
  },
)
```

**After (NakedButton)**:
```dart
class ButtonWrapper extends StatefulWidget {
  @override
  _ButtonWrapperState createState() => _ButtonWrapperState();
}

class _ButtonWrapperState extends State<ButtonWrapper> {
  bool _isHovered = false;
  bool _isPressed = false;
  
  @override
  Widget build(BuildContext context) {
    return NakedButton(
      onPressed: handlePress,
      onStateHover: (isHovered) => setState(() => _isHovered = isHovered),
      onStatePressed: (isPressed) => setState(() => _isPressed = isPressed),
      child: Container(
        color: _isPressed
            ? Colors.blue.shade800
            : _isHovered
                ? Colors.blue.shade600
                : Colors.blue,
        child: Text('Button'),
      ),
    );
  }
}
```

## Best Practices

### Component Design

1. **Keep Components Simple**: Focus on one responsibility per component
2. **Use Standard Callbacks**: Follow Flutter's established callback patterns
3. **Consistent Naming**: Use consistent property and callback names across components
4. **Document Everything**: Provide clear documentation for all properties and behaviors

### State Management

1. **Consumer Responsibility**: Let consumers manage their own state
2. **State Variables**: Use explicit state variables for each state type
3. **AnimatedContainer**: Use AnimatedContainer for smooth state transitions

### Accessibility

1. **Semantic Labels**: Always support semantic labels
2. **Keyboard Navigation**: Ensure all components are keyboard navigable
3. **Screen Reader Support**: Test with screen readers
4. **WCAG Compliance**: Follow WCAG guidelines for accessible components

### Testing

1. **Test Behavior**: Focus on testing behavior, not implementation
2. **State Callbacks**: Verify all state callbacks are triggered correctly
3. **Accessibility Testing**: Verify semantic properties
4. **Edge Cases**: Test disabled state, keyboard navigation, and error handling

## Conclusion

The Naked component architecture provides a powerful foundation for building custom UI components with complete design freedom. By separating behavior from presentation and using an intuitive callback-driven approach, developers can create beautiful, accessible components without fighting against built-in styling. 

This guide should be used as a reference when developing new Naked components or migrating existing components to the new architecture. By following these patterns and best practices, we can ensure that our component library remains consistent, accessible, and easy to use. 