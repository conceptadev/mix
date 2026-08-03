import 'package:flutter/foundation.dart';

/// How a grid track is sized.
///
/// Grid currently supports fixed and fractional tracks. Content-sized tracks
/// are intentionally outside this API.
@immutable
sealed class GridTrack {
  const GridTrack();

  /// Fixed pixel size.
  const factory GridTrack.fixed(double size) = FixedGridTrack;

  /// Fractional share of remaining free space.
  const factory GridTrack.fr(double fraction) = FrGridTrack;
}

/// Track with a fixed size in logical pixels.
@immutable
final class FixedGridTrack extends GridTrack {
  final double size;

  const FixedGridTrack(this.size) : assert(size >= 0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is FixedGridTrack && other.size == size;

  @override
  String toString() => 'GridTrack.fixed($size)';

  @override
  int get hashCode => size.hashCode;
}

/// Track that takes a fraction of remaining free space after fixed tracks.
@immutable
final class FrGridTrack extends GridTrack {
  final double fraction;

  const FrGridTrack(this.fraction) : assert(fraction > 0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FrGridTrack && other.fraction == fraction;

  @override
  String toString() => 'GridTrack.fr($fraction)';

  @override
  int get hashCode => fraction.hashCode;
}
