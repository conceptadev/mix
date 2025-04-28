# Naked Widgets: Goals and Vision

## What is Naked Widgets?

Naked Widgets is an open-source Flutter package that provides a collection of completely unstyled, behavior-focused UI components. Inspired by headless-ui for React, our goal is to give Flutter developers the underlying functionality of common UI components without imposing any specific design or styling system.

## Core Goals

### 1. Separation of Behavior from Presentation

Our primary goal is to provide components that manage all complex behaviors, interactions, and accessibility while giving developers complete control over visual appearance. This allows developers to:

- **Focus on design** without reimplementing complex interaction patterns
- **Avoid fighting against** built-in styles from Material or Cupertino widgets
- Create custom UI components that match design specifications exactly

### 2. Direct Callback-Driven State Approach

Each component uses a direct, Flutter-aligned callback approach that:

- Provides callbacks for all relevant state changes (`onStateHover`, `onStateFocus`, etc.)
- Gives consumers full control over state management
- Aligns with Flutter's existing callback patterns
- Creates a clear mental model without complex state abstractions

### 3. Accessibility by Default

Every component is designed with accessibility as a core feature, not an afterthought:

- Proper semantic roles for screen readers
- Keyboard navigation and focus management
- WCAG compliance built-in
- Platform-specific accessibility accommodations

### 4. True Design Freedom with Platform Adaptability

Unlike many Flutter widget libraries that are tied to Material Design or make platform assumptions, Naked Widgets enables:

- Implementation of any design system (iOS-style, Material, custom corporate, etc.)
- Different visual treatments per platform while maintaining consistent behavior
- Custom styling without fighting against framework defaults
- Complete visual freedom without compromising accessibility or behavior

### 5. Design System Foundation

Naked Widgets serves as the behavioral foundation for custom design systems. By using these components, design system authors can:

- Standardize behavior across their component library
- Focus on implementing their visual design language
- Ensure consistent accessibility
- Reduce maintenance overhead for behavior logic

## How This Differs From Existing Approaches

### vs. Material Widgets

- **Material Widgets:** Combine behavior with visual styling, requiring complex customization or theme overrides
- **Naked Widgets:** Separate behavior from styling, providing complete visual freedom

### vs. Building From Scratch

- **From Scratch:** Requires reimplementing complex interaction patterns, and accessibility
- **Naked Widgets:** Provides tested, accessible behavioral foundations to build upon

### vs. Other Widget Libraries

- **Other Libraries:** Often make visual assumptions, miss edge cases, or have incomplete accessibility
- **Naked Widgets:** Focuses solely on behavior with comprehensive accessibility support

## Implementation Approach

Our components follow a consistent pattern:

```dart
NakedButton(
  // Main action callback
  onPressed: handleButtonPress,
  
  // State callbacks
  onStateHover: (isHovered) => setState(() => _isHovered = isHovered),
  onStateFocus: (isFocused) => setState(() => _isFocused = isFocused),
  onStatePressed: (isPressed) => setState(() => _isPressed = isPressed),
  
  // Other properties
  isDisabled: false,
  
  // Direct child instead of builder function
  child: Container(
    // Custom styling based on your state management
  ),
)
```

This approach:
- Uses direct callbacks that align with Flutter conventions
- Gives consumers complete control over state management
- Simplifies the mental model
- Reduces abstraction layers and indirection

## Use Cases

Naked Widgets is ideal for:

1. **Custom design systems** that need to maintain their own visual identity
2. **Applications needing to deviate from Material Design**
3. **Design agencies** creating branded applications for clients
4. **Enterprise applications** with specific UX requirements
5. **Developers** who want to create fully accessible components with custom styling

## Our Commitment to the Community

As an open-source package, we're committed to:

1. **Quality:** Extensive testing for each component
2. **Documentation:** Clear, comprehensive guides and examples
3. **Accessibility:** Regular audits to ensure WCAG compliance
4. **Community-driven:** Welcoming contributions and feedback
5. **Long-term support:** Maintaining stability and compatibility

## Road Map

Initially, we plan to provide the following naked components:

- Buttons
- Toggles (Checkbox, Switch, Radio)
- Select/Dropdown
- Accordion/Disclosure
- Dialog/Modal
- Tabs
- Menu
- Combobox (Autocomplete)

As the library grows, we'll expand to more complex interactive components like date pickers, sliders, and navigation patterns.

## Getting Started

Whether you're a design system author or an individual developer seeking more styling flexibility while maintaining quality interactions, Naked Widgets provides the behavioral foundation you need to build beautiful, accessible Flutter UIs without visual constraints.

By choosing Naked Widgets as your foundation, you're free to focus on what makes your application visually unique while ensuring the underlying interactions are robust, accessible, and thoroughly tested.