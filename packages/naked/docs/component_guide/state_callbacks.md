# State Callback Naming Convention

## Overview

Naked components use a standardized pattern for state callbacks to ensure consistency across the component library. This guide explains the naming convention and how to use the callbacks in your applications.

## Callback Naming Pattern

All state-related callbacks in Naked components follow the naming pattern:

```
on{State}State
```

For example:
- `onHoverState`: Called when hover state changes
- `onPressedState`: Called when pressed state changes
- `onFocusState`: Called when focus state changes
- `onLoadingState`: Called when loading state changes
- `onErrorState`: Called when error state changes

## Common State Callbacks

Most interactive Naked components implement these core state callbacks:

| Callback | Description | Parameter |
|----------|-------------|-----------|
| `onHoverState` | Called when mouse enters or leaves the component | `bool isHovered` |
| `onPressedState` | Called when component is pressed or released | `bool isPressed` |
| `onFocusState` | Called when component gains or loses focus | `bool isFocused` |

Some components also implement specialized state callbacks:

| Callback | Description | Used By |
|----------|-------------|---------|
| `onLoadingState` | Called when loading state changes | `NakedAvatar`, `NakedButton` |
| `onErrorState` | Called when error state occurs | `NakedAvatar` |
| `onCheckedState` | Called when checked state changes | `NakedCheckbox` |

## Usage Example

```dart
NakedButton(
  onPressed: () {
    // Handle button tap
  },
  onHoverState: (isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  },
  onPressedState: (isPressed) {
    setState(() {
      _isPressed = isPressed;
    });
  },
  onFocusState: (isFocused) {
    setState(() {
      _isFocused = isFocused;
    });
  },
  child: AnimatedContainer(
    // Use state variables to control appearance
    duration: const Duration(milliseconds: 150),
    color: _isPressed 
        ? Colors.blue.shade700 
        : _isHovered 
            ? Colors.blue.shade500 
            : Colors.blue.shade400,
    padding: const EdgeInsets.all(16),
    child: const Text('Button'),
  ),
)
```

## State Management

Naked components do not manage their own state internally. Instead, they provide callbacks that inform you when states change, allowing you to manage state in your own widgets and control the visual representation accordingly.

This pattern:
1. Gives you full control over state persistence
2. Allows for complex state combinations
3. Enables complete styling freedom
4. Supports any state management approach

## Migrating from older versions

In previous versions of the library, some components used the pattern `onState{Name}` (e.g., `onStateHover`, `onStateFocus`). 

The naming has been standardized to `on{State}State` for clarity and consistency. If you're upgrading from a previous version, you'll need to update your callback usage:

| Old Pattern | New Pattern |
|-------------|-------------|
| `onStateHover` | `onHoverState` |
| `onStatePressed` | `onPressedState` |
| `onStateFocus` | `onFocusState` |
| `onStateLoading` | `onLoadingState` |
| `onStateError` | `onErrorState` |