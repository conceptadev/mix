import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naked/src/utilities/naked_focus_manager.dart';

/// A fully customizable tabs component with no default styling.
///
/// NakedTabs provides interaction behavior and accessibility features
/// for a tabbed interface without imposing any visual styling,
/// giving consumers complete control over appearance through direct state callbacks.
///
/// Focus management is handled through NakedFocusManager which provides:
/// - Keyboard navigation between tabs using arrow keys
/// - Home/End keys for navigating to first/last tab
/// - Proper focus handling for accessibility
///
/// Example:
/// ```dart
/// class MyTabs extends StatefulWidget {
///   @override
///   _MyTabsState createState() => _MyTabsState();
/// }
///
/// class _MyTabsState extends State<MyTabs> {
///   String _selectedTabId = 'tab1';
///
///   // State variables for styling
///   Map<String, bool> _tabHoverStates = {'tab1': false, 'tab2': false, 'tab3': false};
///   Map<String, bool> _tabFocusStates = {'tab1': false, 'tab2': false, 'tab3': false};
///   Map<String, bool> _tabPressStates = {'tab1': false, 'tab2': false, 'tab3': false};
///
///   @override
///   Widget build(BuildContext context) {
///     return NakedTabs(
///       selectedTabId: _selectedTabId,
///       onSelectedTabIdChanged: (tabId) => setState(() => _selectedTabId = tabId),
///       child: Column(
///         children: [
///           NakedTabList(
///             child: Row(
///               children: [
///                 _buildTab('tab1', 'Tab 1'),
///                 const SizedBox(width: 8),
///                 _buildTab('tab2', 'Tab 2'),
///                 const SizedBox(width: 8),
///                 _buildTab('tab3', 'Tab 3'),
///               ],
///             ),
///           ),
///           const SizedBox(height: 16),
///           NakedTabPanel(
///             tabId: 'tab1',
///             child: Container(
///               padding: const EdgeInsets.all(16),
///               color: Colors.blue.shade50,
///               child: const Text('Content for Tab 1'),
///             ),
///           ),
///           NakedTabPanel(
///             tabId: 'tab2',
///             child: Container(
///               padding: const EdgeInsets.all(16),
///               color: Colors.green.shade50,
///               child: const Text('Content for Tab 2'),
///             ),
///           ),
///           NakedTabPanel(
///             tabId: 'tab3',
///             child: Container(
///               padding: const EdgeInsets.all(16),
///               color: Colors.orange.shade50,
///               child: const Text('Content for Tab 3'),
///             ),
///           ),
///         ],
///       ),
///     );
///   }
///
///   Widget _buildTab(String tabId, String label) {
///     final isSelected = _selectedTabId == tabId;
///     final isHovered = _tabHoverStates[tabId] ?? false;
///     final isFocused = _tabFocusStates[tabId] ?? false;
///     final isPressed = _tabPressStates[tabId] ?? false;
///
///     return NakedTab(
///       tabId: tabId,
///       onHoverState: (isHovered) => setState(() => _tabHoverStates[tabId] = isHovered),
///       onFocusState: (isFocused) => setState(() => _tabFocusStates[tabId] = isFocused),
///       onPressedState: (isPressed) => setState(() => _tabPressStates[tabId] = isPressed),
///       child: Container(
///         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
///         decoration: BoxDecoration(
///           color: isSelected
///               ? Colors.white
///               : isPressed
///                   ? Colors.grey.shade300
///                   : isHovered
///                       ? Colors.grey.shade200
///                       : Colors.grey.shade100,
///           borderRadius: const BorderRadius.only(
///             topLeft: Radius.circular(4),
///             topRight: Radius.circular(4),
///           ),
///           border: Border.all(
///             color: isSelected
///                 ? Colors.blue
///                 : isFocused
///                     ? Colors.blue.withOpacity(0.5)
///                     : Colors.grey,
///             width: isFocused ? 2 : 1,
///           ),
///           // Only show a bottom border if the tab is not selected
///           boxShadow: isSelected
///               ? [
///                   BoxShadow(
///                     color: Colors.blue.withOpacity(0.3),
///                     blurRadius: 4,
///                     offset: const Offset(0, 2),
///                   ),
///                 ]
///               : null,
///         ),
///         child: Text(
///           label,
///           style: TextStyle(
///             color: isSelected ? Colors.blue : Colors.black87,
///             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
///           ),
///         ),
///       ),
///     );
///   }
/// }
/// ```
class NakedTabs extends StatefulWidget {
  /// The child widget to display.
  final Widget child;

