import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://avatars.githubusercontent.com/u/58992351?s=400&u=7816fc95d576f784898597371a42cd5876850109&v=4.jpg";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Shashank shakya "),
                accountEmail: Text("shashankshakya@duck.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl)),
              ),
            ),
           ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
              ),
              title: Text( 
                "Home",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
              ),
           ),
        ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
              ),
              title: Text( 
                "Profile",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
              ),
           ),
           ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
              ),
              title: Text( 
                "Email me",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
              ),
           ),
          ],
        ),
      ),
    );
  }
}
