import 'package:flutter/material.dart';
import 'package:plafinder/pages/exploregunpla.dart';
import 'package:intl/intl.dart';
import 'package:plafinder/pages/exploreseries.dart';

class DrawerWidget extends StatelessWidget {
  String cdate1 = DateFormat("EEEEE, dd, yyyy").format(DateTime.now());
  String tdata = DateFormat("HH:mm:ss").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Welcome to Plafinder!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('$cdate1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.timer),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('$tdata',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(height: 25, thickness: 1),
          _drawerItem(
              icon: Icons.folder,
              text: 'Explore',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExploreGunpla()),
                  )),
          _drawerItem(
              icon: Icons.group,
              text: 'Shared with me',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TabBarPage()),
                  )),
          _drawerItem(
              icon: Icons.access_time,
              text: 'Recent',
              onTap: () => print('Tap Recent menu')),
          _drawerItem(
              icon: Icons.delete,
              text: 'Trash',
              onTap: () => print('Tap Trash menu')),
          Divider(height: 25, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Labels",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.bookmark,
              text: 'Family',
              onTap: () => print('Tap Family menu')),
        ],
      ),
    ));
  }
}

Widget _drawerItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
