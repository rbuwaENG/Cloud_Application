import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
          child: Text(
            'Hi Buwaneka,',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 8.0),
          child: Text(
            'let\'s learn smarter not harder',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        // other widgets in the body
      ],
    );
  }
}
