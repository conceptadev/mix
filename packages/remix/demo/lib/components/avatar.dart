import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixAvatar,
)
Widget buildCheckboxUseCase(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RemixAvatar(
          style: RemixAvatarStyle(
            container: Style(
              $box.height(60),
              $box.width(60),
              $box.borderRadius(20),
              $box.color(
                Colors.cyanAccent.shade200.withAlpha(60),
              ),
              $icon.size(30),
              $icon.color(Colors.cyanAccent),
            ),
          ),
          imageBuilder: (style) => const StyledIcon(Icons.person),
        ),
        const SizedBox(width: 10),
        RemixAvatar(
          style: RemixAvatarStyle.base().copyWith(
            container: Style(
              $box.height(50),
              $box.width(50),
            ),
          ),
          imageBuilder: (style) =>
              const StyledIcon(Icons.access_alarms_rounded),
        ),
        const SizedBox(width: 10),
        RemixAvatar(
          image: NetworkImage(
            'https://avatars.githubusercontent.com/u/14010287?v=4',
          ),
          style: RemixAvatarStyle.base().copyWith(
            container: Style(
              $box.height(40),
              $box.width(40),
            ),
          ),
        ),
      ],
    ),
  );
}
