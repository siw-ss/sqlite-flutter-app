import 'package:flutter/material.dart';
import 'package:flutter_sqlite_app/components/BottomNavBar.dart';
import 'package:flutter_sqlite_app/pages/homepage.dart';
import 'package:flutter_sqlite_app/pages/onboardingpage.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'SQLITE',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
          useMaterial3: true,
        ),
        getPages: [
          GetPage(name: '/', page: ()=>OnBoardingPage(),),
          GetPage(name: '/home', page: ()=>HomePage(),),
        ],
        home: BottomNavBar(),
    );
  }
}
