import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';

import 'chat_page.dart';
import 'send_Data.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String text = "";
  final StreamController<String> controller = StreamController<String>();

  void setText(value) {
    controller.add(value);
  }

  late String text2 = "what is sri lanka";

  void _gotochat() {
    sendData(text: text2);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ScalableOCR(
              paintboxCustom: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 5.0
                ..color = const Color.fromARGB(153, 102, 160, 241),
              boxLeftOff: 5,
              boxBottomOff: 2.7,
              boxRightOff: 8,
              boxTopOff: 2.7,
              boxHeight: MediaQuery.of(context).size.height / 2,
              getScannedText: (value) {
                setText(value);
              }),
        ),
        StreamBuilder<String>(
          stream: controller.stream,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Result(text: snapshot.data != null ? snapshot.data! : "");
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: GestureDetector(
            onTap: _gotochat,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              child: Center(
                child: Text(
                  'Help me',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Q: $text",
        textAlign: TextAlign.left,
      ),
    );
  }
}
