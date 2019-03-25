import 'package:flutter/material.dart';
import 'package:flutterest/screens/about/index.dart';
import 'package:flutterest/screens/main/index.dart';
// import 'package:flutterest/screens/profile/index.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "flutterest",
        initialRoute: '/',
        theme: ThemeData(
          primaryColor: Colors.teal
        ),
        routes: {
          "/": (context) => MainScreen(),
          "/about": (context) => About(),
          // "/profile": (context) => Profile(),
        },
      ),
    );
