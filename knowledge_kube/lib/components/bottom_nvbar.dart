import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class bottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  bottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Colors.transparent,
        child: GNav(
          color: Colors.grey[400],
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 20,
          onTabChange: ((value) => onTabChange!(value)),
          tabs: const [
            GButton(icon: Icons.person, text: 'User'),
            GButton(icon: Icons.search, text: 'Scan'),
            GButton(icon: Icons.message, text: 'Chat'),
          ],
        ));
  }
}
