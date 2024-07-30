import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/avatar/avatar.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.App()
void main() {
  runApp(const HotReload());
}

final $avatar = AvatarSpecUtility.self;

class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RemixTokens(
            data: RemixTokens.light,
            child: Transform.scale(
              scale: 3,
              child: RxBlankAvatar(
                fallback: 'LO',
                image: const NetworkImage(
                    'https://images.unsplas.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop'),
                size: AvatarSize.size8,
                radius: AvatarRadius.small,
                style: Style(
                  AvatarVariant.solid(
                    $avatar.container.color.redAccent(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    //   return Widgetbook.material(
    //     addons: [
    //       MaterialThemeAddon(
    //         themes: [
    //           WidgetbookTheme(
    //             name: 'Light',
    //             data: ThemeData.light(),
    //           ),
    //           WidgetbookTheme(
    //             name: 'Dark',
    //             data: ThemeData.dark(),
    //           ),
    //         ],
    //         initialTheme: WidgetbookTheme(
    //           name: 'Dark',
    //           data: ThemeData.dark(),
    //         ),
    //       ),
    //       BuilderAddon(
    //         name: 'Remix Tokens',
    //         builder: (context, child) {
    //           final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    //           return RemixTokens(
    //             data: isDarkTheme ? RemixTokens.dark : RemixTokens.light,
    //             child: Container(
    //               color: isDarkTheme ? Colors.black87 : Colors.white,
    //               child: Center(child: child),
    //             ),
    //           );
    //         },
    //       ),
    //       InspectorAddon(),
    //     ],
    //     appBuilder: (context, child) => MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       home: Scaffold(body: Center(child: child)),
    //     ),
    //     directories: directories,
    //   );
  }
}
