import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../attributes/style_attribute.dart';
import '../factory/mix_provider_data.dart';

abstract class ImageProviderAttribute<T extends ImageProvider>
    extends StyleAttribute<T> {
  const ImageProviderAttribute();

  @override
  ImageProviderAttribute<T> merge(covariant ImageProviderAttribute<T>? other);

  @override
  T resolve(MixData mix);
}

class NetworkImageAttribute extends ImageProviderAttribute<NetworkImage> {
  final String imageUrl;

  const NetworkImageAttribute(this.imageUrl);

  @override
  NetworkImageAttribute merge(NetworkImageAttribute? other) =>
      NetworkImageAttribute(other?.imageUrl ?? imageUrl);

  @override
  NetworkImage resolve(MixData mix) => NetworkImage(imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}

class AssetImageAttribute extends ImageProviderAttribute<AssetImage> {
  final String assetName;

  const AssetImageAttribute(this.assetName);

  @override
  AssetImageAttribute merge(AssetImageAttribute? other) =>
      AssetImageAttribute(other?.assetName ?? assetName);

  @override
  AssetImage resolve(MixData mix) => AssetImage(assetName);

  @override
  List<Object?> get props => [assetName];
}

class FileImageAttribute extends ImageProviderAttribute<FileImage> {
  final File file;

  const FileImageAttribute(this.file);

  @override
  FileImageAttribute merge(FileImageAttribute? other) =>
      FileImageAttribute(other?.file ?? file);

  @override
  FileImage resolve(MixData mix) => FileImage(file);

  @override
  List<Object?> get props => [file];
}

class MemoryImageAttribute extends ImageProviderAttribute<MemoryImage> {
  final Uint8List bytes;

  const MemoryImageAttribute(this.bytes);

  @override
  MemoryImageAttribute merge(MemoryImageAttribute? other) =>
      MemoryImageAttribute(other?.bytes ?? bytes);

  @override
  MemoryImage resolve(MixData mix) => MemoryImage(bytes);

  @override
  List<Object?> get props => [bytes];
}

class ExactAssetImageAttribute extends ImageProviderAttribute<ExactAssetImage> {
  final String assetName;
  final double scale;

  const ExactAssetImageAttribute(this.assetName, {this.scale = 1.0});

  @override
  ExactAssetImageAttribute merge(ExactAssetImageAttribute? other) =>
      ExactAssetImageAttribute(
        other?.assetName ?? assetName,
        scale: other?.scale ?? scale,
      );

  @override
  ExactAssetImage resolve(MixData mix) =>
      ExactAssetImage(assetName, scale: scale);

  @override
  List<Object?> get props => [assetName, scale];
}
