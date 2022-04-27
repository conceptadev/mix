import 'package:community_material_icon/community_material_icon.dart';
import 'package:demo/components/atoms/adaptive_scaffold.dart';
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
      child: AdaptiveNavigationScaffold(
        appBar: AppBar(
          title: const Text('Mix Gallery'),
          centerTitle: false,
          actions: [
            Switch(
              value: darkMode.state,
              onChanged: (value) => darkMode.state = value,
            )
          ],
        ),
        currentIndex: selected.value,
        onNavigationIndexChange: (index) => selected.value = index,
        destinations: const <AdaptiveScaffoldDestination>[
          AdaptiveScaffoldDestination(
            icon: Icon(CommunityMaterialIcons.widgets),
            label: 'Components',
          ),
          AdaptiveScaffoldDestination(
            icon: Icon(CommunityMaterialIcons.view_compact),
            label: 'Layout',
          ),
          AdaptiveScaffoldDestination(
            icon: Icon(CommunityMaterialIcons.format_text_variant),
            label: 'Typography',
          ),
          AdaptiveScaffoldDestination(
            icon: Icon(CommunityMaterialIcons.message_alert),
            label: 'Feedback',
          ),
          AdaptiveScaffoldDestination(
            icon: Icon(Icons.circle),
            label: 'Headless',
          ),
        ],
        body: screens[selected.value],
      ),
    );
  }
}
