import '../attributes/space_attribute.dart';
import '../theme/tokens/space_token.dart';

const _paddingFactory =
    SpaceUtilityFactory<PaddingAttribute>(PaddingAttribute.new);

const _paddingDirectionalFactory =
    SpaceDirectionalUtilityFactory<PaddingDirectionalAttribute>(
  PaddingDirectionalAttribute.new,
);

final padding = UtilityWithSpaceTokens.shorthand(_paddingFactory.shorthand);
final paddingOnly = _paddingFactory.only;
final paddingDirectional =
    UtilityWithSpaceTokens.shorthand(_paddingDirectionalFactory.shorthand);
final paddingDirectionalOnly = _paddingDirectionalFactory.only;

final paddingTop = UtilityWithSpaceTokens(_paddingFactory.top);
final paddingBottom = UtilityWithSpaceTokens(_paddingFactory.bottom);
final paddingLeft = UtilityWithSpaceTokens(_paddingFactory.left);
final paddingRight = UtilityWithSpaceTokens(_paddingFactory.right);
final paddingStart = UtilityWithSpaceTokens(_paddingDirectionalFactory.start);
final paddingEnd = UtilityWithSpaceTokens(_paddingDirectionalFactory.end);

final paddingHorizontal = UtilityWithSpaceTokens(_paddingFactory.horizontal);
final paddingVertical = UtilityWithSpaceTokens(_paddingFactory.vertical);
final paddingFrom = _paddingFactory.from;

const _marginFactory =
    SpaceUtilityFactory<MarginAttribute>(MarginAttribute.new);

const _marginDirectionalFactory =
    SpaceDirectionalUtilityFactory<MarginDirectionalAttribute>(
  MarginDirectionalAttribute.new,
);

final margin = UtilityWithSpaceTokens.shorthand(_marginFactory.shorthand);
final marginOnly = _marginFactory.only;
final marginDirectional =
    UtilityWithSpaceTokens.shorthand(_marginDirectionalFactory.shorthand);
final marginDirectionalOnly = _marginDirectionalFactory.only;
final marginTop = UtilityWithSpaceTokens(_marginFactory.top);
final marginBottom = UtilityWithSpaceTokens(_marginFactory.bottom);
final marginLeft = UtilityWithSpaceTokens(_marginFactory.left);
final marginRight = UtilityWithSpaceTokens(_marginFactory.right);
final marginStart = UtilityWithSpaceTokens(_marginDirectionalFactory.start);
final marginEnd = UtilityWithSpaceTokens(_marginDirectionalFactory.end);

final marginHorizontal = UtilityWithSpaceTokens(_marginFactory.horizontal);
final marginVertical = UtilityWithSpaceTokens(_marginFactory.vertical);
final marginFrom = _marginFactory.from;
