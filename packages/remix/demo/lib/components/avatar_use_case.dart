import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:remix/components/avatar/avatar.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();
final _avatarKey = GlobalKey();

@widgetbook.UseCase(
  name: 'Avatar Component',
  type: RxAvatar,
)
Widget buildAvatarUseCase(BuildContext context) {
  final imageUrl = context.knobs.string(
    label: 'Image URL',
    initialValue: 'https://i.pravatar.cc/150?img=48',
  );

  final avatar = _avatarKey.currentWidget;
  if (avatar is RxAvatar) {
    $code.value = avatar.toStringComponent();
  }

  return KeyedSubtree(
    key: _key,
    child: RxAvatar(
      key: _avatarKey,
      image: NetworkImage(imageUrl),
      fallback: context.knobs.string(
        label: 'Fallback',
        initialValue: 'AB',
      ),
      variant: context.knobs.list(
        label: 'Variant',
        initialOption: AvatarVariant.soft,
        options: AvatarVariant.values,
        labelBuilder: (value) => value.name.split('.').last,
      ),
      size: context.knobs.list(
        label: 'Size',
        options: AvatarSize.values,
        initialOption: AvatarSize.size4,
        labelBuilder: (value) => value.name.split('.').last,
      ),
      radius: context.knobs.list(
        label: 'Radius',
        options: AvatarRadius.values,
        initialOption: AvatarRadius.full,
        labelBuilder: (value) => value.name.split('.').last,
      ),
    ),
  );
}
