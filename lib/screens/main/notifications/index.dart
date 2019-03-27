import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  var testObj = {"name": "Notifications"};
  var test;
  @override
  Widget build(BuildContext context) {
    print(test);
    return Center(child: Text(testObj['name']),);
    //  Scaffold(
    //   body: Center(
    //     child: Text(),
    //   ),
    // );
  }
}
