import 'package:flutter/material.dart';
import 'package:flutter_sqlite_app/components/SideBar.dart';
import 'package:flutter_sqlite_app/pages/settingspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text("Home"),
        titleSpacing: 00.0,
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
      body: const Text("some textt"),
    );
  }
}
