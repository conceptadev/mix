import '../../dtos/edge_insets/edge_insets.dto.dart';
import '../../dtos/edge_insets/edge_insets_directional.dto.dart';
import 'box.attributes.dart';

class BoxUtilityDeprecated {
  const BoxUtilityDeprecated._();

  /// Short Utils: marginTop, mt
  @Deprecated('Use marginOnly instead')
  static BoxAttributes marginTop(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDto.only(top: value),
    );
  }

  /// Short Utils: marginRight, mr
  @Deprecated('Use marginOnly instead')
  static BoxAttributes marginRight(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(right: value));
  }

  /// Short Utils: marginBottom, mb
  @Deprecated('Use marginOnly instead')
  static BoxAttributes marginBottom(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(bottom: value));
  }

  /// Short Utils: marginLeft, ml
  @Deprecated('Use marginOnly instead')
  static BoxAttributes marginLeft(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(left: value));
  }

  /// Short Utils: marginStart, ms
  @Deprecated('Use marginOnly instead')
  static BoxAttributes marginStart(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDirectionalDto.only(
        start: value,
      ),
    );
  }

  /// Short Utils: marginEnd, me
  @Deprecated('Use marginOnly instead')
  static BoxAttributes marginEnd(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDirectionalDto.only(
        end: value,
      ),
    );
  }

  /// Short Utils: marginHorizontal, marginX, mx
  @Deprecated('Use marginX instead')
  static BoxAttributes marginHorizontal(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDto.symmetric(
        horizontal: value,
      ),
    );
  }

  /// Short Utils: marginVertical, marginY, my
  @Deprecated('Use marginY instead')
  static BoxAttributes marginVertical(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDto.symmetric(
        vertical: value,
      ),
    );
  }

  /// Short Utils: paddingTop, pt
  @Deprecated('Use paddingOnly instead')
  static BoxAttributes paddingTop(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(top: value));
  }

  /// Short Utils: paddingRight, pr
  @Deprecated('Use paddingOnly instead')
  static BoxAttributes paddingRight(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(right: value));
  }

  /// Short Utils: paddingBottom, pb
  @Deprecated('Use paddingOnly instead')
  static BoxAttributes paddingBottom(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(bottom: value));
  }

  /// Short Utils: paddingLeft, pl
  @Deprecated('Use paddingOnly instead')
  static BoxAttributes paddingLeft(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(left: value));
  }

  /// Short Utils: paddingStart, ps
  @Deprecated('Use paddingOnly instead')
  static BoxAttributes paddingStart(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDirectionalDto.only(
        start: value,
      ),
    );
  }

  /// Short Utils: paddingEnd, pe
  @Deprecated('Use paddingOnly instead')
  static BoxAttributes paddingEnd(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDirectionalDto.only(
        end: value,
      ),
    );
  }

  /// Short Utils: paddingHorizontal, px
  @Deprecated('Use paddingX instead')
  static BoxAttributes paddingHorizontal(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDto.symmetric(
        horizontal: value,
      ),
    );
  }

  /// Short Utils: paddingVertical, py
  @Deprecated('Use paddingY instead')
  static BoxAttributes paddingVertical(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDto.symmetric(
        vertical: value,
      ),
    );
  }
}
