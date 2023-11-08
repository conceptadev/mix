import '../attributes/space_attribute.dart';

const _paddingFactory =
    SpaceUtilityFactory<PaddingAttribute>(PaddingAttribute.new);

const _paddingDirectionalFactory =
    SpaceDirectionalUtilityFactory<PaddingDirectionalAttribute>(
  PaddingDirectionalAttribute.new,
);

final padding = _paddingFactory.shorthand;
final paddingOnly = _paddingFactory.only;
final paddingDirectional = _paddingDirectionalFactory.shorthand;
final paddingDirectionalOnly = _paddingDirectionalFactory.only;

final paddingTop = _paddingFactory.top;
final paddingBottom = _paddingFactory.bottom;
final paddingLeft = _paddingFactory.left;
final paddingRight = _paddingFactory.right;
final paddingStart = _paddingDirectionalFactory.start;
final paddingEnd = _paddingDirectionalFactory.end;

final paddingSymmetric = _paddingFactory.symmetric;
final paddingHorizontal = _paddingFactory.horizontal;
final paddingVertical = _paddingFactory.vertical;
final paddingFrom = _paddingFactory.from;

const _marginFactory =
    SpaceUtilityFactory<MarginAttribute>(MarginAttribute.new);

const _marginDirectionalFactory =
    SpaceDirectionalUtilityFactory<MarginDirectionalAttribute>(
  MarginDirectionalAttribute.new,
);

final margin = _marginFactory.shorthand;
final marginOnly = _marginFactory.only;
final marginDirectional = _marginDirectionalFactory.shorthand;
final marginDirectionalOnly = _marginDirectionalFactory.only;
final marginTop = _marginFactory.top;
final marginBottom = _marginFactory.bottom;
final marginLeft = _marginFactory.left;
final marginRight = _marginFactory.right;
final marginStart = _marginDirectionalFactory.start;
final marginEnd = _marginDirectionalFactory.end;
final marginSymmetric = _marginFactory.symmetric;
final marginHorizontal = _marginFactory.horizontal;
final marginVertical = _marginFactory.vertical;
final marginFrom = _marginFactory.from;
