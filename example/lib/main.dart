import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterish_image_cropper/flutterish_image_cropper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Cropper Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CropperDemo(),
    );
  }
}

class CropperDemo extends StatefulWidget {
  const CropperDemo({Key? key}) : super(key: key);

  @override
  State<CropperDemo> createState() => _CropperDemoState();
}

class _CropperDemoState extends State<CropperDemo> {
  final CropController _controller = CropController();
  Uint8List? _croppedImageBytes;
  double? _aspectRatio;

  @override
  void initState() {
    super.initState();
    _loadSampleImage();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadSampleImage() async {
    // Load a sample image from assets or create a colored image
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint();

    // Draw a colorful gradient sample image
    const size = 800.0;
    final gradient = ui.Gradient.linear(
      const Offset(0, 0),
      const Offset(size, size),
      [
        Colors.blue,
        Colors.purple,
        Colors.pink,
        Colors.orange,
      ],
    );

    paint.shader = gradient;
    canvas.drawRect(const Rect.fromLTWH(0, 0, size, size), paint);

    // Add some text
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'Sample Image\nfor Cropping',
        style: TextStyle(
          color: Colors.white,
          fontSize: 60,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset((size - textPainter.width) / 2, (size - textPainter.height) / 2),
    );

    final picture = recorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());

    _controller.setImage(image);
  }

  Future<void> _cropImage() async {
    final result = await _controller.crop();
    if (result != null) {
      setState(() {
        _croppedImageBytes = result.imageBytes;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image cropped: ${result.width}x${result.height}'),
          ),
        );
      }
    }
  }

  void _setAspectRatio(double? ratio) {
    setState(() {
      _aspectRatio = ratio;
    });
    _controller.setAspectRatio(ratio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutterish Image Cropper'),
        actions: [
          IconButton(
            icon: const Icon(Icons.rotate_left),
            onPressed: _controller.rotateLeft,
            tooltip: 'Rotate Left',
          ),
          IconButton(
            icon: const Icon(Icons.rotate_right),
            onPressed: _controller.rotateRight,
            tooltip: 'Rotate Right',
          ),
          PopupMenuButton<double?>(
            icon: const Icon(Icons.aspect_ratio),
            tooltip: 'Aspect Ratio',
            onSelected: _setAspectRatio,
            itemBuilder: (context) => [
              const PopupMenuItem(value: null, child: Text('Free')),
              const PopupMenuItem(value: 1.0, child: Text('Square (1:1)')),
              const PopupMenuItem(value: 4 / 3, child: Text('4:3')),
              const PopupMenuItem(value: 16 / 9, child: Text('16:9')),
              const PopupMenuItem(value: 3 / 4, child: Text('3:4')),
              const PopupMenuItem(value: 9 / 16, child: Text('9:16')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ImageCropper(
              controller: _controller,
              aspectRatio: _aspectRatio,
              backgroundColor: Colors.black87,
              overlayColor: const Color(0xAA000000),
              boundaryColor: Colors.white,
              showGrid: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: _cropImage,
                  icon: const Icon(Icons.crop),
                  label: const Text('Crop Image'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (_croppedImageBytes != null) ...[
                  const Text(
                    'Cropped Result:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.memory(
                        _croppedImageBytes!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
