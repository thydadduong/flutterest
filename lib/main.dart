import 'package:flutter/material.dart';
import 'package:flutterest/screens/about/index.dart';
import 'package:flutterest/screens/main/index.dart';
// import 'package:flutterest/screens/profile/index.dart';

void main() {
  // FlutterStatusbarcolor.
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutterest",
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: Colors.red,
        iconTheme: IconThemeData(color: Color(0xff787878)),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Color(0xff787878)),
        ),
      ),
      routes: {
        "/": (context) => MainScreen(),
        "/about": (context) => About(),
        // "/profile": (context) => Profile(),
      },
    ),
  );
}
