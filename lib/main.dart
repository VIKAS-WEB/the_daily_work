//import 'dart:async';
//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:the_daily_work/Home_Page.dart';
import 'package:the_daily_work/Options.dart';
//import 'package:flutter/services.dart';
import 'package:the_daily_work/Splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MaterialColor mycolor = const MaterialColor(
    0xFF591cbe3,
    <int, Color>{
      50: Color(0xff591cbe3),
      100: Color(0xff591cbe3),
      200: Color(0xff591cbe3),
      300: Color(0xff591cbe3),
      400: Color(0xff591cbe3),
      500: Color(0xff591cbe3),
      600: Color(0xff591cbe3),
      700: Color(0xff591cbe3),
      800: Color(0xff591cbe3),
      900: Color(0xff591cbe3),
    },
  );

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Daily Work',
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: const SplashScreen(),
    );
  }
}
