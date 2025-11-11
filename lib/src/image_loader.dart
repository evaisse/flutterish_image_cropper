import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

/// Utility functions for loading images into the cropper.
class ImageLoader {
  /// Load an image from asset bundle.
  ///
  /// Example:
  /// ```dart
  /// final image = await ImageLoader.fromAsset('assets/my_image.png');
  /// controller.setImage(image);
  /// ```
  static Future<ui.Image> fromAsset(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List bytes = data.buffer.asUint8List();
    return fromBytes(bytes);
  }

  /// Load an image from memory bytes.
  ///
  /// Example:
  /// ```dart
  /// final image = await ImageLoader.fromBytes(imageBytes);
  /// controller.setImage(image);
  /// ```
  static Future<ui.Image> fromBytes(Uint8List bytes) async {
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  /// Load an image from a network URL.
  ///
  /// Example:
  /// ```dart
  /// final image = await ImageLoader.fromNetwork('https://example.com/image.jpg');
  /// controller.setImage(image);
  /// ```
  static Future<ui.Image> fromNetwork(String url) async {
    final HttpClient httpClient = HttpClient();
    try {
      final HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      final HttpClientResponse response = await request.close();
      final Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      return fromBytes(bytes);
    } finally {
      httpClient.close();
    }
  }

  /// Load an image from a file path.
  ///
  /// Example:
  /// ```dart
  /// final image = await ImageLoader.fromFile(file);
  /// controller.setImage(image);
  /// ```
  static Future<ui.Image> fromFile(dynamic file) async {
    // For use with file_picker or image_picker packages
    final Uint8List bytes = await file.readAsBytes();
    return fromBytes(bytes);
  }
}

// Import for HTTP client
import 'dart:io';
