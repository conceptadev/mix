import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/modifiers/scroll_view_widget_modifier.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ScrollViewModifierSpec', () {
    testWidgets(
      'Build method creates SingleChildScrollView with correct parameters',
      (tester) async {
        final scrollController = ScrollController();
        const padding = EdgeInsets.all(8.0);
        final axis = Axis.horizontal;
        final reverse = true;
        final primary = false;
        final clip = Clip.antiAlias;
        final physics = const AlwaysScrollableScrollPhysics();
        final dragStartBehavior = DragStartBehavior.down;
        final restorationId = 'restorationId';
        final keyboardDismissBehavior =
            ScrollViewKeyboardDismissBehavior.onDrag;

        final modifier = ScrollViewModifierSpec(
          scrollDirection: axis,
          reverse: reverse,
          padding: padding,
          controller: scrollController,
          primary: primary,
          clipBehavior: clip,
          physics: physics,
          dragStartBehavior: dragStartBehavior,
          restorationId: restorationId,
          keyboardDismissBehavior: keyboardDismissBehavior,
        );

        await tester.pumpMaterialApp(modifier.build(Container()));

        final scrollViewWidget = tester.widget<SingleChildScrollView>(
          find.byType(SingleChildScrollView),
        );

        expect(scrollViewWidget.padding, padding);
        expect(scrollViewWidget.scrollDirection, axis);
        expect(scrollViewWidget.reverse, reverse);
        expect(scrollViewWidget.primary, primary);
        expect(scrollViewWidget.clipBehavior, clip);
        expect(scrollViewWidget.physics, physics);
        expect(scrollViewWidget.dragStartBehavior, dragStartBehavior);
        expect(scrollViewWidget.restorationId, restorationId);
        expect(
            scrollViewWidget.keyboardDismissBehavior, keyboardDismissBehavior);
        expect(scrollViewWidget.controller, scrollController);
        expect(scrollViewWidget.child, isA<Container>());
      },
    );

    // Test ScrollViewModifierSpec works like SingleChildScrollView by default.
    testWidgets(
      'ScrollViewModifierSpec and SingleChildScrollView default values are equal',
      (tester) async {
        final modifier = ScrollViewModifierSpec();
        final scrollView = SingleChildScrollView(
          child: Container(),
        );

        await tester.pumpMaterialApp(modifier.build(Container()));

        final scrollViewWidget = tester.widget<SingleChildScrollView>(
          find.byType(SingleChildScrollView),
        );

        expect(scrollViewWidget.padding, scrollView.padding);
        expect(scrollViewWidget.scrollDirection, scrollView.scrollDirection);
        expect(scrollViewWidget.reverse, scrollView.reverse);
        expect(scrollViewWidget.primary, scrollView.primary);
        expect(scrollViewWidget.clipBehavior, scrollView.clipBehavior);
        expect(scrollViewWidget.physics, scrollView.physics);
        expect(
            scrollViewWidget.dragStartBehavior, scrollView.dragStartBehavior);
        expect(scrollViewWidget.restorationId, scrollView.restorationId);
        expect(scrollViewWidget.keyboardDismissBehavior,
            scrollView.keyboardDismissBehavior);
        expect(scrollViewWidget.controller, scrollView.controller);
      },
    );
  });

  group('ScrollViewModifierUtility', () {
    test(
      'Call method creates ScrollViewModifierSpecAttribute with correct parameters',
      () {
        const axis = Axis.horizontal;
        const reverse = true;
        const padding = EdgeInsetsDto.all(8.0);
        final scrollController = ScrollController();
        const primary = false;
        const clip = Clip.antiAlias;
        const physics = AlwaysScrollableScrollPhysics();
        const dragStartBehavior = DragStartBehavior.down;
        const restorationId = 'restorationId';
        const keyboardDismissBehavior =
            ScrollViewKeyboardDismissBehavior.onDrag;

        final attribute = ScrollViewModifierSpecUtility(MixUtility.selfBuilder)(
          scrollDirection: axis,
          reverse: reverse,
          padding: padding,
          controller: scrollController,
          primary: primary,
          clipBehavior: clip,
          physics: physics,
          dragStartBehavior: dragStartBehavior,
          restorationId: restorationId,
          keyboardDismissBehavior: keyboardDismissBehavior,
        );

        expect(attribute.scrollDirection, axis);
        expect(attribute.reverse, reverse);
        expect(attribute.padding, padding);
        expect(attribute.controller, scrollController);
        expect(attribute.primary, primary);
        expect(attribute.clipBehavior, clip);
        expect(attribute.physics, physics);
        expect(attribute.dragStartBehavior, dragStartBehavior);
        expect(attribute.restorationId, restorationId);
        expect(attribute.keyboardDismissBehavior, keyboardDismissBehavior);
      },
    );

    test('Spec utility methods sets correct values', () {
      const axis = Axis.horizontal;
      const padding = EdgeInsetsDto.all(8.0);
      final scrollController = ScrollController();
      const clip = Clip.antiAlias;
      const physics = AlwaysScrollableScrollPhysics();
      const dragStartBehavior = DragStartBehavior.down;
      const restorationId = 'restorationId';
      const keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag;

      final utility = ScrollViewModifierSpecUtility(MixUtility.selfBuilder);

      expect(utility.direction(axis).scrollDirection, axis);
      expect(utility.horizontal().scrollDirection, Axis.horizontal);
      expect(utility.vertical().scrollDirection, Axis.vertical);
      expect(utility.reverse(false).reverse, isFalse);
      expect(utility.reverse(true).reverse, isTrue);
      expect(utility.reverse().reverse, isTrue);
      expect(utility.padding.all(8.0).padding, padding);
      expect(utility.controller(scrollController).controller, scrollController);
      expect(utility.primary(false).primary, isFalse);
      expect(utility.primary(true).primary, isTrue);
      expect(utility.primary().primary, isTrue);
      expect(utility.physics(physics).physics, physics);
      expect(
        utility.neverScrollableScrollPhysics().physics,
        isA<NeverScrollableScrollPhysics>(),
      );
      expect(
        utility.bouncingScrollPhysics().physics,
        isA<BouncingScrollPhysics>(),
      );
      expect(
        utility.clampingScrollPhysics().physics,
        isA<ClampingScrollPhysics>(),
      );
      expect(
        utility.dragStartBehavior(dragStartBehavior).dragStartBehavior,
        dragStartBehavior,
      );
      expect(utility.clipBehavior(clip).clipBehavior, clip);
      expect(utility.restorationId(restorationId).restorationId, restorationId);
      expect(
        utility
            .keyboardDismissBehavior(keyboardDismissBehavior)
            .keyboardDismissBehavior,
        keyboardDismissBehavior,
      );
      expect(
        utility.keyboardDismissOnDrag().keyboardDismissBehavior,
        ScrollViewKeyboardDismissBehavior.onDrag,
      );
    });
  });
}
