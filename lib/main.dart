import 'package:flutter/material.dart';
import './screens/welcome_screen.dart';
import './screens/my_image_page.dart';

void main() {
  runApp(const ReetemApp());
}

class ReetemApp extends StatelessWidget {
  const ReetemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reetem Donasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
