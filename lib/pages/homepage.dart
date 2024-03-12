import 'package:flutter/material.dart';
import 'package:flutter_sqlite_app/components/NavBar.dart';
import 'package:flutter_sqlite_app/pages/challengespage.dart';
import 'package:flutter_sqlite_app/pages/userspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    late Widget currentPage;
    late Widget currentTitle;

    switch (_currentIndex) {
      case 0:
        currentPage = const ChallengesPage();
        currentTitle = const Text('Challenges');
        break;
      case 1:
        currentPage = const UsersPage();
        currentTitle = const Text('Users');
        break;
    }

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: currentTitle,
        titleSpacing: 00.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.energy_savings_leaf),
            tooltip: 'Comment Icon',
            onPressed: () {
              setState(() {
                if (_currentIndex==0) {
                  _currentIndex=1;
                } else {
                  _currentIndex=0;
                }
              });
            },
          ), //IconButton
        ],
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.greenAccent[400],
      ),
      body: currentPage,
    );
  }
}
