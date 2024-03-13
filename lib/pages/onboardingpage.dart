import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite_app/pages/homepage.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      globalBackgroundColor: Colors.white,
      scrollPhysics: BouncingScrollPhysics(),
      pages: [
        PageViewModel(
          titleWidget: const Text(
            "Welcome to a healthy life!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: "this application will get you to train your mind and body",
          image: Image.asset(
            "images/run3.jpg",
            height: 400,
            width: 400,
          ),
        ),
        PageViewModel(
          titleWidget: const Text(
            "Welcome to a healthy life!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: "this application will get you to train your mind and body",
          image: Image.asset(
            "images/run2.jpg",
            height: 400,
            width: 400,
          ),
        ),
        PageViewModel(
          titleWidget: const Text(
            "Welcome to a healthy life!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: "this application will get you to train your mind and body",
          image: Image.asset(
            "images/run1.jpg",
            height: 400,
            width: 400,
          ),
        ),
      ],
      onDone: () {
        Get.toNamed("home");
      },
      onSkip: () {
        Get.toNamed("home");
      },
      showSkipButton: true,
      skip: const Text(
        "skip",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.lightGreen),
      ),
      next: const Icon(Icons.arrow_forward,color: Colors.lightGreen,),
      done: const Text(
        "done",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.lightGreen),
      ),
      dotsDecorator: DotsDecorator(
        size: Size.square(10.0),
        activeSize: Size(20.0, 10.0),
        color: Colors.black26,
        activeColor: Colors.lightGreen,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        )
      ),
    ));
  }
}
