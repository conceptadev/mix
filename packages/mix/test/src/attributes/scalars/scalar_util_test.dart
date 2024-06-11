import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('StackFitUtility Tests', () {
    const utility = StackFitUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.loose().value, isA<StackFit>());
      expect(utility.expand().value, isA<StackFit>());
      expect(utility.passthrough().value, isA<StackFit>());
      expect(utility.loose().value, StackFit.loose);
      expect(utility.expand().value, StackFit.expand);
      expect(utility.passthrough().value, StackFit.passthrough);
    });
  });

  group('ClipUtility Tests', () {
    const utility = ClipUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.none().value, isA<Clip>());
      expect(utility.hardEdge().value, isA<Clip>());
      expect(utility.antiAlias().value, isA<Clip>());
      expect(utility.antiAliasWithSaveLayer().value, isA<Clip>());
      expect(utility.none().value, Clip.none);
      expect(utility.hardEdge().value, Clip.hardEdge);
      expect(utility.antiAlias().value, Clip.antiAlias);
      expect(
        utility.antiAliasWithSaveLayer().value,
        Clip.antiAliasWithSaveLayer,
      );
    });
  });

  group('VerticalDirectionUtility Tests', () {
    const utility = VerticalDirectionUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.up().value, isA<VerticalDirection>());
      expect(utility.down().value, isA<VerticalDirection>());
      expect(utility.up().value, VerticalDirection.up);
      expect(utility.down().value, VerticalDirection.down);
    });
  });

  group('TextOverflowUtility Tests', () {
    const utility = TextOverflowUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.clip().value, isA<TextOverflow>());
      expect(utility.ellipsis().value, isA<TextOverflow>());
      expect(utility.fade().value, isA<TextOverflow>());
      expect(utility.clip().value, TextOverflow.clip);
      expect(utility.ellipsis().value, TextOverflow.ellipsis);
      expect(utility.fade().value, TextOverflow.fade);
    });
  });

  group('TextWidthBasisUtility Tests', () {
    const utility = TextWidthBasisUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.parent().value, isA<TextWidthBasis>());
      expect(utility.longestLine().value, isA<TextWidthBasis>());
      expect(utility.parent().value, TextWidthBasis.parent);
      expect(utility.longestLine().value, TextWidthBasis.longestLine);
    });
  });

  group('TextAlignUtility Tests', () {
    const utility = TextAlignUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.left().value, isA<TextAlign>());
      expect(utility.right().value, isA<TextAlign>());
      expect(utility.center().value, isA<TextAlign>());
      expect(utility.justify().value, isA<TextAlign>());
      expect(utility.start().value, isA<TextAlign>());
      expect(utility.end().value, isA<TextAlign>());
      expect(utility.left().value, TextAlign.left);
      expect(utility.right().value, TextAlign.right);
      expect(utility.center().value, TextAlign.center);
      expect(utility.justify().value, TextAlign.justify);
      expect(utility.start().value, TextAlign.start);
      expect(utility.end().value, TextAlign.end);
    });
  });

  group('FlexFitUtility Tests', () {
    const utility = FlexFitUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.tight().value, isA<FlexFit>());
      expect(utility.loose().value, isA<FlexFit>());
      expect(utility.tight().value, FlexFit.tight);
      expect(utility.loose().value, FlexFit.loose);
    });
  });

  group('AxisUtility Tests', () {
    const utility = AxisUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.horizontal().value, isA<Axis>());
      expect(utility.vertical().value, isA<Axis>());
      expect(utility.horizontal().value, Axis.horizontal);
      expect(utility.vertical().value, Axis.vertical);
    });
  });

  group('MainAxisAlignmentUtility Tests', () {
    const utility = MainAxisAlignmentUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.start().value, isA<MainAxisAlignment>());
      expect(utility.end().value, isA<MainAxisAlignment>());
      expect(utility.center().value, isA<MainAxisAlignment>());
      expect(utility.spaceBetween().value, isA<MainAxisAlignment>());
      expect(utility.spaceAround().value, isA<MainAxisAlignment>());
      expect(utility.spaceEvenly().value, isA<MainAxisAlignment>());
      expect(utility.start().value, MainAxisAlignment.start);
      expect(utility.end().value, MainAxisAlignment.end);
      expect(utility.center().value, MainAxisAlignment.center);
      expect(utility.spaceBetween().value, MainAxisAlignment.spaceBetween);
      expect(utility.spaceAround().value, MainAxisAlignment.spaceAround);
      expect(utility.spaceEvenly().value, MainAxisAlignment.spaceEvenly);
    });
  });

  group('CrossAxisAlignmentUtility Tests', () {
    const utility = CrossAxisAlignmentUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.start().value, isA<CrossAxisAlignment>());
      expect(utility.end().value, isA<CrossAxisAlignment>());
      expect(utility.center().value, isA<CrossAxisAlignment>());
      expect(utility.stretch().value, isA<CrossAxisAlignment>());
      expect(utility.baseline().value, isA<CrossAxisAlignment>());
      expect(utility.start().value, CrossAxisAlignment.start);
      expect(utility.end().value, CrossAxisAlignment.end);
      expect(utility.center().value, CrossAxisAlignment.center);
      expect(utility.stretch().value, CrossAxisAlignment.stretch);
      expect(utility.baseline().value, CrossAxisAlignment.baseline);
    });
  });

  group('MainAxisSizeUtility Tests', () {
    const utility = MainAxisSizeUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.min().value, isA<MainAxisSize>());
      expect(utility.max().value, isA<MainAxisSize>());
      expect(utility.min().value, MainAxisSize.min);
      expect(utility.max().value, MainAxisSize.max);
    });
  });

  group('TextBaselineUtility Tests', () {
    const utility = TextBaselineUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.alphabetic().value, isA<TextBaseline>());
      expect(utility.ideographic().value, isA<TextBaseline>());
      expect(utility.alphabetic().value, TextBaseline.alphabetic);
      expect(utility.ideographic().value, TextBaseline.ideographic);
    });
  });

  group('ImageRepeatUtility Tests', () {
    const utility = ImageRepeatUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.noRepeat().value, isA<ImageRepeat>());
      expect(utility().value, isA<ImageRepeat>());
      expect(utility.repeatX().value, isA<ImageRepeat>());
      expect(utility.repeatY().value, isA<ImageRepeat>());
      expect(utility.noRepeat().value, ImageRepeat.noRepeat);
      expect(utility().value, ImageRepeat.repeat);
      expect(utility.repeatX().value, ImageRepeat.repeatX);
      expect(utility.repeatY().value, ImageRepeat.repeatY);
    });
  });

  // AlignmentUtility
  group('AlignmentUtility Tests', () {
    const utility = AlignmentUtility(UtilityTestAttribute.new);

    // only
    test('only() returns correct instance', () {
      final alignment = utility.only(x: 10, y: 8);
      final alignmnetDirectional = utility.only(y: 8, start: 10);

      expect(alignment.value, equals(const Alignment(10, 8)));
      expect(
        alignmnetDirectional.value,
        equals(const AlignmentDirectional(10, 8)),
      );

      expect(() => utility.only(x: 10, start: 8), throwsAssertionError);
    });
    test('Properties are initialized correctly', () {
      expect(utility.topLeft().value, isA<Alignment>());
      expect(utility.topCenter().value, isA<Alignment>());
      expect(utility.topRight().value, isA<Alignment>());
      expect(utility.centerLeft().value, isA<Alignment>());
      expect(utility.center().value, isA<Alignment>());
      expect(utility.centerRight().value, isA<Alignment>());
      expect(utility.bottomLeft().value, isA<Alignment>());
      expect(utility.bottomCenter().value, isA<Alignment>());
      expect(utility.bottomRight().value, isA<Alignment>());
      expect(utility.topLeft().value, Alignment.topLeft);
      expect(utility.topCenter().value, Alignment.topCenter);
      expect(utility.topRight().value, Alignment.topRight);
      expect(utility.centerLeft().value, Alignment.centerLeft);
      expect(utility.center().value, Alignment.center);
      expect(utility.centerRight().value, Alignment.centerRight);
      expect(utility.bottomLeft().value, Alignment.bottomLeft);
      expect(utility.bottomCenter().value, Alignment.bottomCenter);
      expect(utility.bottomRight().value, Alignment.bottomRight);
    });
  });

