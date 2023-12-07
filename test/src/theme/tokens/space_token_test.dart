import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('SpaceToken tests', () {
    test('SpaceToken.xsmall() returns correct value', () {
      expect(SpaceToken.xsmall(), SpaceToken.xsmall());
      expect(const SpaceToken('mix.space.xsmall'), SpaceToken.xsmall);
      expect('mix.space.xsmall', SpaceToken.xsmall.name);
      expect('mix.space.xsmall'.hashCode, SpaceToken.xsmall.name.hashCode);

      expect(SpaceToken.xsmall(), lessThan(0));
      expect(SpaceToken.xsmall(), -1.0 * SpaceToken.xsmall.hashCode);
    });

    test('SpaceToken.small() returns correct value', () {
      expect(SpaceToken.small(), SpaceToken.small());
      expect(const SpaceToken('mix.space.small'), SpaceToken.small);
      expect('mix.space.small', SpaceToken.small.name);
      expect('mix.space.small'.hashCode, SpaceToken.small.name.hashCode);

      expect(SpaceToken.small(), lessThan(0));
      expect(SpaceToken.small(), -1.0 * SpaceToken.small.hashCode);
    });

    test('SpaceToken.medium() returns correct value', () {
      expect(SpaceToken.medium(), SpaceToken.medium());
      expect(const SpaceToken('mix.space.medium'), SpaceToken.medium);
      expect('mix.space.medium', SpaceToken.medium.name);
      expect('mix.space.medium'.hashCode, SpaceToken.medium.name.hashCode);

      expect(SpaceToken.medium(), lessThan(0));
      expect(SpaceToken.medium(), -1.0 * SpaceToken.medium.hashCode);
    });

    test('SpaceToken.large() returns correct value', () {
      expect(SpaceToken.large(), SpaceToken.large());
      expect(const SpaceToken('mix.space.large'), SpaceToken.large);
      expect('mix.space.large', SpaceToken.large.name);
      expect('mix.space.large'.hashCode, SpaceToken.large.name.hashCode);
    });

    test('SpaceToken.xlarge() returns correct value', () {
      expect(SpaceToken.xlarge(), SpaceToken.xlarge());
      expect(const SpaceToken('mix.space.xlarge'), SpaceToken.xlarge);
      expect('mix.space.xlarge', SpaceToken.xlarge.name);
      expect('mix.space.xlarge'.hashCode, SpaceToken.xlarge.name.hashCode);

      expect(SpaceToken.xlarge(), lessThan(0));
      expect(SpaceToken.xlarge(), -1.0 * SpaceToken.xlarge.hashCode);
    });

    test('SpaceToken.xxlarge() returns correct value', () {
      expect(SpaceToken.xxlarge(), SpaceToken.xxlarge());
      expect(const SpaceToken('mix.space.xxlarge'), SpaceToken.xxlarge);
      expect('mix.space.xxlarge', SpaceToken.xxlarge.name);
      expect('mix.space.xxlarge'.hashCode, SpaceToken.xxlarge.name.hashCode);

      expect(SpaceToken.xxlarge(), lessThan(0));
      expect(SpaceToken.xxlarge(), -1.0 * SpaceToken.xxlarge.hashCode);
    });
  });

  group('WithSpaceTokens tests', () {
    test('WithSpaceTokens returns correct value', () {
      const withSpaceTokens = SpacingSideUtility(UtilityTestAttribute.new);
      expect(withSpaceTokens.xsmall().value, SpaceToken.xsmall());
      expect(withSpaceTokens.small().value, SpaceToken.small());
      expect(withSpaceTokens.medium().value, SpaceToken.medium());
      expect(withSpaceTokens.large().value, SpaceToken.large());
      expect(withSpaceTokens.xlarge().value, SpaceToken.xlarge());
      expect(withSpaceTokens.xxlarge().value, SpaceToken.xxlarge());
    });
  });

  group('SpaceTokenUtil', () {
    test('SpaceTokenUtil returns correct value', () {
      const spaceTokenUtil = SpaceTokenUtil();
      expect(spaceTokenUtil.xsmall(), SpaceToken.xsmall());
      expect(spaceTokenUtil.small(), SpaceToken.small());
      expect(spaceTokenUtil.medium(), SpaceToken.medium());
      expect(spaceTokenUtil.large(), SpaceToken.large());
      expect(spaceTokenUtil.xlarge(), SpaceToken.xlarge());
      expect(spaceTokenUtil.xxlarge(), SpaceToken.xxlarge());
    });
  });
}
