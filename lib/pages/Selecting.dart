import 'dart:math';

import 'package:flutter/material.dart';
import 'Scanpage.dart';
import 'chatpage.dart';
import 'home.dart';
import 'Login/logscreen.dart';

class Selecting extends StatefulWidget {
  const Selecting({Key? key}) : super(key: key);

  @override
  _SelectingState createState() => _SelectingState();
}

class _SelectingState extends State<Selecting> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Homepage(),
    OCRScreen(),
    Chatpage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: _pages[_currentIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Buwaneka',
                style: TextStyle(
                  color: Colors.black, // set the desired color here
                ),
              ),
              accountEmail: Text(
                'Buwaneka@example.com',
                style: TextStyle(
                  color: Colors.black, // set the desired color here
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://example.com/profile_picture.jpg',
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // navigate to settings screen
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                // navigate to help screen
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('KnowledgeKube'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text(
                              'This app was created by Group 5.',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'KnowledgeKube',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '@Version 1.0.0',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 0, 175, 146),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 0, 0, 0), // set your desired color here
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: <Widget>[
        PopupMenuButton(
          icon: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://example.com/profile_picture.jpg',
            ),
            radius: 20, // set the desired radius of the circle avatar
          ),
          itemBuilder: (_) => [
            PopupMenuItem(
              value: 'logout',
              child: Text('Logout'),
            ),
          ],
          onSelected: (value) {
            if (value == 'logout') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginDemo()),
              );
            }
          },
        ),
      ],
    );
  }
}
