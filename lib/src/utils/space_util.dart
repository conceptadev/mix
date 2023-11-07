import '../attributes/space_attribute.dart';

const _paddingFactory =
    SpaceUtilityFactory<PaddingAttribute>(PaddingAttribute.new);

const _paddingDirectionalFactory =
    SpaceDirectionalUtilityFactory<PaddingDirectionalAttribute>(
  PaddingDirectionalAttribute.new,
);

const padding = _paddingFactory;
final paddingSymmetric = _paddingFactory.symmetric;
final paddingTop = _paddingFactory.top;
final paddingBottom = _paddingFactory.bottom;
final paddingLeft = _paddingFactory.left;
final paddingRight = _paddingFactory.right;

const paddingDirectional = _paddingDirectionalFactory;
final paddingStart = _paddingDirectionalFactory.start;
final paddingEnd = _paddingDirectionalFactory.end;
final paddingDirectionalSymmetric = _paddingDirectionalFactory.symmetric;
final paddingInsets = _paddingDirectionalFactory.from;

const _marginFactory =
    SpaceUtilityFactory<MarginAttribute>(MarginAttribute.new);

const _marginDirectionalFactory =
    SpaceDirectionalUtilityFactory<MarginDirectionalAttribute>(
  MarginDirectionalAttribute.new,
);

const margin = _marginFactory;
final marginTop = _marginFactory.top;
final marginBottom = _marginFactory.bottom;
final marginLeft = _marginFactory.left;
final marginRight = _marginFactory.right;
final marginSymmetric = _marginFactory.symmetric;

const marginDirectional = _marginDirectionalFactory;
final marginStart = _marginDirectionalFactory.start;
final marginEnd = _marginDirectionalFactory.end;

final marginInsets = _marginDirectionalFactory.from;
