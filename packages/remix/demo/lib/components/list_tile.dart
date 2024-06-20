import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixListTile,
)
Widget buildCheckboxUseCase(BuildContext context) {
  return Center(
    child: RemixListTile(
      leading: RemixAvatar(
        style: RemixAvatarStyle.base().copyWith(
          container: Style(
            $box.height(60),
            $box.width(60),
            $box.borderRadius(6),
            $box.color(
              Colors.black26,
            ),
          ),
        ),
        fallbackLabel: 'LF',
      ),
      title: context.knobs.string(
        label: 'Title',
        initialValue: 'Title',
      ),
      subtitle: context.knobs.string(
        label: 'Subtitle',
        initialValue: 'Subtitle',
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
    ),
  );
}
