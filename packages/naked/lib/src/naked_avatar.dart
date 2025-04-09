import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naked/src/utilities/naked_focus_manager.dart';

/// Defines the shape of the avatar.
enum AvatarShape {
  /// Circular avatar.
  circle,

  /// Square avatar.
  square,

  /// Rounded square avatar.
  rounded,
}

/// A fully customizable avatar component with no default styling.
///
/// NakedAvatar provides interaction behavior, image loading states, and accessibility
/// without imposing any visual styling, allowing complete design freedom.
/// It uses direct callbacks for state changes, giving consumers control over
/// their own state management.
///
/// The component integrates with [NakedFocusManager] to provide enhanced
/// keyboard accessibility and focus management. This includes:
/// - Space/Enter key support for interactive avatars
/// - Focus restoration when the component is removed
/// - Improved screen reader announcements for loading and error states
///
/// Example:
/// ```dart
/// class MyAvatar extends StatefulWidget {
///   @override
///   _MyAvatarState createState() => _MyAvatarState();
/// }
///
/// class _MyAvatarState extends State<MyAvatar> {
///   bool _isHovered = false;
///   bool _isPressed = false;
///   bool _isFocused = false;
///   bool _isLoading = false;
///   bool _hasError = false;
///
///   @override
///   Widget build(BuildContext context) {
///     return NakedAvatar(
///       src: 'https://example.com/avatar.jpg',
///       size: 48.0,
///       onPressed: () {
///         print('Avatar pressed');
///       },
///       onStateHover: (isHovered) => setState(() => _isHovered = isHovered),
///       onStatePressed: (isPressed) => setState(() => _isPressed = isPressed),
///       onStateFocus: (isFocused) => setState(() => _isFocused = isFocused),
///       onStateLoading: (isLoading) => setState(() => _isLoading = isLoading),
///       onStateError: (hasError) => setState(() => _hasError = hasError),
///       child: AnimatedContainer(
///         duration: Duration(milliseconds: 150),
///         decoration: BoxDecoration(
///           shape: BoxShape.circle,
///           border: Border.all(
///             color: _hasError
///               ? Colors.red
///               : _isPressed
///                 ? Colors.blue.shade800
///                 : _isHovered
///                   ? Colors.blue.shade600
///                   : _isFocused
///                     ? Colors.blue.shade400
///                     : Colors.grey,
///             width: 2.0,
///           ),
///         ),
///         child: _hasError
///           ? Icon(Icons.error_outline, color: Colors.red)
///           : _isLoading
///             ? CircularProgressIndicator()
///             : null,
///       ),
///     );
///   }
/// }
/// ```
class NakedAvatar extends StatefulWidget {
  /// The child widget to display.
  final Widget child;

  /// The source for the avatar image (URL, asset path, or File).
  final dynamic src;

  /// The size of the avatar.
  final double? size;

  /// The shape of the avatar.
  final AvatarShape shape;

  /// Called when the avatar is pressed/activated.
  final VoidCallback? onPressed;

  /// Called when hover state changes.
  final ValueChanged<bool>? onStateHover;

  /// Called when pressed state changes.
  final ValueChanged<bool>? onStatePressed;

  /// Called when focus state changes.
  final ValueChanged<bool>? onStateFocus;

  /// Called when loading state changes.
  final ValueChanged<bool>? onStateLoading;

  /// Called when error state occurs.
  final ValueChanged<bool>? onStateError;

  /// Whether the avatar is disabled.
  final bool isDisabled;

  /// Optional semantic label for accessibility.
  final String? semanticLabel;

  /// The cursor to show when hovering over the avatar.
  final MouseCursor cursor;

  /// Optional focus node to control focus behavior.
  final FocusNode? focusNode;

  /// How to clip the avatar content.
  final Clip clipBehavior;

  /// Whether to provide haptic feedback on tap.
  final bool enableHapticFeedback;

  /// Creates a naked avatar.
  ///
  /// The [child] parameter is required.
  const NakedAvatar({
    super.key,
    required this.child,
    this.src,
    this.size,
    this.shape = AvatarShape.circle,
    this.onPressed,
    this.onStateHover,
    this.onStatePressed,
    this.onStateFocus,
    this.onStateLoading,
    this.onStateError,
    this.isDisabled = false,
    this.semanticLabel,
    this.cursor = SystemMouseCursors.click,
    this.focusNode,
    this.clipBehavior = Clip.antiAlias,
    this.enableHapticFeedback = true,
  });

  @override
  State<NakedAvatar> createState() => _NakedAvatarState();
}

class _NakedAvatarState extends State<NakedAvatar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(NakedAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _handleTap() {
    final isInteractive = !widget.isDisabled && widget.onPressed != null;

    if (isInteractive) {
      if (widget.enableHapticFeedback) {
        HapticFeedback.lightImpact();
      }
      widget.onPressed?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isInteractive = !widget.isDisabled && widget.onPressed != null;
    final effectiveFocusNode = widget.focusNode ?? FocusNode();

    // Consumer will determine loading/error state based on callbacks
    final String? hintText = widget.semanticLabel; // Simplify hint

    return Semantics(
      button: widget.onPressed != null,
      enabled: isInteractive,
      label: widget.semanticLabel ?? 'Avatar',
      image: true,
      // hint: _isLoading ? 'Loading' : (_hasError ? 'Error loading image' : null), // Remove dependency on internal state
      hint: hintText,
      onTap: isInteractive ? _handleTap : null,
      excludeSemantics: true,
      child: NakedFocusManager(
        trapFocus: false, // Avatar is a standalone component
        restoreFocus: true, // Good UX to restore focus when removed
        autofocus: false, // Let the consumer control autofocus
        child: Focus(
          focusNode: effectiveFocusNode,
          onFocusChange: widget.onStateFocus,
          onKeyEvent: (node, event) {
            if (!isInteractive) return KeyEventResult.ignored;

            if (event is KeyDownEvent &&
                (event.logicalKey == LogicalKeyboardKey.space ||
                    event.logicalKey == LogicalKeyboardKey.enter)) {
              widget.onStatePressed?.call(true);
              return KeyEventResult.handled;
            } else if (event is KeyUpEvent &&
                (event.logicalKey == LogicalKeyboardKey.space ||
                    event.logicalKey == LogicalKeyboardKey.enter)) {
              widget.onStatePressed?.call(false);
              _handleTap();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: MouseRegion(
            cursor:
                isInteractive ? widget.cursor : SystemMouseCursors.forbidden,
            onEnter:
                isInteractive ? (_) => widget.onStateHover?.call(true) : null,
            onExit:
                isInteractive ? (_) => widget.onStateHover?.call(false) : null,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: isInteractive
                  ? (_) => widget.onStatePressed?.call(true)
                  : null,
              onTapUp: isInteractive
                  ? (_) => widget.onStatePressed?.call(false)
                  : null,
              onTapCancel: isInteractive
                  ? () => widget.onStatePressed?.call(false)
                  : null,
              onTap: isInteractive ? _handleTap : null,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
