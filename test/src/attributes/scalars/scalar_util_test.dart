import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('StackFitUtility Tests', () {
    const utility = StackFitUtility(ValueHolderAttribute.new);
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
    const utility = ClipUtility(ValueHolderAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.none().value, isA<Clip>());
      expect(utility.hardEdge().value, isA<Clip>());
      expect(utility.antiAlias().value, isA<Clip>());
      expect(utility.antiAliasWithSaveLayer().value, isA<Clip>());
      expect(utility.none().value, Clip.none);
      expect(utility.hardEdge().value, Clip.hardEdge);
      expect(utility.antiAlias().value, Clip.antiAlias);
      expect(
          utility.antiAliasWithSaveLayer().value, Clip.antiAliasWithSaveLayer);
    });
  });

  group('VerticalDirectionUtility Tests', () {
    const utility = VerticalDirectionUtility(ValueHolderAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.up().value, isA<VerticalDirection>());
      expect(utility.down().value, isA<VerticalDirection>());
      expect(utility.up().value, VerticalDirection.up);
      expect(utility.down().value, VerticalDirection.down);
    });
  });

  group('TextOverflowUtility Tests', () {
    const utility = TextOverflowUtility(ValueHolderAttribute.new);
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
    const utility = TextWidthBasisUtility(ValueHolderAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.parent().value, isA<TextWidthBasis>());
      expect(utility.longestLine().value, isA<TextWidthBasis>());
      expect(utility.parent().value, TextWidthBasis.parent);
      expect(utility.longestLine().value, TextWidthBasis.longestLine);
    });
  });

  group('TextAlignUtility Tests', () {
    const utility = TextAlignUtility(ValueHolderAttribute.new);
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
    const utility = FlexFitUtility(ValueHolderAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.tight().value, isA<FlexFit>());
      expect(utility.loose().value, isA<FlexFit>());
      expect(utility.tight().value, FlexFit.tight);
      expect(utility.loose().value, FlexFit.loose);
    });
  });

  group('AxisUtility Tests', () {
    const utility = AxisUtility(ValueHolderAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.horizontal().value, isA<Axis>());
      expect(utility.vertical().value, isA<Axis>());
      expect(utility.horizontal().value, Axis.horizontal);
      expect(utility.vertical().value, Axis.vertical);
    });
  });

  group('MainAxisAlignmentUtility Tests', () {
    const utility = MainAxisAlignmentUtility(ValueHolderAttribute.new);
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
    const utility = CrossAxisAlignmentUtility(ValueHolderAttribute.new);
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
    const utility = MainAxisSizeUtility(ValueHolderAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.min().value, isA<MainAxisSize>());
      expect(utility.max().value, isA<MainAxisSize>());
      expect(utility.min().value, MainAxisSize.min);
      expect(utility.max().value, MainAxisSize.max);
    });
  });

  group('TextBaselineUtility Tests', () {
    const utility = TextBaselineUtility(ValueHolderAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.alphabetic().value, isA<TextBaseline>());
      expect(utility.ideographic().value, isA<TextBaseline>());
      expect(utility.alphabetic().value, TextBaseline.alphabetic);
      expect(utility.ideographic().value, TextBaseline.ideographic);
    });
  });

  group('ImageRepeatUtility Tests', () {
    const utility = ImageRepeatUtility(ValueHolderAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.noRepeat().value, isA<ImageRepeat>());
      expect(utility.repeat().value, isA<ImageRepeat>());
      expect(utility.repeatX().value, isA<ImageRepeat>());
      expect(utility.repeatY().value, isA<ImageRepeat>());
      expect(utility.noRepeat().value, ImageRepeat.noRepeat);
      expect(utility.repeat().value, ImageRepeat.repeat);
      expect(utility.repeatX().value, ImageRepeat.repeatX);
      expect(utility.repeatY().value, ImageRepeat.repeatY);
    });
  });

  group('BoxFitUtility Tests', () {
    const utility = BoxFitUtility(ValueHolderAttribute.new);
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
    const utility = BoxShapeUtility(ValueHolderAttribute.new);
    test('Properties are initialized correctly', () {
      expect(utility.circle().value, isA<BoxShape>());
      expect(utility.rectangle().value, isA<BoxShape>());
      expect(utility.circle().value, BoxShape.circle);
      expect(utility.rectangle().value, BoxShape.rectangle);
    });
  });

  group('BlendModeUtility Tests', () {
    test('Properties are initialized correctly', () {
      const utility = BlendModeUtility(ValueHolderAttribute.new);
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
}
