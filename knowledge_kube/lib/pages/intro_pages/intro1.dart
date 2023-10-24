import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class intro1 extends StatelessWidget {
  const intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'The ultimate App For Organizing And Accessing Your Knowledge With Ease...',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Lottie.asset('lib/Animation/brain.json'),
            ),
          ],
        ),
      ),
    );
  }
}
