import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

T _selfCaller<T>(T value) => value;

void main() {
  group('StackFitUtility Tests', () {
    const utility = StackFitUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.loose(), isA<StackFit>());
      expect(utility.expand(), isA<StackFit>());
      expect(utility.passthrough(), isA<StackFit>());
      expect(utility.loose(), StackFit.loose);
      expect(utility.expand(), StackFit.expand);
      expect(utility.passthrough(), StackFit.passthrough);
    });
  });

  group('ClipUtility Tests', () {
    const utility = ClipUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.none(), isA<Clip>());
      expect(utility.hardEdge(), isA<Clip>());
      expect(utility.antiAlias(), isA<Clip>());
      expect(utility.antiAliasWithSaveLayer(), isA<Clip>());
      expect(utility.none(), Clip.none);
      expect(utility.hardEdge(), Clip.hardEdge);
      expect(utility.antiAlias(), Clip.antiAlias);
      expect(utility.antiAliasWithSaveLayer(), Clip.antiAliasWithSaveLayer);
    });
  });

  group('VerticalDirectionUtility Tests', () {
    const utility = VerticalDirectionUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.up(), isA<VerticalDirection>());
      expect(utility.down(), isA<VerticalDirection>());
      expect(utility.up(), VerticalDirection.up);
      expect(utility.down(), VerticalDirection.down);
    });
  });

  group('SoftWrapUtility Tests', () {
    const utility = SoftWrapUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.on(), isA<bool>());
      expect(utility.off(), isA<bool>());
      expect(utility.on(), true);
      expect(utility.off(), false);
    });
    test('Call method returns correct bool', () {
      expect(utility.as(true), isA<bool>());
      expect(utility.as(false), isA<bool>());
      expect(utility.as(true), true);
      expect(utility.as(false), false);
    });
  });

  group('TextOverflowUtility Tests', () {
    const utility = TextOverflowUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.clip(), isA<TextOverflow>());
      expect(utility.ellipsis(), isA<TextOverflow>());
      expect(utility.fade(), isA<TextOverflow>());
      expect(utility.clip(), TextOverflow.clip);
      expect(utility.ellipsis(), TextOverflow.ellipsis);
      expect(utility.fade(), TextOverflow.fade);
    });
  });

  group('TextWidthBasisUtility Tests', () {
    const utility = TextWidthBasisUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.parent(), isA<TextWidthBasis>());
      expect(utility.longestLine(), isA<TextWidthBasis>());
      expect(utility.parent(), TextWidthBasis.parent);
      expect(utility.longestLine(), TextWidthBasis.longestLine);
    });
  });

  group('TextAlignUtility Tests', () {
    const utility = TextAlignUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.left(), isA<TextAlign>());
      expect(utility.right(), isA<TextAlign>());
      expect(utility.center(), isA<TextAlign>());
      expect(utility.justify(), isA<TextAlign>());
      expect(utility.start(), isA<TextAlign>());
      expect(utility.end(), isA<TextAlign>());
      expect(utility.left(), TextAlign.left);
      expect(utility.right(), TextAlign.right);
      expect(utility.center(), TextAlign.center);
      expect(utility.justify(), TextAlign.justify);
      expect(utility.start(), TextAlign.start);
      expect(utility.end(), TextAlign.end);
    });
  });

  group('FlexFitUtility Tests', () {
    const utility = FlexFitUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.tight(), isA<FlexFit>());
      expect(utility.loose(), isA<FlexFit>());
      expect(utility.tight(), FlexFit.tight);
      expect(utility.loose(), FlexFit.loose);
    });
  });

  group('AxisUtility Tests', () {
    const utility = AxisUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.horizontal(), isA<Axis>());
      expect(utility.vertical(), isA<Axis>());
      expect(utility.horizontal(), Axis.horizontal);
      expect(utility.vertical(), Axis.vertical);
    });
  });

  group('MainAxisAlignmentUtility Tests', () {
    const utility = MainAxisAlignmentUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.start(), isA<MainAxisAlignment>());
      expect(utility.end(), isA<MainAxisAlignment>());
      expect(utility.center(), isA<MainAxisAlignment>());
      expect(utility.spaceBetween(), isA<MainAxisAlignment>());
      expect(utility.spaceAround(), isA<MainAxisAlignment>());
      expect(utility.spaceEvenly(), isA<MainAxisAlignment>());
      expect(utility.start(), MainAxisAlignment.start);
      expect(utility.end(), MainAxisAlignment.end);
      expect(utility.center(), MainAxisAlignment.center);
      expect(utility.spaceBetween(), MainAxisAlignment.spaceBetween);
      expect(utility.spaceAround(), MainAxisAlignment.spaceAround);
      expect(utility.spaceEvenly(), MainAxisAlignment.spaceEvenly);
    });
  });

  group('CrossAxisAlignmentUtility Tests', () {
    const utility = CrossAxisAlignmentUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.start(), isA<CrossAxisAlignment>());
      expect(utility.end(), isA<CrossAxisAlignment>());
      expect(utility.center(), isA<CrossAxisAlignment>());
      expect(utility.stretch(), isA<CrossAxisAlignment>());
      expect(utility.baseline(), isA<CrossAxisAlignment>());
      expect(utility.start(), CrossAxisAlignment.start);
      expect(utility.end(), CrossAxisAlignment.end);
      expect(utility.center(), CrossAxisAlignment.center);
      expect(utility.stretch(), CrossAxisAlignment.stretch);
      expect(utility.baseline(), CrossAxisAlignment.baseline);
    });
  });

  group('MainAxisSizeUtility Tests', () {
    const utility = MainAxisSizeUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.min(), isA<MainAxisSize>());
      expect(utility.max(), isA<MainAxisSize>());
      expect(utility.min(), MainAxisSize.min);
      expect(utility.max(), MainAxisSize.max);
    });
  });

  group('TextBaselineUtility Tests', () {
    const utility = TextBaselineUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.alphabetic(), isA<TextBaseline>());
      expect(utility.ideographic(), isA<TextBaseline>());
      expect(utility.alphabetic(), TextBaseline.alphabetic);
      expect(utility.ideographic(), TextBaseline.ideographic);
    });
  });

  group('ImageRepeatUtility Tests', () {
    const utility = ImageRepeatUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.noRepeat(), isA<ImageRepeat>());
      expect(utility.repeat(), isA<ImageRepeat>());
      expect(utility.repeatX(), isA<ImageRepeat>());
      expect(utility.repeatY(), isA<ImageRepeat>());
      expect(utility.noRepeat(), ImageRepeat.noRepeat);
      expect(utility.repeat(), ImageRepeat.repeat);
      expect(utility.repeatX(), ImageRepeat.repeatX);
      expect(utility.repeatY(), ImageRepeat.repeatY);
    });
  });

  group('BoxFitUtility Tests', () {
    const utility = BoxFitUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.fill(), isA<BoxFit>());
      expect(utility.contain(), isA<BoxFit>());
      expect(utility.cover(), isA<BoxFit>());
      expect(utility.fitWidth(), isA<BoxFit>());
      expect(utility.fitHeight(), isA<BoxFit>());
      expect(utility.none(), isA<BoxFit>());
      expect(utility.scaleDown(), isA<BoxFit>());
      expect(utility.fill(), BoxFit.fill);
      expect(utility.contain(), BoxFit.contain);
      expect(utility.cover(), BoxFit.cover);
      expect(utility.fitWidth(), BoxFit.fitWidth);
      expect(utility.fitHeight(), BoxFit.fitHeight);
      expect(utility.none(), BoxFit.none);
      expect(utility.scaleDown(), BoxFit.scaleDown);
    });
  });

  group('BoxShapeUtility Tests', () {
    const utility = BoxShapeUtility(_selfCaller);
    test('Properties are initialized correctly', () {
      expect(utility.circle(), isA<BoxShape>());
      expect(utility.rectangle(), isA<BoxShape>());
      expect(utility.circle(), BoxShape.circle);
      expect(utility.rectangle(), BoxShape.rectangle);
    });
  });

  group('BlendModeUtility Tests', () {
    test('Properties are initialized correctly', () {
      const utility = BlendModeUtility(_selfCaller);
      expect(utility.clear(), BlendMode.clear);
      expect(utility.src(), BlendMode.src);
      expect(utility.dst(), BlendMode.dst);
      expect(utility.srcOver(), BlendMode.srcOver);
      expect(utility.dstOver(), BlendMode.dstOver);
      expect(utility.srcIn(), BlendMode.srcIn);
      expect(utility.dstIn(), BlendMode.dstIn);
      expect(utility.srcOut(), BlendMode.srcOut);
      expect(utility.dstOut(), BlendMode.dstOut);
      expect(utility.srcATop(), BlendMode.srcATop);
      expect(utility.dstATop(), BlendMode.dstATop);
      expect(utility.xor(), BlendMode.xor);
      expect(utility.plus(), BlendMode.plus);
    });
  });
}
