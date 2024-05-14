import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../helpers/compare_mixin.dart';
import 'attribute.dart';

@immutable
abstract class Dto<Value> with Comparable, Mergeable<Dto> {
  const Dto();

  Value resolve(MixData mix);
}

/// An abstract class that defines a merging strategy for objects of type [T]
/// that extend the [Dto] class.
///
/// The merging strategy determines how to combine or reconcile two instances
/// of [T] when merging data. The specific merging behavior is implemented by
/// the concrete subclasses of [DtoMergeStrategy].
abstract class DtoMergeStrategy<T extends Dto> {
  /// The [Dto] instance associated with this merging strategy.
  final T? _a;
  final T? _b;

  /// Creates a new instance of [DtoMergeStrategy] with the given [_a].
  const DtoMergeStrategy(this._a, this._b);

  /// Merges two non-null values of type [T] with different runtime types.
  ///
  /// This method defines how to combine or reconcile [a] and [b] when merging
  /// data. The specific merging behavior is determined by the implementation
  /// provided for [T].
  ///
  /// If [a] and [b] are both null or have the same runtime type, this method
  /// is not used, and the merging follows a different logic.
  ///
  /// Returns the merged result of type [T].
  T mergeStrategy(T a, T b);

  /// Merges the current [_a] with the provided [other] instance of type [T].
  ///
  /// If [other] is null, returns the current [_a] without merging.
  ///
  /// If [_a] and [other] have the same runtime type, calls the [merge]
  /// method of [_a] with [other] as the argument and returns the result.
  ///
  /// If [_a] and [other] have different runtime types, calls the
  /// [mergeStrategy] method with [_a] and [other] as arguments and returns
  /// the merged result.
  ///
  /// Returns the merged instance of type [T].
  T? merge() {
    final a = _a;
    final b = _b;
    if (a == null || b == null) {
      return a ?? b;
    }

    if (a.runtimeType == b.runtimeType) {
      return a.merge(b) as T;
    }

    try {
      return mergeStrategy(a, b);
    } on Exception {
      return b;
    }
  }
}

class MergeStrategyException implements Exception {
  final Dto a;
  final Dto b;
  late final String message;

  MergeStrategyException(this.a, this.b) {
    message = 'Unable to merge ${a.runtimeType} with ${b.runtimeType}';
  }

  @override
  String toString() => message;
}
