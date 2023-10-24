import 'package:flutter/material.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScalableOCR(
          paintboxCustom: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 5.0
            ..color = const Color.fromARGB(153, 102, 160, 241),
          boxLeftOff: 4,
          boxBottomOff: 2.7,
          boxRightOff: 4,
          boxTopOff: 2.7,
          boxHeight: MediaQuery.of(context).size.height / 2,
          getScannedText: () {}),
    );
  }
}
