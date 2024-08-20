import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/avatar/avatar.dart';

import '../../utils/extensions/widget_tester.dart';

void main() {
  final $avatar = AvatarSpecUtility.self;

  group('RxAvatar', () {
    testWidgets('renders with custom image', (WidgetTester tester) async {
      final image = MemoryImage(Uint8List.fromList([1, 2, 3]));
      await tester.pumpRxComponent(RxAvatar(image: image));

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('renders fallback when image fails to load',
        (WidgetTester tester) async {
      const image = NetworkImage('https://example.com/invalid.jpg');
      await tester.pumpRxComponent(const RxAvatar(image: image, fallback: 'AB'));

      await tester.pumpAndSettle();
      expect(find.text('AB'), findsOneWidget);
    });

    testWidgets('renders with non-standard size', (WidgetTester tester) async {
      await tester.pumpRxComponent(const RxAvatar(size: AvatarSize.size6));

      final avatarWidget = tester.widget<RxAvatar>(find.byType(RxAvatar));
      expect(avatarWidget.size, equals(AvatarSize.size6));
    });

    testWidgets('renders with non-standard radius',
        (WidgetTester tester) async {
      await tester.pumpRxComponent(const RxAvatar(radius: AvatarRadius.none));

      final avatarWidget = tester.widget<RxAvatar>(find.byType(RxAvatar));
      expect(avatarWidget.radius, equals(AvatarRadius.none));
    });

    testWidgets('renders with non-standard variant',
        (WidgetTester tester) async {
      await tester.pumpRxComponent(const RxAvatar(
        variant: AvatarVariant.soft,
      ));

      final avatarWidget = tester.widget<RxAvatar>(find.byType(RxAvatar));
      expect(avatarWidget.variant, equals(AvatarVariant.soft));
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      final color = Colors.redAccent.toDto();

      final style = Style(
        AvatarVariant.solid(
          $avatar.container.color(color.value!),
        ),
      );

      $avatar.container.color.redAccent();

      await tester.pumpRxComponent(RxAvatar(style: style));

      final specBuilder = tester.widget<SpecBuilder>(find.byType(SpecBuilder));

      final avatarAttr =
          specBuilder.style.styles.whereType<AvatarSpecAttribute>().first;

      expect(avatarAttr.container!.decoration!.color, color);
    });
  });
}
