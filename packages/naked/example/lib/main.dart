import 'package:flutter/material.dart';

// Uncomment the accordion example import
import 'examples/naked_accordion_example.dart';
// import 'examples/naked_accordion_focus_example.dart';
import 'examples/naked_avatar_example.dart';
import 'examples/naked_button_example.dart';
import 'examples/naked_checkbox_example.dart';
// import 'examples/naked_checkbox_focus_example.dart';
import 'examples/naked_menu_example.dart';
// Assuming naked_positioning_example.dart is structured similarly
// import 'examples/naked_positioning_example.dart';
import 'examples/naked_radio_example.dart';
// import 'examples/naked_radio_focus_example.dart';
import 'examples/naked_select_example.dart';
// import 'examples/naked_select_focus_example.dart';
// Assuming naked_select_enhanced_example.dart exists and is a widget
// import 'examples/naked_select_enhanced_example.dart';
import 'examples/naked_slider_example.dart';
import 'examples/naked_tabs_example.dart';
// import 'examples/naked_tabs_focus_example.dart';
// Conditionally import dart:js
import 'url_strategy.dart';

void main() {
  // Initialize URL strategy before running the app
  UrlStrategy.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Headless Widgets Showcase',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          navigationRailTheme: NavigationRailThemeData(
            selectedIconTheme:
                const IconThemeData(color: Colors.blue, size: 28),
            unselectedIconTheme:
                const IconThemeData(color: Colors.grey, size: 24),
            selectedLabelTextStyle: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold),
            unselectedLabelTextStyle: const TextStyle(color: Colors.grey),
            indicatorColor: Colors.blueGrey.withOpacity(0.1),
          )),
      debugShowCheckedModeBanner: false,
      // Enable URL strategy for web
      initialRoute: '/',
      onGenerateRoute: (settings) {
        // Parse route name from URL path
        final path = settings.name ?? '/';
        if (path == '/') {
          return MaterialPageRoute(
            builder: (context) => const ShowcaseApp(initialIndex: 0),
          );
        }

        // Extract the component name from the URL path
        final componentName = path.substring(1);
        // Find the matching index in the destination list
        final index = _getDestinationIndex(componentName);
        return MaterialPageRoute(
          builder: (context) => ShowcaseApp(initialIndex: index),
        );
      },
    );
  }

  // Helper method to find the index based on the URL path segment
  static int _getDestinationIndex(String componentName) {
    final normalizedName = componentName.toLowerCase().replaceAll('-', '');

    for (int i = 0; i < destinations.length; i++) {
      final destName = destinations[i].label.toLowerCase().replaceAll(' ', '');
      if (destName == normalizedName) {
        return i;
      }
    }

    // Default to 0 if component not found
    return 0;
  }
}

// Define destinations at the app level for route generation
final List<NavDestination> destinations = [
  // Uncomment the accordion destination
  NavDestination(
    label: 'Accordion',
    icon: Icons.expand_more,
    widget: const NakedAccordionExample(),
  ),
  NavDestination(
      label: 'Avatar',
      icon: Icons.account_circle,
      widget: const NakedAvatarExample()),
  NavDestination(
      label: 'Button',
      icon: Icons.touch_app,
      widget: const NakedButtonExample()),
  NavDestination(
      label: 'Checkbox',
      icon: Icons.check_box,
      widget: const NakedCheckboxExample()),
  NavDestination(
      label: 'Menu', icon: Icons.menu, widget: const NakedMenuExample()),
  // NavDestination(label: 'Positioning', icon: Icons.place, widget: const NakedPositioningExample()), // Uncomment if available
  NavDestination(
      label: 'Radio',
      icon: Icons.radio_button_checked,
      widget: const NakedRadioExample()),
  NavDestination(
      label: 'Select',
      icon: Icons.arrow_drop_down_circle,
      widget: const NakedSelectExample()),
  NavDestination(
      label: 'Slider',
      icon: Icons.linear_scale,
      widget: const NakedSliderExample()),
  NavDestination(
      label: 'Tabs', icon: Icons.tab, widget: const NakedTabsExample()),

  // Focus Examples (Use Icons.keyboard)
  // Commented out because the accordion focus example was deleted
  /*
  NavDestination(
      label: 'Accordion Focus',
      icon: Icons.keyboard,
      widget: const NakedAccordionFocusExample()),
  */
  // NavDestination(
  //     label: 'Checkbox Focus',
  //     icon: Icons.keyboard,
  //     widget: const NakedCheckboxFocusExample()),
  // NavDestination(
  //     label: 'Radio Focus',
  //     icon: Icons.keyboard,
  //     widget: const NakedRadioFocusExample()),
  // NavDestination(
  //     label: 'Select Focus',
  //     icon: Icons.keyboard,
  //     widget: const NakedSelectFocusExample()),
  // NavDestination(
  //     label: 'Tabs Focus',
  //     icon: Icons.keyboard,
  //     widget: const NakedTabsFocusExample()),
  // NavDestination(label: 'Select Enhanced', icon: Icons.arrow_drop_down_circle_outlined, widget: const NakedSelectEnhancedExample()), // Uncomment if available
];

class ShowcaseApp extends StatefulWidget {
  final int initialIndex;

  const ShowcaseApp({super.key, this.initialIndex = 0});

  @override
  State<ShowcaseApp> createState() => _ShowcaseAppState();
}

// Helper class to define navigation destinations
class NavDestination {
  final String label;
  final IconData icon;
  final Widget widget;

  NavDestination(
      {required this.label, required this.icon, required this.widget});
}

class _ShowcaseAppState extends State<ShowcaseApp> {
  late int _selectedIndex;
  bool _isExtended = false;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // Method to update URL path when tab changes
  void _updateUrlForDestination(int index) {
    final destination = destinations[index];
    final path = '/${destination.label.toLowerCase().replaceAll(' ', '-')}';

    // Update browser URL without adding to history stack
    updateUrl(path);
  }

  @override
  Widget build(BuildContext context) {
    // Get the selected destination
    final NavDestination selectedDestination = destinations[_selectedIndex];
    // Use the destination widget directly
    final Widget selectedWidget = selectedDestination.widget;

    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            extended: _isExtended,
            minExtendedWidth: 180, // Adjust width when extended
            onDestinationSelected: (int index) {
              // Use a post-frame callback to update the state
              // This prevents setState during layout/paint issues
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    _selectedIndex = index;
                    // Update URL when tab changes
                    _updateUrlForDestination(index);
                  });
                }
              });
            },
            leading: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                // Use post-frame callback for UI state changes
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    setState(() {
                      _isExtended = !_isExtended;
                    });
                  }
                });
              },
              tooltip: _isExtended ? 'Collapse' : 'Expand',
              child: Icon(_isExtended ? Icons.arrow_back : Icons.arrow_forward),
            ),
            destinations: destinations.map((destination) {
              return NavigationRailDestination(
                icon: Tooltip(
                    message: destination.label, child: Icon(destination.icon)),
                selectedIcon: Tooltip(
                    message: destination.label, child: Icon(destination.icon)),
                label: Text(destination.label),
              );
            }).toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // Main content area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              // Add SingleChildScrollView here to wrap the examples
              child: SingleChildScrollView(
                child: selectedWidget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
