import 'package:flutter/material.dart';
import 'package:cursis/screens/setting_or_start_screen.dart';
import 'package:cursis/screens/home.dart';
import 'package:cursis/screensplash.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(244, 255, 255, 255)),
      initialRoute: '/',
      routes: {
        '/': (context) => splashScreens(),
        '//': (context) => Home_page(),
      },
      debugShowCheckedModeBanner: false,
    ));
