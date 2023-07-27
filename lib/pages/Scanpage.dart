import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class OCRScreen extends StatefulWidget {
  @override
  _OCRScreenState createState() => _OCRScreenState();
}

class _OCRScreenState extends State<OCRScreen> {
  late CameraController _controller;
  bool _isScanning = false;
  String _extractedText = '';

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
    await _controller.initialize();
    await _controller.startImageStream((CameraImage image) {
      if (!_isScanning) {
        detectText(image);
      }
    });
  }

  Future<void> detectText(CameraImage image) async {
    final FirebaseVisionImageMetadata metadata = FirebaseVisionImageMetadata(
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: ImageRotation.rotation90,
      rawFormat: image.format.raw,
      planeData: image.planes
          .map((plane) => FirebaseVisionImagePlaneMetadata(
                bytesPerRow: plane.bytesPerRow,
                height: plane.height,
                width: plane.width,
              ))
          .toList(),
    );
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromBytes(
      concatenatePlanes(image.planes),
      metadata,
    );

    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);

    String text = '';
    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        text += (line.text! + '\n');
      }
    }

    setState(() {
      _extractedText = text;
    });
  }

  Uint8List concatenatePlanes(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();
    planes.forEach((plane) => allBytes.putUint8List(plane.bytes));
    return allBytes.done().buffer.asUint8List();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OCR Screen')),
      body: Column(
        children: [
          Expanded(child: CameraPreview(_controller)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _extractedText,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () {
          setState(() {
            _isScanning = !_isScanning;
          });
        },
      ),
    );
  }
}
