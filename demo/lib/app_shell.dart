import 'package:demo/views/basic_example.dart';
import 'package:demo/views/button_preview.dart';
import 'package:demo/views/cards.dart';
import 'package:demo/views/design_token_example.dart';
import 'package:demo/views/headless_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mix/mix.dart';

import 'providers/dark_mode.provider.dart';
import 'views/pressable_preview.dart';

class AppShell extends HookConsumerWidget {
  const AppShell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState(0);

    final darkMode = ref.watch(darkModeProvider.state);

    return MixTheme(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mix'),
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
                  icon: Icon(Icons.circle),
                  label: Text('Basic Example'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.circle),
                  label: Text('Design Tokens'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.circle),
                  label: Text('Pressable'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.circle),
                  label: Text('Cards'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.circle),
                  label: Text('Headless'),
                ),
                // NavigationRailDestination(
                //   icon: Icon(Icons.bookmark_border),
                //   selectedIcon: Icon(Icons.book),
                //   label: Text('Buttons'),
                // ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(
              child: [
                const Center(child: BasicExample()),
                const Center(child: DesignTokenExample()),
                const Center(child: PressablePreview()),
                const Center(child: CardsPreview()),
                const Center(child: HeadlessPreview()),
                const ButtonsPreview(),
              ][selected.value],
            ),
          ],
        ),
      ),
    );
  }
}
