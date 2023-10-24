import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Name of user
        Text(
          'Hi Nimal',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.left,
        ),

        //text align

        //sub title
        Text(
          'Lets learn something new today',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),

        //progress bar
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
              height: 150,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 47, 113, 255)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //progress
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 25, bottom: 25, top: 25),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(8),
                          child: const Text(
                            'Daily Progress',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      //presentage
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '50%',
                          style: GoogleFonts.bebasNeue(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  LinearPercentIndicator(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    barRadius: Radius.circular(20.0),
                    width: 350,
                    lineHeight: 20.0,
                    percent: 0.5,
                    backgroundColor: const Color.fromARGB(255, 206, 206, 206),
                    progressColor: Color.fromARGB(255, 53, 255, 103),
                  ),
                ],
              ),
            ),
          ),
        )

        //recent history

        //subjects row
      ],
    );
  }
}
