import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

extension _WidgetTesterX on WidgetTester {
  Future<void> pumpAvatar(Widget widget) async {
    await pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: widget,
    ));
  }
}

extension _MemoryImageX on MemoryImage {
  static final testImage = MemoryImage(Uint8List.fromList([
    0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, // PNG signature
    0x00, 0x00, 0x00, 0x0D, // IHDR chunk length
    0x49, 0x48, 0x44, 0x52, // "IHDR"
    0x00, 0x00, 0x00, 0x01, // width: 1
    0x00, 0x00, 0x00, 0x01, // height: 1
    0x08, 0x06, 0x00, 0x00, 0x00, // 8 bits per channel, RGBA, no compression
    0x1F, 0x15, 0xC4, 0x89, // CRC
    0x00, 0x00, 0x00, 0x0A, // IDAT chunk length
    0x49, 0x44, 0x41, 0x54, // "IDAT"
    0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00, 0x05, 0x00,
    0x01, // minimal zlib data
    0x0D, 0x0A, 0x2D, 0xB4, // CRC
    0x00, 0x00, 0x00, 0x00, // IEND chunk length
    0x49, 0x45, 0x4E, 0x44, // "IEND"
    0xAE, 0x42, 0x60, 0x82, // CRC
  ]));
}

void main() {
  group('Basic Functionality', () {
    testWidgets('renders with image provider', (WidgetTester tester) async {
      bool builderCalled = false;

      await tester.pumpAvatar(
        NakedAvatar(
          image: _MemoryImageX.testImage,
          imageWidgetBuilder: (context, child) {
            builderCalled = true;
            return SizedBox(
              width: 100,
              height: 100,
              child: child,
            );
          },
        ),
      );

      expect(builderCalled, isTrue);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets(
        'calls imageWidgetBuilder with non-null child when image is provided',
        (WidgetTester tester) async {
      Widget? childPassed;

      await tester.pumpAvatar(
        NakedAvatar(
          image: _MemoryImageX.testImage,
          imageWidgetBuilder: (context, child) {
            childPassed = child;
            return SizedBox(
              width: 100,
              height: 100,
              child: child,
            );
          },
        ),
      );

      expect(childPassed, isNotNull);
    });

    testWidgets(
        'calls imageWidgetBuilder with null child when no image is provided',
        (WidgetTester tester) async {
      Widget? childPassed;

      await tester.pumpAvatar(
        NakedAvatar(
          imageWidgetBuilder: (context, child) {
            childPassed = child;
            return SizedBox(
              width: 100,
              height: 100,
              child: child ?? const Text('No Image'),
            );
          },
        ),
      );

      expect(childPassed, isNull);
      expect(find.text('No Image'), findsOneWidget);
    });

    testWidgets('applies BoxFit.cover to the image',
        (WidgetTester tester) async {
      DecorationImage? decorationImage;

      await tester.pumpAvatar(
        NakedAvatar(
          image: _MemoryImageX.testImage,
          imageWidgetBuilder: (context, child) {
            if (child != null) {
              final container = child as Container;
              final decoration = container.decoration as BoxDecoration;
              decorationImage = decoration.image;
            }
            return SizedBox(
              width: 100,
              height: 100,
              child: child,
            );
          },
        ),
      );

      expect(decorationImage, isNotNull);
      expect(decorationImage!.fit, equals(BoxFit.cover));
    });
  });

  group('Error Handling', () {
    testWidgets('calls onError callback when image fails to load',
        (WidgetTester tester) async {
      bool errorCalled = false;

      // Using a broken image provider that will trigger an error
      const invalidImageProvider =
          NetworkImage('https://invalid-url.example/image.jpg');

      await tester.pumpAvatar(
        NakedAvatar(
          image: invalidImageProvider,
          onError: (exception, stackTrace) {
            errorCalled = true;
          },
          imageWidgetBuilder: (context, child) {
            return SizedBox(
              width: 100,
              height: 100,
              child: child,
            );
          },
        ),
      );

      // Give time for the image to try to load and fail
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // This expectation may not reliably pass in the test environment
      // since image loading errors are handled differently in tests
      expect(errorCalled, isTrue);
    });
  });

  group('Semantics', () {
    testWidgets('sets correct semantics properties',
        (WidgetTester tester) async {
      await tester.pumpAvatar(
        NakedAvatar(
          image: _MemoryImageX.testImage,
          semanticLabel: 'Profile avatar',
          imageWidgetBuilder: (context, child) {
            return SizedBox(
              width: 100,
              height: 100,
              child: child,
            );
          },
        ),
      );

      final semantics = tester.getSemantics(find.byType(Semantics).first);
      expect(semantics.label, 'Profile avatar');
      expect(semantics.hasFlag(SemanticsFlag.isImage), isTrue);
    });

    testWidgets('properly handles null semanticLabel',
        (WidgetTester tester) async {
      await tester.pumpAvatar(
        NakedAvatar(
          image: _MemoryImageX.testImage,
          imageWidgetBuilder: (context, child) {
            return SizedBox(
              width: 100,
              height: 100,
              child: child,
            );
          },
        ),
      );

      final semantics = tester.getSemantics(find.byType(Semantics).first);
      expect(semantics.label, '');
      expect(semantics.hasFlag(SemanticsFlag.isImage), isTrue);
    });
  });

  group('State Changes', () {
    testWidgets('handles changing from image to no image',
        (WidgetTester tester) async {
      final key = GlobalKey();

      Widget? childPassedWithImage;
      Widget? childPassedWithoutImage;

      Widget buildAvatar(ImageProvider? image) {
        return NakedAvatar(
          key: key,
          image: image,
          imageWidgetBuilder: (context, child) {
            if (image != null) {
              childPassedWithImage = child;
            } else {
              childPassedWithoutImage = child;
            }
            return SizedBox(
              width: 100,
              height: 100,
              child: child ?? const Text('No Image'),
            );
          },
        );
      }

      await tester.pumpAvatar(buildAvatar(_MemoryImageX.testImage));
      expect(childPassedWithImage, isNotNull);

      // Change to no image
      await tester.pumpAvatar(buildAvatar(null));
      expect(childPassedWithoutImage, isNull);
      expect(find.text('No Image'), findsOneWidget);
    });
  });
}
