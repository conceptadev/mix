part of 'progress.dart';

final _progress = ProgressSpecUtility.self;
final _container = _progress.container;
final _track = _progress.track;
final _fill = _progress.fill;

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
Style get _trackStyle => Style(
      _track.color.black(),
      _track.color.black.brighten(90),
    );

Style get _fillStyle => Style(_fill.color.black());
