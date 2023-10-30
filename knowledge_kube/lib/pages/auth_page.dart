import 'package:flutter/material.dart';
import 'package:knowledge_kube/pages/login_page.dart';
import 'package:knowledge_kube/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleView() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return loginPage(showRegisterPage: toggleView);
    } else {
      return RegisterPage(showLoginPage: toggleView);
    }
  }
}
