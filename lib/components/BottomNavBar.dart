import 'package:flutter/material.dart';
import 'package:flutter_sqlite_app/pages/editpage.dart';
import 'package:flutter_sqlite_app/pages/homepage.dart';
import 'package:flutter_sqlite_app/pages/settingspage.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: EditPage(),
            item: ItemConfig(
              icon: Icon(Icons.edit),
              title: "Edit",
            ),
          ),
          PersistentTabConfig(
            screen: HomePage(),
            item: ItemConfig(
              icon: Icon(Icons.home),
              title: "Home",
            ),
          ),
          PersistentTabConfig(
            screen: SettingsPage(),
            item: ItemConfig(
              icon: Icon(Icons.settings),
              title: "Settings",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style2BottomNavBar(
          navBarConfig: navBarConfig,
        ),
    );
  }
}