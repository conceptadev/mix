import 'package:flutter/material.dart';
import '../../../mix.dart';

class OnPlatformVariant extends ContextVariant {
  final TargetPlatform platform;

  const OnPlatformVariant(this.platform);

  @override
  bool when(BuildContext context) {
    return !MixHelpers.isWeb && MixHelpers.targetPlatform == platform;
  }

  @override
  List<Object?> get props => [platform];

  @override
  Object get mergeKey => '$runtimeType.${platform.name}';
}

class OnWebVariant extends ContextVariant {
  const OnWebVariant();

  @override
  bool when(_) => MixHelpers.isWeb;
}