  /// The ID of the currently selected tab.
  final String selectedTabId;

  /// Called when the selected tab ID changes.
  final ValueChanged<String>? onSelectedTabIdChanged;

  /// Whether the tabs component is disabled.
  ///
  /// When true, the tabs will not respond to user interaction.
  final bool isDisabled;

  /// Optional semantic label for accessibility.
  ///
  /// This is used by screen readers to describe the tabs component.
  final String? semanticLabel;

  /// The orientation of the tabs.
  ///
  /// Defaults to horizontal.
  final Axis orientation;

  /// Optional escape key handler.
  ///
  /// This is called when the escape key is pressed while the tabs component has focus.
  final VoidCallback? onEscapePressed;

  /// Creates a naked tabs component.
  ///
  /// The [child] parameter is required.
  const NakedTabs({
    super.key,
    required this.child,
    required this.selectedTabId,
    this.onSelectedTabIdChanged,
    this.orientation = Axis.horizontal,
    this.isDisabled = false,
    this.semanticLabel,
    this.onEscapePressed,
  });

  @override
  State<NakedTabs> createState() => _NakedTabsState();
}

class _NakedTabsState extends State<NakedTabs> {
  @override
  void dispose() {
    super.dispose();
  }

  void _registerTabFocusNode(String tabId, FocusNode node) {
    // This method is now a no-op but kept for backward compatibility
    // with existing NakedTab implementations
  }

