import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Screen"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Home"),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          RaisedButton(
            child: Text("About"),
            onPressed: () {
              print(context);
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
    );
  }
}
