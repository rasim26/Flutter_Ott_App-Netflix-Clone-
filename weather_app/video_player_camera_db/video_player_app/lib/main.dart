// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';
// import 'screen_home.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize Hive for local storage
//   final appDocumentDir = await getApplicationDocumentsDirectory();
//   await Hive.initFlutter(appDocumentDir.path);
//   await Hive.openBox('videosBox'); // Open or create Hive box

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Video Player',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
//         useMaterial3: true,
//       ),
//       home: const ScreenHome(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:video_player_app/screen_home.dart';

import 'db.dart'; // Import your db.dart file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final appDocumentDir = await getApplicationDocumentsDirectory();
  //await Hive.initFlutter(appDocumentDir.path);
  await Hive.initFlutter();
  await Hive.openBox('Gallery');
  await VideoDatabase.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Player',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: true,
      ),
      home: const ScreenHome(),
    );
  }
}
