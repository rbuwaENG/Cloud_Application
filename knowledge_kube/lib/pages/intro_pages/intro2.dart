import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class intro2 extends StatelessWidget {
  const intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Just scan where you are struggling...',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Lottie.asset('lib/Animation/ocr.json'),
          ),
        ],
      ),
    );
  }
}
