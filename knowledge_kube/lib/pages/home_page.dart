import 'package:flutter/material.dart';
import 'package:knowledge_kube/pages/auth_page.dart';
import 'package:knowledge_kube/pages/scan_page.dart';
import 'package:knowledge_kube/pages/user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/bottom_nvbar.dart';
import 'chat_page.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _index = 0;

  void nagateBottombar(int index) {
    setState(() {
      _index = index;
    });
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AuthPage()));
  }

  final List<Widget> _pages = [
    const UserPage(),
    const ScanPage(),
    const ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 128, 122, 122),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
              color: Color.fromARGB(255, 255, 255, 255));
        }),
      ),
      bottomNavigationBar: bottomNav(
        onTabChange: (index) => nagateBottombar(index),
      ),
      drawer: Drawer(
          backgroundColor: Colors.grey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    child: Image.asset(
                      'lib/images/logo.png',
                    ),
                  ),

                  //white line
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: Colors.grey[800],
                    ),
                  ),

                  //list tile
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text(
                        'ABOUT',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        '20/ENG/016',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        '20/ENG/061',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        '20/ENG/194',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        '20/ENG/101',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: GestureDetector(
                  onTap: logout,
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      'LOGOUT',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )),
      body: _pages[_index],
    );
  }
}
