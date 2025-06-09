import 'package:dilu_1/screen_home1.dart';
import 'package:dilu_1/screen_home2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getSavedData(context);
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: ScreenOne(),
      // routes: {
      //   'Screen_1': (ctx) {
      //     return ScreenOne();
      //   },
      //   'Screen_2': (ctx) {
      //     return ScreenTwo();
      //   }
      // },
    );
  }
}

getSavedData(context) async {
  // ignore: non_constant_identifier_names
  final SharedPrefs = await SharedPreferences.getInstance();
  final savedValue = SharedPrefs.getString('saved_value');
  if (savedValue != null) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ScreenTwo()));
  }
}
