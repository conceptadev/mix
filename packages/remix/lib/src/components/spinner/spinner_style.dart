part of 'spinner.dart';

final _util = SpinnerSpecUtility.self;

class XSpinnerStyle {
  static Style get base => Style(
        _util.size(24),
        _util.strokeWidth(1.5),
        _util.color.black(),
      );
}
