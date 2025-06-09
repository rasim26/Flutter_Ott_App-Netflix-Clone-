import 'package:flutter/material.dart';
import 'package:weather_app_2025/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 148, 180, 219)),
      home: ScreenHome(),
    );
  }
}