  void _selectTab(String tabId) {
    if (widget.isDisabled) return;
    if (tabId == widget.selectedTabId) return;

    widget.onSelectedTabIdChanged?.call(tabId);
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (widget.isDisabled) return KeyEventResult.ignored;

    if (event is KeyDownEvent) {
      final isHorizontal = widget.orientation == Axis.horizontal;

      // Get all tab IDs from child widgets
      final List<String> tabIds = [];
      void visitChildren(Element element) {
        if (element.widget is NakedTab) {
          tabIds.add((element.widget as NakedTab).tabId);
        }
        element.visitChildren(visitChildren);
      }

      // Start with the current context's element
      BuildContext? contextToUse = context;
      (contextToUse as Element).visitChildren(visitChildren);

      final currentIndex = tabIds.indexOf(widget.selectedTabId);
      if (currentIndex == -1 || tabIds.isEmpty) return KeyEventResult.ignored;

      String? nextTabId;

      if (isHorizontal) {
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          // Move to the previous tab
          final newIndex = (currentIndex - 1) % tabIds.length;
          nextTabId = tabIds[newIndex >= 0 ? newIndex : tabIds.length - 1];
        } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          // Move to the next tab
          nextTabId = tabIds[(currentIndex + 1) % tabIds.length];
        }
      } else {
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          // Move to the previous tab
          final newIndex = (currentIndex - 1) % tabIds.length;
          nextTabId = tabIds[newIndex >= 0 ? newIndex : tabIds.length - 1];
        } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          // Move to the next tab
          nextTabId = tabIds[(currentIndex + 1) % tabIds.length];
        }
      }

      if (event.logicalKey == LogicalKeyboardKey.home) {
        // Move to the first tab
        nextTabId = tabIds.isNotEmpty ? tabIds.first : null;
      } else if (event.logicalKey == LogicalKeyboardKey.end) {
        // Move to the last tab
        nextTabId = tabIds.isNotEmpty ? tabIds.last : null;
      }

      if (nextTabId != null) {
        _selectTab(nextTabId);
        return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: widget.semanticLabel,
      explicitChildNodes: true,
      child: NakedFocusManager(
        trapFocus: true, // Trap focus within the tabs component
        restoreFocus: true, // Restore focus when removed
        autofocus: false, // Don't autofocus initially
        onEscapePressed: widget.onEscapePressed,
        child: Focus(
          canRequestFocus: !widget.isDisabled,
          onKeyEvent: _handleKeyEvent,
          child: _NakedTabsScope(
            selectedTabId: widget.selectedTabId,
            onSelectedTabIdChanged: _selectTab,
            registerTabFocusNode: _registerTabFocusNode,
            orientation: widget.orientation,
            isDisabled: widget.isDisabled,
            child: FocusTraversalGroup(
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

/// The scope that provides tabs state to its descendants.
class _NakedTabsScope extends InheritedWidget {
  /// The ID of the currently selected tab.
  final String selectedTabId;

  /// Called when a tab is selected.
  final ValueChanged<String>? onSelectedTabIdChanged;

  /// Called to register a tab's focus node.
  final void Function(String tabId, FocusNode node) registerTabFocusNode;

  /// The orientation of the tabs.
  final Axis orientation;

  /// Whether the tabs component is disabled.
  final bool isDisabled;

  const _NakedTabsScope({
    required this.selectedTabId,
    required this.onSelectedTabIdChanged,
    required this.registerTabFocusNode,
    required this.orientation,
    required this.isDisabled,
    required super.child,
  });

  /// Whether a tab is currently selected.
  bool isTabSelected(String tabId) {
    return selectedTabId == tabId;
  }

  /// Requests that a tab be selected.
  void selectTab(String tabId) {
    if (onSelectedTabIdChanged != null) {
      onSelectedTabIdChanged!(tabId);
    }
  }

  static _NakedTabsScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_NakedTabsScope>();
  }

  @override
  bool updateShouldNotify(_NakedTabsScope oldWidget) {
    return selectedTabId != oldWidget.selectedTabId ||
        orientation != oldWidget.orientation ||
        isDisabled != oldWidget.isDisabled;
  }
}

/// A container for tab triggers in a NakedTabs component.
///
/// This component is used to group tab triggers and handles keyboard navigation.
class NakedTabList extends StatelessWidget {
  /// The child widget to display.
  final Widget child;

  /// Optional semantic label for accessibility.
  ///
  /// This is used by screen readers to describe the tab list.
  final String? semanticLabel;

  /// Creates a naked tab list.
  ///
  /// The [child] parameter is required.
  const NakedTabList({
    super.key,
    required this.child,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      explicitChildNodes: true,
      label: semanticLabel ?? 'Tab list',
      child: Container(
        child: child,
      ),
    );
  }
}

/// An individual tab trigger in a NakedTabs component.
///
/// This component represents a selectable tab within a tab list.
class NakedTab extends StatefulWidget {
  /// The child widget to display.
  final Widget child;

  /// The unique ID for this tab.
  final String tabId;

  /// Called when hover state changes.
  final ValueChanged<bool>? onHoverState;

  /// Called when pressed state changes.
  final ValueChanged<bool>? onPressedState;

  /// Called when focus state changes.
  final ValueChanged<bool>? onFocusState;

  /// Whether this tab is disabled.
  ///
  /// When true, the tab will not respond to user interaction,
  /// regardless of the tabs component's disabled state.
  final bool isDisabled;

  /// Optional semantic label for accessibility.
  ///
  /// This is used by screen readers to describe the tab.
  final String? semanticLabel;

  /// The cursor to show when hovering over the tab.
  final MouseCursor cursor;

  /// Whether to provide haptic feedback on tab selection.
  final bool enableHapticFeedback;

  /// Optional focus node to control focus behavior.
  final FocusNode? focusNode;

  /// Creates a naked tab.
  ///
  /// The [child] and [tabId] parameters are required.
  const NakedTab({
    super.key,
    required this.child,
    required this.tabId,
    this.onHoverState,
    this.onPressedState,
    this.onFocusState,
    this.isDisabled = false,
    this.semanticLabel,
    this.cursor = SystemMouseCursors.click,
    this.enableHapticFeedback = true,
    this.focusNode,
  });

  @override
  State<NakedTab> createState() => _NakedTabState();
}

class _NakedTabState extends State<NakedTab> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Check if this tab is selected and request focus if needed
    final tabsScope = _NakedTabsScope.of(context);
    if (tabsScope?.isTabSelected(widget.tabId) ?? false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _focusNode.canRequestFocus) {
          _focusNode.requestFocus();
        }
      });
    }
  }

  @override
  void didUpdateWidget(NakedTab oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update focus node if it changed
    if (widget.focusNode != oldWidget.focusNode) {
      if (oldWidget.focusNode == null) {
        _focusNode.dispose();
      }
      _focusNode = widget.focusNode ?? FocusNode();
    }
  }

  @override
  void dispose() {
    // Only dispose the focus node if we created it
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _handleTap() {
    if (widget.isDisabled) return;

    final tabsScope = _NakedTabsScope.of(context);
    if (tabsScope == null || tabsScope.isDisabled) return;

    if (widget.enableHapticFeedback) {
      HapticFeedback.selectionClick();
    }

    tabsScope.selectTab(widget.tabId);
    if (_focusNode.canRequestFocus) {
      _focusNode.requestFocus();
    }
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (widget.isDisabled) return KeyEventResult.ignored;

    final tabsScope = _NakedTabsScope.of(context);
    if (tabsScope == null || tabsScope.isDisabled) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space ||
          event.logicalKey == LogicalKeyboardKey.enter) {
        widget.onPressedState?.call(true);
        return KeyEventResult.handled;
      }
    } else if (event is KeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space ||
          event.logicalKey == LogicalKeyboardKey.enter) {
        widget.onPressedState?.call(false);
        _handleTap();
        return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final tabsScope = _NakedTabsScope.of(context);
    final isSelected = tabsScope?.isTabSelected(widget.tabId) ?? false;
    final isInteractive =
        !(widget.isDisabled || (tabsScope != null && tabsScope.isDisabled));

    return Semantics(
      container: true,
      enabled: isInteractive,
      label: widget.semanticLabel ?? 'Tab ${widget.tabId}',
      selected: isSelected,
      excludeSemantics: true,
      onTap: isInteractive ? _handleTap : null,
      child: NakedFocusManager(
        trapFocus: false, // Individual tab shouldn't trap focus
        restoreFocus: true, // Good UX to restore focus when removed
        autofocus: isSelected, // Autofocus if selected
        child: Focus(
          focusNode: _focusNode,
          canRequestFocus: isInteractive,
          onFocusChange: widget.onFocusState,
          onKeyEvent: _handleKeyEvent,
          child: MouseRegion(
            cursor:
                isInteractive ? widget.cursor : SystemMouseCursors.forbidden,
            onEnter:
                isInteractive ? (_) => widget.onHoverState?.call(true) : null,
            onExit:
                isInteractive ? (_) => widget.onHoverState?.call(false) : null,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: isInteractive
                  ? (_) => widget.onPressedState?.call(true)
                  : null,
              onTapUp: isInteractive
                  ? (_) => widget.onPressedState?.call(false)
                  : null,
              onTapCancel: isInteractive
                  ? () => widget.onPressedState?.call(false)
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

/// A panel that displays content for a specific tab in a NakedTabs component.
///
/// This component is associated with a specific tab and displays its content
/// when that tab is selected.
class NakedTabPanel extends StatelessWidget {
  /// The child widget to display when this panel is active.
  final Widget child;

  /// The ID of the tab this panel is associated with.
  final String tabId;

  /// Optional semantic label for accessibility.
  ///
  /// This is used by screen readers to describe the tab panel.
  final String? semanticLabel;

  /// Whether to keep the panel in the widget tree when inactive.
  ///
  /// When true, the panel will remain in the widget tree but be invisible when inactive.
  /// When false, the panel will be removed from the widget tree when inactive.
  final bool maintainState;

  /// Creates a naked tab panel.
  ///
  /// The [child] and [tabId] parameters are required.
  const NakedTabPanel({
    super.key,
    required this.child,
    required this.tabId,
    this.semanticLabel,
    this.maintainState = true,
  });

  @override
  Widget build(BuildContext context) {
    final tabsScope = _NakedTabsScope.of(context);
    final isSelected = tabsScope?.isTabSelected(tabId) ?? false;

    if (!isSelected && !maintainState) {
      return const SizedBox();
    }

    return Semantics(
      container: true,
      label: semanticLabel ?? 'Tab panel for $tabId',
      explicitChildNodes: true,
      hidden: !isSelected,
      child: Visibility(
        visible: isSelected,
        maintainState: maintainState,
        child: child,
      ),
    );
  }
}
