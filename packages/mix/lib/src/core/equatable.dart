// The Equatable implementation lives in package:mix_core (pure Dart) and is
// re-exported here so existing imports keep working unchanged.
export 'package:mix_core/mix_core.dart'
    show
        Equatable,
        compareObjects,
        mapPropsToString,
        propsDiff,
        propsEquals,
        propsHash;
