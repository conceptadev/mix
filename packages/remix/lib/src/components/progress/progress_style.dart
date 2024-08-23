part of 'progress.dart';

final _progress = ProgressSpecUtility.self;
final _container = _progress.container;
final _track = _progress.track;
final _fill = _progress.fill;

class XProgressStyle {
  static Style get container => Style(
        _container.height(6),
        _container.clipBehavior.antiAlias(),
        _container.borderRadius(99),
      );
  static Style get track => Style(
        _track.color.black(),
        _track.color.black.brighten(90),
      );

  static Style get fill => Style(_fill.color.black());

  static Style get base => Style(container(), track(), fill());
}
