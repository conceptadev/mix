import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mix/mix.dart';

import 'components/atoms/adaptive_scaffold.dart';
import 'providers/dark_mode.provider.dart';
import 'views/basic_example.dart';
import 'views/layout_example.dart';
import 'views/typography_example.dart';
//import 'views/variants.dart';

const screens = [
  Center(child: BasicExample()),
  Center(child: LayoutExample()),
  Center(child: TypographyExample()),
  //Center(child: VariantsExample()),
];

class AppShell extends HookConsumerWidget {
  const AppShell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState(0);

    final darkMode = ref.watch(darkModeProvider);

    return MixTheme(
      data: MixThemeData(),
      child: AdaptiveNavigationScaffold(
        appBar: AppBar(
          title: const Text('Mix Gallery'),
          centerTitle: false,
          actions: [
            Switch(
              value: darkMode,
              onChanged: (value) =>
                  ref.read(darkModeProvider.notifier).state = value,
            ),
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
          /*AdaptiveScaffoldDestination(
            icon: Icon(CommunityMaterialIcons.message_alert),
            label: 'Variant',
          ),*/
        ],
        body: screens[selected.value],
      ),
    );
  }
}
