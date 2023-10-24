import 'package:flutter/material.dart';
import 'package:knowledge_kube/pages/intro_pages/intro1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_pages/intro2.dart';
import 'intro_pages/intro3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //controller
  PageController _controller = PageController();

  //chek if last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            onLastPage = (index == 2);
          });
        },
        children: [
          intro1(),
          intro2(),
          intro3(),
        ],
      ),
      Container(
        alignment: Alignment(0.0, 0.85),
        child: SmoothPageIndicator(controller: _controller, count: 3),
      ),
    ]));
  }
}
