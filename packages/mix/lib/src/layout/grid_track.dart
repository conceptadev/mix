import 'package:flutter/foundation.dart';

/// How a grid track is sized.
///
/// Grid currently supports fixed and fractional tracks. Content-sized tracks
/// are intentionally outside this API.
@immutable
sealed class GridTrack {
  /// Creates the base value for a concrete Grid track.
  const GridTrack();

  /// A track with a fixed [size] in logical pixels.
  ///
  /// [size] must resolve to a finite, non-negative value. A `SpaceToken`
  /// reference can be used when the track is supplied through
  /// `GridBoxStyler`; validation runs after token resolution.
  const factory GridTrack.fixed(double size) = FixedGridTrack;

  /// A track with [fraction] shares of the remaining free space.
  ///
  /// Remaining space is calculated after fixed tracks and gaps. For example,
  /// `fr(2)` receives twice as much remaining space as `fr(1)`. [fraction]
  /// must resolve to a finite value greater than zero, and the track's axis
  /// must be bounded.
  const factory GridTrack.fr(double fraction) = FrGridTrack;
}

/// Track with a fixed size in logical pixels.
@immutable
final class FixedGridTrack extends GridTrack {
  /// The requested logical-pixel extent.
  final double size;

  /// Creates a fixed track with [size].
  ///
  /// Geometry is validated when a `GridBoxSpec` is created, after any token
  /// reference has been resolved by `GridBoxStyler`.
  const FixedGridTrack(this.size);

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
  /// The track's relative share of remaining free space.
  final double fraction;

  /// Creates a fractional track with [fraction] shares.
  ///
  /// Geometry is validated when a `GridBoxSpec` is created, after any token
  /// reference has been resolved by `GridBoxStyler`.
  const FrGridTrack(this.fraction);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FrGridTrack && other.fraction == fraction;

  @override
  String toString() => 'GridTrack.fr($fraction)';

  @override
  int get hashCode => fraction.hashCode;
}
