import 'package:example/providers/dark_mode.provider.dart';
import 'package:example/remix/typography/typography_example.dart';
import 'package:example/remix/typography/typography_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const screens = [
  TypographyPreview(),
  TypographyExample(),
];

class AppShell extends HookConsumerWidget {
  const AppShell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState(0);

    final darkMode = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Remix'),
        actions: [
          Switch(
            value: darkMode.state,
            onChanged: (value) => darkMode.state = value,
          )
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            extended: true,
            selectedIndex: selected.value,
            onDestinationSelected: (index) {
              selected.value = index;
            },
            // labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.font_download_outlined),
                selectedIcon: Icon(Icons.font_download),
                label: Text('Typography'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Typography Examples'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: screens[selected.value],
          ),
        ],
      ),
    );
  }
}
