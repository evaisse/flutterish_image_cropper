import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterish_image_cropper/flutterish_image_cropper.dart';

void main() {
  group('ImageCropper Golden Tests', () {
    testWidgets('should match golden for no image state',
        (WidgetTester tester) async {
      final controller = CropController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 400,
              child: ImageCropper(controller: controller),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(ImageCropper),
        matchesGoldenFile('goldens/image_cropper_no_image.png'),
      );

      controller.dispose();
    });

    testWidgets('should match golden with custom colors',
        (WidgetTester tester) async {
      final controller = CropController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 400,
              child: ImageCropper(
                controller: controller,
                backgroundColor: Colors.blue.shade900,
                overlayColor: Colors.purple.withAlpha(77),
                boundaryColor: Colors.yellow,
                boundaryWidth: 3.0,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(ImageCropper),
        matchesGoldenFile('goldens/image_cropper_custom_colors.png'),
      );

      controller.dispose();
    });

    testWidgets('should match golden with grid disabled',
        (WidgetTester tester) async {
      final controller = CropController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 400,
              child: ImageCropper(
                controller: controller,
                showGrid: false,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(ImageCropper),
        matchesGoldenFile('goldens/image_cropper_no_grid.png'),
      );

      controller.dispose();
    });

    testWidgets('should match golden with aspect ratio',
        (WidgetTester tester) async {
      final controller = CropController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 400,
              child: ImageCropper(
                controller: controller,
                aspectRatio: 16 / 9,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(ImageCropper),
        matchesGoldenFile('goldens/image_cropper_aspect_ratio.png'),
      );

      controller.dispose();
    });
  });
}
