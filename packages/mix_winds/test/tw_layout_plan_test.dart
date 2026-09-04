import 'package:flutter_test/flutter_test.dart';
import 'package:mix_winds/mix_winds.dart';
import 'package:mix_winds/src/tw_layout_plan.dart';

TwCompiledLayoutPlan _boxPlan(String classes) =>
    TwParser().compileBox(classes).layoutPlan as TwCompiledLayoutPlan;

TwCompiledLayoutPlan _flexPlan(String classes) =>
    TwParser().compileFlex(classes).layoutPlan as TwCompiledLayoutPlan;

TwCompiledLayoutPlan _iconPlan(String classes) =>
    TwParser().compileIcon(classes).layoutPlan as TwCompiledLayoutPlan;

void main() {
  group('responsive selection', () {
    test('selects the greatest breakpoint not exceeding explicit width', () {
      final values = TwResponsiveValue<String>([
        const TwResponsiveEntry(minWidth: 1024, value: 'lg'),
        const TwResponsiveEntry(minWidth: 0, value: 'base'),
        const TwResponsiveEntry(minWidth: 768, value: 'md-old'),
        const TwResponsiveEntry(minWidth: 768, value: 'md'),
      ]);

      expect(values.select(-1), isNull);
      expect(values.select(0), 'base');
      expect(values.select(767.9), 'base');
      expect(values.select(768), 'md');
      expect(values.select(2000), 'lg');
      expect(values.select(.nan), isNull);
    });

    test('compiles typed dimension intents at breakpoint boundaries', () {
      final plan = _boxPlan('w-16 md:w-full lg:w-1/2');

      expect(
        plan.dimensions.width.select(500),
        const TwDimensionIntent.fixed(64),
      );
      expect(plan.dimensions.width.select(768), const TwDimensionIntent.full());
      expect(
        plan.dimensions.width.select(1200),
        const TwDimensionIntent.fraction(0.5),
      );
      expect(plan.dimensions.height.isEmpty, isTrue);
      expect(plan.isEmpty, isFalse);
    });

    test('normalizes static viewport dimension utilities', () {
      final plan = _boxPlan('w-screen h-screen');

      expect(plan.dimensions.width.select(0), const TwDimensionIntent.screen());
      expect(
        plan.dimensions.height.select(0),
        const TwDimensionIntent.screen(),
      );
      expect(plan.isEmpty, isFalse);
    });
  });

  group('flex semantics', () {
    test('resolves container axis, gap axes, and explicit items', () {
      final plan = _flexPlan(
        'flex gap-2 md:flex-col md:gap-x-4 md:gap-y-6 md:items-start',
      );

      final base = plan.flexContainer.resolve(500);
      expect(base.axis, TwFlexAxis.horizontal);
      expect(base.mainGap, 8);
      expect(base.crossGap, isNull);
      expect(base.hasExplicitItems, isFalse);
      expect(base.implicitCrossAxisPolicy, TwImplicitCrossAxisPolicy.none);

      final md = plan.flexContainer.resolve(800);
      expect(md.axis, TwFlexAxis.vertical);
      expect(md.mainGap, 24);
      expect(md.crossGap, 16);
      expect(md.hasExplicitItems, isTrue);
      expect(md.implicitCrossAxisPolicy, TwImplicitCrossAxisPolicy.none);
    });

    test('keeps prefixed-only flex fallback vertical below breakpoint', () {
      final plan = _flexPlan('md:flex');

      expect(plan.flexContainer.isFlexContainer, isTrue);
      expect(plan.flexContainer.resolve(500).axis, TwFlexAxis.vertical);
      expect(plan.flexContainer.resolve(800).axis, TwFlexAxis.horizontal);
    });

    test('detects responsive implicit vertical alignment as runtime work', () {
      final plan = _flexPlan('flex md:flex-col');

      expect(
        plan.flexContainer.resolve(500).implicitCrossAxisPolicy,
        TwImplicitCrossAxisPolicy.none,
      );
      expect(
        plan.flexContainer.resolve(800).implicitCrossAxisPolicy,
        TwImplicitCrossAxisPolicy.stretchWhenBoundedStartWhenUnbounded,
      );
      expect(plan.isEmpty, isFalse);
    });

    test('longhands override shorthand independent of class order', () {
      for (final classes in [
        'flex-1 md:flex-1 md:basis-32 md:grow-0',
        'md:grow-0 md:basis-32 md:flex-1 flex-1',
      ]) {
        final plan = _boxPlan(classes);
        final base = plan.flexItem.resolve(500);
        expect(base.basis, TwFlexBasis.zero);
        expect(base.grow, 1);
        expect(base.zeroBasisGrow, 1);

        final md = plan.flexItem.resolve(800);
        expect(md.basis, const TwFlexBasis.fixed(128));
        expect(md.grow, 0);
        expect(md.shrink, 1);
        expect(md.zeroBasisGrow, isNull);
      }
    });

    test('basis-0 plus grow carries explicit zero-basis semantics', () {
      final item = _boxPlan('basis-0 grow').flexItem.resolve(0);

      expect(item.basis, TwFlexBasis.zero);
      expect(item.grow, 1);
      expect(item.zeroBasisGrow, 1);
      expect(item.behavior, const TwFlexBehavior(flex: 1, fit: .tight));
    });
  });

  group('zero-basis insets', () {
    test('cascades responsive margin, padding, and border sides', () {
      final plan = _boxPlan(
        'm-2 p-2 border md:mx-4 md:pt-4 md:border-x-2 lg:ml-8',
      );

      expect(plan.zeroBasisOuterExtent(500, .horizontal), 34);
      expect(plan.zeroBasisOuterExtent(800, .horizontal), 52);
      expect(plan.zeroBasisOuterExtent(800, .vertical), 42);
      expect(plan.zeroBasisOuterExtent(1200, .horizontal), 68);
      expect(
        plan.externalMargin.select(1200),
        const TwInsets(left: 32, top: 8, right: 16, bottom: 8),
      );
    });

    test('keeps style-only padding and border auxiliary to portability', () {
      final plan = _boxPlan('p-4 border-2');

      expect(plan.zeroBasisInsets.isEmpty, isFalse);
      expect(plan.isEmpty, isTrue);
      expect(plan.zeroBasisOuterExtent(0, .horizontal), 36);
    });

    test('tracks icon logical and box physical margins independently', () {
      final iconPlan = _iconPlan('ms-2 me-1 ml-4 hover:me-8 md:mr-6');
      final boxPlan = _boxPlan('ml-4 md:mr-6');

      expect(
        iconPlan.iconLogicalMargin.select(500),
        const TwLogicalInsets(start: 8, end: 4, left: 16),
      );
      expect(
        iconPlan.iconLogicalMargin.select(800),
        const TwLogicalInsets(start: 8, end: 4, left: 16, right: 24),
      );
      expect(
        boxPlan.externalMargin.select(800),
        const TwInsets(left: 16, right: 24),
      );
    });
  });
}
