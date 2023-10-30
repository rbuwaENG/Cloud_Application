import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final ageController = TextEditingController();
  final mobilenoController = TextEditingController();
  final academyController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signUp() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((signedinuser) {
      storeNewUser(signedinuser.user, context);
    });

    //add user details
  }

  storeNewUser(user, context) async {
    var user = await FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set({
          'email': user.email,
          'uid': user.uid,
          'firstname': firstnameController.text.trim(),
          'lastname': lastnameController.text.trim(),
          'age': int.parse(ageController.text.trim()),
          'mobileno': mobilenoController.text.trim(),
          'academy': academyController.text.trim(),
        })
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => homePage())))
        .catchError((e) {
          print(e);
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstnameController.dispose();
    lastnameController.dispose();
    ageController.dispose();
    mobilenoController.dispose();
    academyController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 128, 122, 122),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //title
                Text(
                  'HELLO TEHRE!',
                  style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),

                //sub titl
                Text(
                  'Exited to learn with you',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),

                const SizedBox(height: 10), //for spacing
                //first  name field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: firstnameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'First name ',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 10), //for spacing

                //last name field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: lastnameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'last name ',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 10), //for spacing

                //age  field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Age',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 10), //for spacing

                //mobile number field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: mobilenoController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Mobile No ',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 10), //for spacing

                //Academy field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: academyController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Academy name ',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 10), //for spacing

                //Email text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 10), //for spacing
                //Password text field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 10), //for spacing

                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20), //for spacing
                //in row register me link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10), //for spacing

                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'Login me',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 73, 133),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
