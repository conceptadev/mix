import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/default_decorators.dart';

void main() {
  group('AspectRatioDecorator Tests', () {
    test('should apply aspect ratio', () {
      // Arrange
      const aspectRatioDecorator = AspectRatioDecorator(aspectRatio: 2.0);
      final testWidget = MaterialApp(
        home: Scaffold(
          body: aspectRatioDecorator.build(Container(), 2.0),
        ),
      );

      // Act & Assert
      expect(aspectRatioDecorator.aspectRatio, 2.0);
      expect(find.byType(AspectRatio), findsOneWidget);
      expect(
        (find.byType(AspectRatio).evaluate().single.widget as AspectRatio)
            .aspectRatio,
        2.0,
      );
    });

    test('merge should combine aspect ratios', () {
      // Arrange
      const aspectRatioDecorator1 = AspectRatioDecorator(aspectRatio: 2.0);
      const aspectRatioDecorator2 = AspectRatioDecorator(aspectRatio: 3.0);

      // Act
      final merged = aspectRatioDecorator1.merge(aspectRatioDecorator2);

      // Assert
      expect(merged.aspectRatio, 3.0);
    });
  });
}
