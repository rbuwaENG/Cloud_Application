import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String userName = '';

  _fetchData() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        userName = ds.data()?['firstname'];
      }).catchError((e) {
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Name of user
        FutureBuilder(
          future: _fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text(
                "Hello $userName",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.left,
              );
            }
            return Text('Loading...', style: TextStyle(color: Colors.white));
          },
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

                  const SizedBox(
                    height: 10,
                  ),
                  // need to create chat history show here
                  //
                ],
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 20,
        ),
        Text(
          'Saved Answers and Questions',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        //recent history
        Container(
          padding: EdgeInsets.all(10),
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  padding: EdgeInsets.all(8),
                  child: Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Q. What is the capital of Srilanka?',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'A. The capital of Sri Lanka is Colombo.',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 233, 106),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  padding: EdgeInsets.all(8),
                  child: Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Q. What are the nobel gases?',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'A. The noble gases are helium, neon, argon, krypton, xenon, and radon.',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 106, 255, 186),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  padding: EdgeInsets.all(8),
                  child: Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Q. How to solve intregal',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'A.o solve an integral, you will need to use integration techniques. Depending on the type of integral, you may need  to use a variety of methods such as substitution, integration by parts, or trigonometric substitution. You may also need to use integration tables or software to help you solve the integral',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 111, 255, 106),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),

        //subjects row
      ],
    );
  }
}
