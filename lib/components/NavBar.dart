import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('Lorem Ipsium'),
          accountEmail: Text('lorem@gmail.com'),
          currentAccountPicture: CircleAvatar(
              child: ClipOval(
            child: Image.network(
              "https://images.pexels.com/photos/1391498/pexels-photo-1391498.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          )),
          decoration: BoxDecoration(
            color: Colors.green,
            image: DecorationImage(
              image: const NetworkImage(
                  "https://i0.wp.com/picjumbo.com/wp-content/uploads/magical-spring-forest-scenery-during-morning-breeze-free-photo.jpg?w=600&quality=80"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text("Favorites"),
          onTap: () => print('fav'),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text("Friends"),
          onTap: () => print('ppz'),
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text("Share"),
          onTap: () => print('share'),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Requests"),
          onTap: () => print('notif'),
          trailing: ClipOval(
            child: Container(
              color: Colors.red,
              width: 20,
              height: 20,
              child: const Center(
                child: Text(
                  '8',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () => print('settings'),
        ),
        ListTile(
          leading: Icon(Icons.description),
          title: Text("Policies"),
          onTap: () => print('policies'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text("Exit"),
          onTap: () => print('exit'),
        ),
      ],
    ));
  }
}
