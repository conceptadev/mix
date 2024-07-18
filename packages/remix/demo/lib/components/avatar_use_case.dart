import 'package:flutter/material.dart';
import 'package:remix/components/avatar/avatar_variants.dart';
import 'package:remix/components/avatar/avatar_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Avatar Component',
  type: RxAvatar,
)
Widget buildAvatarUseCase(BuildContext context) {
  final imageUrl = context.knobs.string(
    label: 'Image URL',
    initialValue: 'https://i.pravatar.cc/150?img=48',
  );

  Widget buildAvatar(AvatarVariant variant) {
    return Column(
      children: [
        Text(variant.name.split('.').last),
        const SizedBox(height: 10),
        RxAvatar(
          image: NetworkImage(imageUrl),
          fallback: context.knobs.string(
            label: 'Fallback',
            initialValue: 'AB',
          ),
          variant: variant,
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
      ],
    );
  }

  return KeyedSubtree(
    key: _key,
    child: Wrap(
      spacing: 12,
      runSpacing: 12,
      children: AvatarVariant.values.map(buildAvatar).toList(),
    ),
  );
}
