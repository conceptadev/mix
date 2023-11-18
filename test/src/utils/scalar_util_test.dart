import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('StackFitUtility Tests', () {
    const utility = StackFitUtility(StackFitAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.loose(), isA<StackFitAttribute>());
      expect(utility.expand(), isA<StackFitAttribute>());
      expect(utility.passthrough(), isA<StackFitAttribute>());
      expect(utility.loose().value, StackFit.loose);
      expect(utility.expand().value, StackFit.expand);
      expect(utility.passthrough().value, StackFit.passthrough);
    });

    test('Call method returns correct StackFitAttribute', () {
      expect(utility(StackFit.loose), isA<StackFitAttribute>());
      expect(utility(StackFit.expand), isA<StackFitAttribute>());
      expect(utility(StackFit.passthrough), isA<StackFitAttribute>());
      expect(utility(StackFit.loose).value, StackFit.loose);
      expect(utility(StackFit.expand).value, StackFit.expand);
      expect(utility(StackFit.passthrough).value, StackFit.passthrough);
    });
  });

  group('ClipUtility Tests', () {
    const utility = ClipUtility(ClipAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.none(), isA<ClipAttribute>());
      expect(utility.hardEdge(), isA<ClipAttribute>());
      expect(utility.antiAlias(), isA<ClipAttribute>());
      expect(utility.antiAliasWithSaveLayer(), isA<ClipAttribute>());
      expect(utility.none().value, Clip.none);
      expect(utility.hardEdge().value, Clip.hardEdge);
      expect(utility.antiAlias().value, Clip.antiAlias);
      expect(
          utility.antiAliasWithSaveLayer().value, Clip.antiAliasWithSaveLayer);
    });

    test('Call method returns correct ClipAttribute', () {
      expect(utility(Clip.none), isA<ClipAttribute>());
      expect(utility(Clip.hardEdge), isA<ClipAttribute>());
      expect(utility(Clip.antiAlias), isA<ClipAttribute>());
      expect(utility(Clip.antiAliasWithSaveLayer), isA<ClipAttribute>());
      expect(utility(Clip.none).value, Clip.none);
      expect(utility(Clip.hardEdge).value, Clip.hardEdge);
      expect(utility(Clip.antiAlias).value, Clip.antiAlias);
      expect(utility(Clip.antiAliasWithSaveLayer).value,
          Clip.antiAliasWithSaveLayer);
    });
  });

  group('VerticalDirectionUtility Tests', () {
    const utility = VerticalDirectionUtility(VerticalDirectionAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.up(), isA<VerticalDirectionAttribute>());
      expect(utility.down(), isA<VerticalDirectionAttribute>());
      expect(utility.up().value, VerticalDirection.up);
      expect(utility.down().value, VerticalDirection.down);
    });

    test('Call method returns correct VerticalDirectionAttribute', () {
      expect(utility(VerticalDirection.up), isA<VerticalDirectionAttribute>());
      expect(
          utility(VerticalDirection.down), isA<VerticalDirectionAttribute>());
      expect(utility(VerticalDirection.up).value, VerticalDirection.up);
      expect(utility(VerticalDirection.down).value, VerticalDirection.down);
    });
  });

  group('TextDirectionUtility Tests', () {
    const utility = TextDirectionUtility(TextDirectionAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.rtl(), isA<TextDirectionAttribute>());
      expect(utility.ltr(), isA<TextDirectionAttribute>());
      expect(utility.rtl().value, TextDirection.rtl);
      expect(utility.ltr().value, TextDirection.ltr);
    });

    test('Call method returns correct TextDirectionAttribute', () {
      expect(utility(TextDirection.rtl), isA<TextDirectionAttribute>());
      expect(utility(TextDirection.ltr), isA<TextDirectionAttribute>());
      expect(utility(TextDirection.rtl).value, TextDirection.rtl);
      expect(utility(TextDirection.ltr).value, TextDirection.ltr);
    });
  });

  group('SoftWrapUtility Tests', () {
    const utility = SoftWrapUtility(SoftWrapAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.on(), isA<SoftWrapAttribute>());
      expect(utility.off(), isA<SoftWrapAttribute>());
      expect(utility.on().value, true);
      expect(utility.off().value, false);
    });

    test('Call method returns correct SoftWrapAttribute', () {
      expect(utility(true), isA<SoftWrapAttribute>());
      expect(utility(false), isA<SoftWrapAttribute>());
      expect(utility(true).value, true);
      expect(utility(false).value, false);
    });
  });

  group('TextOverflowUtility Tests', () {
    const utility = TextOverflowUtility(TextOverflowAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.clip(), isA<TextOverflowAttribute>());
      expect(utility.ellipsis(), isA<TextOverflowAttribute>());
      expect(utility.fade(), isA<TextOverflowAttribute>());
      expect(utility.clip().value, TextOverflow.clip);
      expect(utility.ellipsis().value, TextOverflow.ellipsis);
      expect(utility.fade().value, TextOverflow.fade);
    });

    test('Call method returns correct TextOverflowAttribute', () {
      expect(utility(TextOverflow.clip), isA<TextOverflowAttribute>());
      expect(utility(TextOverflow.ellipsis), isA<TextOverflowAttribute>());
      expect(utility(TextOverflow.fade), isA<TextOverflowAttribute>());
      expect(utility(TextOverflow.clip).value, TextOverflow.clip);
      expect(utility(TextOverflow.ellipsis).value, TextOverflow.ellipsis);
      expect(utility(TextOverflow.fade).value, TextOverflow.fade);
    });
  });

  group('TextWidthBasisUtility Tests', () {
    const utility = TextWidthBasisUtility(TextWidthBasisAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.parent(), isA<TextWidthBasisAttribute>());
      expect(utility.longestLine(), isA<TextWidthBasisAttribute>());
      expect(utility.parent().value, TextWidthBasis.parent);
      expect(utility.longestLine().value, TextWidthBasis.longestLine);
    });

    test('Call method returns correct TextWidthBasisAttribute', () {
      expect(utility(TextWidthBasis.parent), isA<TextWidthBasisAttribute>());
      expect(
          utility(TextWidthBasis.longestLine), isA<TextWidthBasisAttribute>());
      expect(utility(TextWidthBasis.parent).value, TextWidthBasis.parent);
      expect(utility(TextWidthBasis.longestLine).value,
          TextWidthBasis.longestLine);
    });
  });

  group('TextAlignUtility Tests', () {
    const utility = TextAlignUtility(TextAlignAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.left(), isA<TextAlignAttribute>());
      expect(utility.right(), isA<TextAlignAttribute>());
      expect(utility.center(), isA<TextAlignAttribute>());
      expect(utility.justify(), isA<TextAlignAttribute>());
      expect(utility.start(), isA<TextAlignAttribute>());
      expect(utility.end(), isA<TextAlignAttribute>());
      expect(utility.left().value, TextAlign.left);
      expect(utility.right().value, TextAlign.right);
      expect(utility.center().value, TextAlign.center);
      expect(utility.justify().value, TextAlign.justify);
      expect(utility.start().value, TextAlign.start);
      expect(utility.end().value, TextAlign.end);
    });

    test('Call method returns correct TextAlignAttribute', () {
      expect(utility(TextAlign.left), isA<TextAlignAttribute>());
      expect(utility(TextAlign.right), isA<TextAlignAttribute>());
      expect(utility(TextAlign.center), isA<TextAlignAttribute>());
      expect(utility(TextAlign.justify), isA<TextAlignAttribute>());
      expect(utility(TextAlign.start), isA<TextAlignAttribute>());
      expect(utility(TextAlign.end), isA<TextAlignAttribute>());
      expect(utility(TextAlign.left).value, TextAlign.left);
      expect(utility(TextAlign.right).value, TextAlign.right);
      expect(utility(TextAlign.center).value, TextAlign.center);
      expect(utility(TextAlign.justify).value, TextAlign.justify);
      expect(utility(TextAlign.start).value, TextAlign.start);
      expect(utility(TextAlign.end).value, TextAlign.end);
    });
  });

  group('FlexFitUtility Tests', () {
    const utility = FlexFitUtility(FlexFitAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.tight(), isA<FlexFitAttribute>());
      expect(utility.loose(), isA<FlexFitAttribute>());
      expect(utility.tight().value, FlexFit.tight);
      expect(utility.loose().value, FlexFit.loose);
    });

    test('Call method returns correct FlexFitAttribute', () {
      expect(utility(FlexFit.tight), isA<FlexFitAttribute>());
      expect(utility(FlexFit.loose), isA<FlexFitAttribute>());
      expect(utility(FlexFit.tight).value, FlexFit.tight);
      expect(utility(FlexFit.loose).value, FlexFit.loose);
    });
  });

  group('AxisUtility Tests', () {
    const utility = AxisUtility(AxisAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.horizontal(), isA<AxisAttribute>());
      expect(utility.vertical(), isA<AxisAttribute>());
      expect(utility.horizontal().value, Axis.horizontal);
      expect(utility.vertical().value, Axis.vertical);
    });

    test('Call method returns correct AxisAttribute', () {
      expect(utility(Axis.horizontal), isA<AxisAttribute>());
      expect(utility(Axis.vertical), isA<AxisAttribute>());
      expect(utility(Axis.horizontal).value, Axis.horizontal);
      expect(utility(Axis.vertical).value, Axis.vertical);
    });
  });

  group('MainAxisAlignmentUtility Tests', () {
    const utility = MainAxisAlignmentUtility(MainAxisAlignmentAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.start(), isA<MainAxisAlignmentAttribute>());
      expect(utility.end(), isA<MainAxisAlignmentAttribute>());
      expect(utility.center(), isA<MainAxisAlignmentAttribute>());
      expect(utility.spaceBetween(), isA<MainAxisAlignmentAttribute>());
      expect(utility.spaceAround(), isA<MainAxisAlignmentAttribute>());
      expect(utility.spaceEvenly(), isA<MainAxisAlignmentAttribute>());
      expect(utility.start().value, MainAxisAlignment.start);
      expect(utility.end().value, MainAxisAlignment.end);
      expect(utility.center().value, MainAxisAlignment.center);
      expect(utility.spaceBetween().value, MainAxisAlignment.spaceBetween);
      expect(utility.spaceAround().value, MainAxisAlignment.spaceAround);
      expect(utility.spaceEvenly().value, MainAxisAlignment.spaceEvenly);
    });

    test('Call method returns correct MainAxisAlignmentAttribute', () {
      expect(
          utility(MainAxisAlignment.start), isA<MainAxisAlignmentAttribute>());
      expect(utility(MainAxisAlignment.end), isA<MainAxisAlignmentAttribute>());
      expect(
          utility(MainAxisAlignment.center), isA<MainAxisAlignmentAttribute>());
      expect(utility(MainAxisAlignment.spaceBetween),
          isA<MainAxisAlignmentAttribute>());
      expect(utility(MainAxisAlignment.spaceAround),
          isA<MainAxisAlignmentAttribute>());
      expect(utility(MainAxisAlignment.spaceEvenly),
          isA<MainAxisAlignmentAttribute>());
      expect(utility(MainAxisAlignment.start).value, MainAxisAlignment.start);
      expect(utility(MainAxisAlignment.end).value, MainAxisAlignment.end);
      expect(utility(MainAxisAlignment.center).value, MainAxisAlignment.center);
      expect(utility(MainAxisAlignment.spaceBetween).value,
          MainAxisAlignment.spaceBetween);
      expect(utility(MainAxisAlignment.spaceAround).value,
          MainAxisAlignment.spaceAround);
      expect(utility(MainAxisAlignment.spaceEvenly).value,
          MainAxisAlignment.spaceEvenly);
    });
  });

  group('CrossAxisAlignmentUtility Tests', () {
    const utility = CrossAxisAlignmentUtility(CrossAxisAlignmentAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.start(), isA<CrossAxisAlignmentAttribute>());
      expect(utility.end(), isA<CrossAxisAlignmentAttribute>());
      expect(utility.center(), isA<CrossAxisAlignmentAttribute>());
      expect(utility.stretch(), isA<CrossAxisAlignmentAttribute>());
      expect(utility.baseline(), isA<CrossAxisAlignmentAttribute>());
      expect(utility.start().value, CrossAxisAlignment.start);
      expect(utility.end().value, CrossAxisAlignment.end);
      expect(utility.center().value, CrossAxisAlignment.center);
      expect(utility.stretch().value, CrossAxisAlignment.stretch);
      expect(utility.baseline().value, CrossAxisAlignment.baseline);
    });

    test('Call method returns correct CrossAxisAlignmentAttribute', () {
      expect(utility(CrossAxisAlignment.start),
          isA<CrossAxisAlignmentAttribute>());
      expect(
          utility(CrossAxisAlignment.end), isA<CrossAxisAlignmentAttribute>());
      expect(utility(CrossAxisAlignment.center),
          isA<CrossAxisAlignmentAttribute>());
      expect(utility(CrossAxisAlignment.stretch),
          isA<CrossAxisAlignmentAttribute>());
      expect(utility(CrossAxisAlignment.baseline),
          isA<CrossAxisAlignmentAttribute>());
      expect(utility(CrossAxisAlignment.start).value, CrossAxisAlignment.start);
      expect(utility(CrossAxisAlignment.end).value, CrossAxisAlignment.end);
      expect(
          utility(CrossAxisAlignment.center).value, CrossAxisAlignment.center);
      expect(utility(CrossAxisAlignment.stretch).value,
          CrossAxisAlignment.stretch);
      expect(utility(CrossAxisAlignment.baseline).value,
          CrossAxisAlignment.baseline);
    });
  });

  group('MainAxisSizeUtility Tests', () {
    const utility = MainAxisSizeUtility(MainAxisSizeAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.min(), isA<MainAxisSizeAttribute>());
      expect(utility.max(), isA<MainAxisSizeAttribute>());
      expect(utility.min().value, MainAxisSize.min);
      expect(utility.max().value, MainAxisSize.max);
    });

    test('Call method returns correct MainAxisSizeAttribute', () {
      expect(utility(MainAxisSize.min), isA<MainAxisSizeAttribute>());
      expect(utility(MainAxisSize.max), isA<MainAxisSizeAttribute>());
      expect(utility(MainAxisSize.min).value, MainAxisSize.min);
      expect(utility(MainAxisSize.max).value, MainAxisSize.max);
    });
  });

  group('TextBaselineUtility Tests', () {
    const utility = TextBaselineUtility(TextBaselineAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.alphabetic(), isA<TextBaselineAttribute>());
      expect(utility.ideographic(), isA<TextBaselineAttribute>());
      expect(utility.alphabetic().value, TextBaseline.alphabetic);
      expect(utility.ideographic().value, TextBaseline.ideographic);
    });

    test('Call method returns correct TextBaselineAttribute', () {
      expect(utility(TextBaseline.alphabetic), isA<TextBaselineAttribute>());
      expect(utility(TextBaseline.ideographic), isA<TextBaselineAttribute>());
      expect(utility(TextBaseline.alphabetic).value, TextBaseline.alphabetic);
      expect(utility(TextBaseline.ideographic).value, TextBaseline.ideographic);
    });
  });

  group('ImageFitUtility Tests', () {
    const utility = BoxFitUtility(ImageFitAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.fill(), isA<ImageFitAttribute>());
      expect(utility.contain(), isA<ImageFitAttribute>());
      expect(utility.cover(), isA<ImageFitAttribute>());
      expect(utility.fitWidth(), isA<ImageFitAttribute>());
      expect(utility.fitHeight(), isA<ImageFitAttribute>());
      expect(utility.none(), isA<ImageFitAttribute>());
      expect(utility.scaleDown(), isA<ImageFitAttribute>());
      expect(utility.fill().value, BoxFit.fill);
      expect(utility.contain().value, BoxFit.contain);
      expect(utility.cover().value, BoxFit.cover);
      expect(utility.fitWidth().value, BoxFit.fitWidth);
      expect(utility.fitHeight().value, BoxFit.fitHeight);
      expect(utility.none().value, BoxFit.none);
      expect(utility.scaleDown().value, BoxFit.scaleDown);
    });

    test('Call method returns correct ImageFitAttribute', () {
      expect(utility(BoxFit.fill), isA<ImageFitAttribute>());
      expect(utility(BoxFit.contain), isA<ImageFitAttribute>());
      expect(utility(BoxFit.cover), isA<ImageFitAttribute>());
      expect(utility(BoxFit.fitWidth), isA<ImageFitAttribute>());
      expect(utility(BoxFit.fitHeight), isA<ImageFitAttribute>());
      expect(utility(BoxFit.none), isA<ImageFitAttribute>());
      expect(utility(BoxFit.scaleDown), isA<ImageFitAttribute>());
      expect(utility(BoxFit.fill).value, BoxFit.fill);
      expect(utility(BoxFit.contain).value, BoxFit.contain);
      expect(utility(BoxFit.cover).value, BoxFit.cover);
      expect(utility(BoxFit.fitWidth).value, BoxFit.fitWidth);
      expect(utility(BoxFit.fitHeight).value, BoxFit.fitHeight);
      expect(utility(BoxFit.none).value, BoxFit.none);
      expect(utility(BoxFit.scaleDown).value, BoxFit.scaleDown);
    });

    test('Call method returns correct ImageFitAttribute', () {
      expect(utility(BoxFit.fill), isA<ImageFitAttribute>());
      expect(utility(BoxFit.contain), isA<ImageFitAttribute>());
      expect(utility(BoxFit.cover), isA<ImageFitAttribute>());
      expect(utility(BoxFit.fitWidth), isA<ImageFitAttribute>());
      expect(utility(BoxFit.fitHeight), isA<ImageFitAttribute>());
      expect(utility(BoxFit.none), isA<ImageFitAttribute>());
      expect(utility(BoxFit.scaleDown), isA<ImageFitAttribute>());
      expect(utility(BoxFit.fill).value, BoxFit.fill);
      expect(utility(BoxFit.contain).value, BoxFit.contain);
      expect(utility(BoxFit.cover).value, BoxFit.cover);
      expect(utility(BoxFit.fitWidth).value, BoxFit.fitWidth);
      expect(utility(BoxFit.fitHeight).value, BoxFit.fitHeight);
      expect(utility(BoxFit.none).value, BoxFit.none);
      expect(utility(BoxFit.scaleDown).value, BoxFit.scaleDown);
    });
  });

  group('ImageRepeatUtility Tests', () {
    const utility = ImageRepeatUtility(ImageRepeatAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.noRepeat(), isA<ImageRepeatAttribute>());
      expect(utility.repeat(), isA<ImageRepeatAttribute>());
      expect(utility.repeatX(), isA<ImageRepeatAttribute>());
      expect(utility.repeatY(), isA<ImageRepeatAttribute>());
      expect(utility.noRepeat().value, ImageRepeat.noRepeat);
      expect(utility.repeat().value, ImageRepeat.repeat);
      expect(utility.repeatX().value, ImageRepeat.repeatX);
      expect(utility.repeatY().value, ImageRepeat.repeatY);
    });

    test('Call method returns correct ImageRepeatAttribute', () {
      expect(utility(ImageRepeat.noRepeat), isA<ImageRepeatAttribute>());
      expect(utility(ImageRepeat.repeat), isA<ImageRepeatAttribute>());
      expect(utility(ImageRepeat.repeatX), isA<ImageRepeatAttribute>());
      expect(utility(ImageRepeat.repeatY), isA<ImageRepeatAttribute>());
      expect(utility(ImageRepeat.noRepeat).value, ImageRepeat.noRepeat);
      expect(utility(ImageRepeat.repeat).value, ImageRepeat.repeat);
      expect(utility(ImageRepeat.repeatX).value, ImageRepeat.repeatX);
      expect(utility(ImageRepeat.repeatY).value, ImageRepeat.repeatY);
    });
  });

  group('BoxFitUtility Tests', () {
    const utility = BoxFitUtility(BoxFitAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.fill(), isA<BoxFitAttribute>());
      expect(utility.contain(), isA<BoxFitAttribute>());
      expect(utility.cover(), isA<BoxFitAttribute>());
      expect(utility.fitWidth(), isA<BoxFitAttribute>());
      expect(utility.fitHeight(), isA<BoxFitAttribute>());
      expect(utility.none(), isA<BoxFitAttribute>());
      expect(utility.scaleDown(), isA<BoxFitAttribute>());
      expect(utility.fill().value, BoxFit.fill);
      expect(utility.contain().value, BoxFit.contain);
      expect(utility.cover().value, BoxFit.cover);
      expect(utility.fitWidth().value, BoxFit.fitWidth);
      expect(utility.fitHeight().value, BoxFit.fitHeight);
      expect(utility.none().value, BoxFit.none);
      expect(utility.scaleDown().value, BoxFit.scaleDown);
    });

    test('Call method returns correct BoxFitAttribute', () {
      expect(utility(BoxFit.fill), isA<BoxFitAttribute>());
      expect(utility(BoxFit.contain), isA<BoxFitAttribute>());
      expect(utility(BoxFit.cover), isA<BoxFitAttribute>());
      expect(utility(BoxFit.fitWidth), isA<BoxFitAttribute>());
      expect(utility(BoxFit.fitHeight), isA<BoxFitAttribute>());
      expect(utility(BoxFit.none), isA<BoxFitAttribute>());
      expect(utility(BoxFit.scaleDown), isA<BoxFitAttribute>());
      expect(utility(BoxFit.fill).value, BoxFit.fill);
      expect(utility(BoxFit.contain).value, BoxFit.contain);
      expect(utility(BoxFit.cover).value, BoxFit.cover);
      expect(utility(BoxFit.fitWidth).value, BoxFit.fitWidth);
      expect(utility(BoxFit.fitHeight).value, BoxFit.fitHeight);
      expect(utility(BoxFit.none).value, BoxFit.none);
      expect(utility(BoxFit.scaleDown).value, BoxFit.scaleDown);
    });
  });

  group('BoxShapeUtility Tests', () {
    const utility = BoxShapeUtility(BoxShapeAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.circle(), isA<BoxShapeAttribute>());
      expect(utility.rectangle(), isA<BoxShapeAttribute>());
      expect(utility.circle().value, BoxShape.circle);
      expect(utility.rectangle().value, BoxShape.rectangle);
    });

    test('Call method returns correct BoxShapeAttribute', () {
      expect(utility(BoxShape.circle), isA<BoxShapeAttribute>());
      expect(utility(BoxShape.rectangle), isA<BoxShapeAttribute>());
      expect(utility(BoxShape.circle).value, BoxShape.circle);
      expect(utility(BoxShape.rectangle).value, BoxShape.rectangle);
    });
  });

  group('BlendModeUtility Tests', () {
    test('Properties are initialized correctly', () {
      const utility = BlendModeUtility(BlendModeAttribute.new);
      expect(utility(BlendMode.clear), isA<BlendModeAttribute>());
      expect(utility(BlendMode.src), isA<BlendModeAttribute>());
      expect(utility(BlendMode.clear).value, BlendMode.clear);
      expect(utility(BlendMode.src).value, BlendMode.src);
    });
  });
}
