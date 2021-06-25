import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/primitives/space.dart';

void main() {
  group("Test Mix Utilities", () {
    test('Test Margin Utilities', () async {
      final marginUtility = SpaceUtility<MarginAttribute>();
      final m = marginUtility.all;
      final mt = marginUtility.top;
      final mb = marginUtility.bottom;
      final mr = marginUtility.right;
      final ml = marginUtility.left;
      final mx = marginUtility.horizontal;
      final my = marginUtility.vertical;

      expect(m(20), MarginAttribute(left: 20, top: 20, right: 20, bottom: 20));
      expect(mt(18), MarginAttribute(top: 18));
      expect(mb(17), MarginAttribute(bottom: 17));
      expect(mr(16), MarginAttribute(right: 16));
      expect(ml(15), MarginAttribute(left: 15));
      expect(mx(14), MarginAttribute(left: 14, right: 14));
      expect(my(13), MarginAttribute(top: 13, bottom: 13));
    });

    test('Test Padding Utilities', () async {
      final paddingUtility = SpaceUtility<PaddingAttribute>();
      final p = paddingUtility.all;
      final pt = paddingUtility.top;
      final pb = paddingUtility.bottom;
      final pr = paddingUtility.right;
      final pl = paddingUtility.left;
      final px = paddingUtility.horizontal;
      final py = paddingUtility.vertical;

      expect(p(20), PaddingAttribute(left: 20, top: 20, right: 20, bottom: 20));
      expect(pt(18), PaddingAttribute(top: 18));
      expect(pb(17), PaddingAttribute(bottom: 17));
      expect(pr(16), PaddingAttribute(right: 16));
      expect(pl(15), PaddingAttribute(left: 15));
      expect(px(14), PaddingAttribute(left: 14, right: 14));
      expect(py(13), PaddingAttribute(top: 13, bottom: 13));
    });
  });
}
