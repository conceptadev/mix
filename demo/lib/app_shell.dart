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

const screens = [
  Center(child: BasicExample()),
  Center(child: DesignTokenExample()),
  Center(child: PressablePreview()),
  Center(child: CardsPreview()),
  Center(child: HeadlessPreview()),
  ButtonsPreview(),
];

class AppShell extends HookConsumerWidget {
  const AppShell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState(0);

    final darkMode = ref.watch(darkModeProvider.state);

    return MixTheme(
      data: MixThemeData(),
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
            // NavigationRail(
            //   extended: true,
            //   selectedIndex: selected.value,
            //   onDestinationSelected: (index) {
            //     selected.value = index;
            //   },
            //   // labelType: NavigationRailLabelType.selected,
            //   destinations: const <NavigationRailDestination>[
            //     NavigationRailDestination(
            //       icon: Icon(Icons.circle),
            //       label: Text('Basic Example'),
            //     ),
            //     NavigationRailDestination(
            //       icon: Icon(Icons.circle),
            //       label: Text('Design Tokens'),
            //     ),
            //     NavigationRailDestination(
            //       icon: Icon(Icons.circle),
            //       label: Text('Pressable'),
            //     ),
            //     NavigationRailDestination(
            //       icon: Icon(Icons.circle),
            //       label: Text('Cards'),
            //     ),
            //     NavigationRailDestination(
            //       icon: Icon(Icons.circle),
            //       label: Text('Headless'),
            //     ),
            //   ],
            // ),
            const VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(
              child: screens[selected.value],
            ),
          ],
        ),
      ),
    );
  }
}
