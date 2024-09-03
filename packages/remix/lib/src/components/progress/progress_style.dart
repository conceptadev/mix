part of 'progress.dart';

final _container = $progress.container;
final _track = $progress.track;
final _fill = $progress.fill;
final _outerContainer = $progress.outerContainer;

class XProgressStyle {
  static Style get base => Style(
        _containerStyle(),
        _trackStyle(),
        _fillStyle(),
      );
}

Style get _containerStyle => Style(
      _container.height(6),
      _container.clipBehavior.antiAlias(),
      _container.borderRadius(99),
    );
Style get _trackStyle => Style(_track.color.black12());

Style get _fillStyle => Style(_fill.color.black());
