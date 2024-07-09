import 'package:mix/mix.dart';
import 'package:remix/components/spinner/spinner_spec.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _util = SpinnerSpecUtility.self;

Style defaultSpinnerStyle() => Style(
      _util.strokeWidth(2),
      _util.color.ref($rx.accent9),
      _util.size(24),
    );
