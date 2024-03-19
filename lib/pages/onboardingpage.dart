import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_sqlite_app/pages/homepage.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}


  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    super.initState();
    initialization();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      globalBackgroundColor: Colors.white,
      scrollPhysics: const BouncingScrollPhysics(),
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
