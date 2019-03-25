import 'package:flutter/material.dart';
import 'package:flutterest/screens/main/following/index.dart';
import 'package:flutterest/screens/main/home/index.dart';
import 'package:flutterest/screens/main/notifications/index.dart';
import 'package:flutterest/screens/main/profile/index.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);
  List<Widget> fragments = <Widget>[
    Home(),
    Following(),
    Notifications(),
    Profile()
  ];
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 1;
  double appbarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    print(appbarHeight);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: RaisedButton(
            child: Row(
              children: <Widget>[
                Icon(Icons.search, color: Color(0xff787878)),
                SizedBox(width: 8),
                Expanded(
                  child:
                      Text("data", style: TextStyle(color: Color(0xff787878))),
                  /* TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ), */
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {},
                )
              ],
            ),
            elevation: 0,
            splashColor: Colors.transparent,
            // highlightColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            onPressed: () {},
          ),
          // color: Colors.white,
          // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0))),
          height: appbarHeight - 16.0,
        ),
        actions: <Widget>[
          _selectedIndex != 3
              ? IconButton(
                  icon: Icon(Icons.message),
                  tooltip: "Manage following",
                  onPressed: () {},
                )
              : SizedBox(),
          _selectedIndex == 1
              ? IconButton(
                  icon: Icon(Icons.edit),
                  tooltip: "Manage following",
                  onPressed: () {},
                )
              : SizedBox(),
          _selectedIndex == 3
              ? IconButton(
                  icon: Icon(Icons.settings),
                  tooltip: "Manage following",
                  onPressed: () {},
                )
              : SizedBox(),
          _selectedIndex == 3
              ? IconButton(
                  icon: Icon(Icons.add),
                  tooltip: "Manage following",
                  onPressed: () {},
                )
              : SizedBox(),
        ],
      ),
      // AppBar(),
      body: Column(
        children: <Widget>[Expanded(child: widget.fragments[_selectedIndex])],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_work), title: Text("Following")),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), title: Text("Notifications")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Profile")),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