// BorderStyleUtility
  group('BorderStyleUtility Tests', () {
    const utility = BorderStyleUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.none().value, isA<BorderStyle>());
      expect(utility.solid().value, isA<BorderStyle>());
      expect(utility.none().value, BorderStyle.none);
      expect(utility.solid().value, BorderStyle.solid);
    });
  });

  // ShapeBorderUtility

  group('ShapeBorderUtility', () {
    final utility = ShapeBorderUtility(UtilityTestAttribute.new);

    // circle()
    test('circle() returns correct instance', () {
      final shapeBorder = utility.circle();

      expect(shapeBorder.value, isA<CircleBorderDto>());
    });

    // stadium()
    test('stadium() returns correct instance', () {
      final shapeBorder = utility.stadium();

      expect(shapeBorder.value, isA<StadiumBorderDto>());
    });

    // rounded()
    test('rounded() returns correct instance', () {
      final shapeBorder = utility.roundedRectangle.borderRadius(20);

      expect(shapeBorder.value, isA<RoundedRectangleBorderDto>());
      expect(
        (shapeBorder.value as RoundedRectangleBorderDto).borderRadius,
        BorderRadius.circular(20).toDto(),
      );
    });

    //  beveled()
    test('beveled() returns correct instance', () {
      final shapeBorder = utility.beveledRectangle();

      expect(shapeBorder.value, isA<BeveledRectangleBorderDto>());
    });
  });
  group('BoxFitUtility Tests', () {
    const utility = BoxFitUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.fill().value, isA<BoxFit>());
      expect(utility.contain().value, isA<BoxFit>());
      expect(utility.cover().value, isA<BoxFit>());
      expect(utility.fitWidth().value, isA<BoxFit>());
      expect(utility.fitHeight().value, isA<BoxFit>());
      expect(utility.none().value, isA<BoxFit>());
      expect(utility.scaleDown().value, isA<BoxFit>());
      expect(utility.fill().value, BoxFit.fill);
      expect(utility.contain().value, BoxFit.contain);
      expect(utility.cover().value, BoxFit.cover);
      expect(utility.fitWidth().value, BoxFit.fitWidth);
      expect(utility.fitHeight().value, BoxFit.fitHeight);
      expect(utility.none().value, BoxFit.none);
      expect(utility.scaleDown().value, BoxFit.scaleDown);
    });
  });

  group('BoxShapeUtility Tests', () {
    const utility = BoxShapeUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.circle().value, isA<BoxShape>());
      expect(utility.rectangle().value, isA<BoxShape>());
      expect(utility.circle().value, BoxShape.circle);
      expect(utility.rectangle().value, BoxShape.rectangle);
    });
  });

  // TextDirectionUtility
  group('TextDirectionUtility Tests', () {
    const utility = TextDirectionUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.ltr().value, isA<TextDirection>());
      expect(utility.rtl().value, isA<TextDirection>());
      expect(utility.ltr().value, TextDirection.ltr);
      expect(utility.rtl().value, TextDirection.rtl);
    });
  });

  // TileModeUtility
  group('TileModeUtility Tests', () {
    const utility = TileModeUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.clamp().value, isA<TileMode>());
      expect(utility.mirror().value, isA<TileMode>());
      expect(utility.repeated().value, isA<TileMode>());
      expect(utility.clamp().value, TileMode.clamp);
      expect(utility.mirror().value, TileMode.mirror);
      expect(utility.repeated().value, TileMode.repeated);

      expect(utility.decal().value, isA<TileMode>());
    });
  });

  // GradientTransformUtility
  group('GradientTransformUtility Tests', () {
    const utility = GradientTransformUtility(UtilityTestAttribute.new);
    test('rotate', () {
      expect(utility.rotate(20).value, isA<GradientTransform>());
      expect(utility.rotate(20).value, const GradientRotation(20));
    });
  });

  // Matrix4Utility
  group('Matrix4Utility Tests', () {
    const utility = Matrix4Utility(UtilityTestAttribute.new);
    test('identity', () {
      expect(utility.identity().value, isA<Matrix4>());
      expect(utility.identity().value, Matrix4.identity());
    });

    test('rotationX', () {
      expect(utility.rotationX(20).value, isA<Matrix4>());
      expect(utility.rotationX(20).value, Matrix4.rotationX(20));
    });

    test('rotationY', () {
      expect(utility.rotationY(20).value, isA<Matrix4>());
      expect(utility.rotationY(20).value, Matrix4.rotationY(20));
    });

    test('rotationZ', () {
      expect(utility.rotationZ(20).value, isA<Matrix4>());
      expect(utility.rotationZ(20).value, Matrix4.rotationZ(20));
    });

    test('translation', () {
      expect(utility.translationValues(20, 20, 20).value, isA<Matrix4>());
      expect(
        utility.translationValues(20, 20, 20).value,
        Matrix4.translationValues(20, 20, 20),
      );
    });
  });

  group('BlendModeUtility Tests', () {
    test('Properties are initialized correctly', () {
      const utility = BlendModeUtility(UtilityTestAttribute.new);
      expect(utility.clear().value, BlendMode.clear);
      expect(utility.src().value, BlendMode.src);
      expect(utility.dst().value, BlendMode.dst);
      expect(utility.srcOver().value, BlendMode.srcOver);
      expect(utility.dstOver().value, BlendMode.dstOver);
      expect(utility.srcIn().value, BlendMode.srcIn);
      expect(utility.dstIn().value, BlendMode.dstIn);
      expect(utility.srcOut().value, BlendMode.srcOut);
      expect(utility.dstOut().value, BlendMode.dstOut);
      expect(utility.srcATop().value, BlendMode.srcATop);
      expect(utility.dstATop().value, BlendMode.dstATop);
      expect(utility.xor().value, BlendMode.xor);
      expect(utility.plus().value, BlendMode.plus);
    });
  });

  // BlendModeUtility
  group('BlendModeUtility Tests', () {
    const utility = BlendModeUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.clear().value, isA<BlendMode>());
      expect(utility.src().value, isA<BlendMode>());
      expect(utility.dst().value, isA<BlendMode>());
      expect(utility.srcOver().value, isA<BlendMode>());
      expect(utility.dstOver().value, isA<BlendMode>());
      expect(utility.srcIn().value, isA<BlendMode>());
      expect(utility.dstIn().value, isA<BlendMode>());
      expect(utility.srcOut().value, isA<BlendMode>());
      expect(utility.dstOut().value, isA<BlendMode>());
      expect(utility.srcATop().value, isA<BlendMode>());
      expect(utility.dstATop().value, isA<BlendMode>());
      expect(utility.xor().value, isA<BlendMode>());
      expect(utility.plus().value, isA<BlendMode>());
      expect(utility.clear().value, BlendMode.clear);
      expect(utility.src().value, BlendMode.src);
      expect(utility.dst().value, BlendMode.dst);
      expect(utility.srcOver().value, BlendMode.srcOver);
      expect(utility.dstOver().value, BlendMode.dstOver);
      expect(utility.srcIn().value, BlendMode.srcIn);
      expect(utility.dstIn().value, BlendMode.dstIn);
      expect(utility.srcOut().value, BlendMode.srcOut);
      expect(utility.dstOut().value, BlendMode.dstOut);
      expect(utility.srcATop().value, BlendMode.srcATop);
      expect(utility.dstATop().value, BlendMode.dstATop);
      expect(utility.xor().value, BlendMode.xor);
      expect(utility.plus().value, BlendMode.plus);
    });
  });

  // FontWeightUtility
  group('FontWeightUtility Tests', () {
    const utility = FontWeightUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.bold().value, isA<FontWeight>());
      expect(utility.normal().value, isA<FontWeight>());
      expect(utility.bold().value, FontWeight.bold);
      expect(utility.normal().value, FontWeight.normal);
      expect(utility.w100().value, isA<FontWeight>());
      expect(utility.w200().value, isA<FontWeight>());
      expect(utility.w300().value, isA<FontWeight>());
      expect(utility.w400().value, isA<FontWeight>());
      expect(utility.w500().value, isA<FontWeight>());
      expect(utility.w600().value, isA<FontWeight>());
      expect(utility.w700().value, isA<FontWeight>());
      expect(utility.w800().value, isA<FontWeight>());
      expect(utility.w900().value, isA<FontWeight>());
      expect(utility.w100().value, FontWeight.w100);
      expect(utility.w200().value, FontWeight.w200);
      expect(utility.w300().value, FontWeight.w300);
      expect(utility.w400().value, FontWeight.w400);
      expect(utility.w500().value, FontWeight.w500);
      expect(utility.w600().value, FontWeight.w600);
      expect(utility.w700().value, FontWeight.w700);
      expect(utility.w800().value, FontWeight.w800);
      expect(utility.w900().value, FontWeight.w900);
    });
  });

  // TextDecorationUtility
  group('TextDecorationUtility Tests', () {
    const utility = TextDecorationUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.none().value, isA<TextDecoration>());
      expect(utility.underline().value, isA<TextDecoration>());
      expect(utility.overline().value, isA<TextDecoration>());
      expect(utility.lineThrough().value, isA<TextDecoration>());
      expect(utility.none().value, TextDecoration.none);
      expect(utility.underline().value, TextDecoration.underline);
      expect(utility.overline().value, TextDecoration.overline);
      expect(utility.lineThrough().value, TextDecoration.lineThrough);
    });
  });

  // FontStyleUtility
  group('FontStyleUtility Tests', () {
    const utility = FontStyleUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.normal().value, isA<FontStyle>());
      expect(utility.italic().value, isA<FontStyle>());
      expect(utility.normal().value, FontStyle.normal);
      expect(utility.italic().value, FontStyle.italic);
    });
  });

  // RadiusUtility
  group('RadiusUtility Tests', () {
    const utility = RadiusUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.circular(10).value, isA<Radius>());
      expect(utility.circular(10).value, const Radius.circular(10));
      expect(utility.elliptical(10, 20).value, isA<Radius>());
      expect(utility.elliptical(10, 20).value, const Radius.elliptical(10, 20));
    });
  });

  // TextDecorationStyleUtility
  group('TextDecorationStyleUtility Tests', () {
    const utility = TextDecorationStyleUtility(UtilityTestAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.solid().value, isA<TextDecorationStyle>());
      expect(utility.double().value, isA<TextDecorationStyle>());
      expect(utility.dotted().value, isA<TextDecorationStyle>());
      expect(utility.dashed().value, isA<TextDecorationStyle>());
      expect(utility.wavy().value, isA<TextDecorationStyle>());
      expect(utility.solid().value, TextDecorationStyle.solid);
      expect(utility.double().value, TextDecorationStyle.double);
      expect(utility.dotted().value, TextDecorationStyle.dotted);
      expect(utility.dashed().value, TextDecorationStyle.dashed);
      expect(utility.wavy().value, TextDecorationStyle.wavy);
    });
  });
}
