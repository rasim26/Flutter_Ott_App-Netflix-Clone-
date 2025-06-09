import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:netflix_clone/application/bloc/download_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';

import 'package:netflix_clone/domain/core/di/injectable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_clone/presentation/home/widgets/screen_home.dart';
import 'package:netflix_clone/presentation/main_page/widgets/screen_main_page.dart';

Future<void> main() async {
  await configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DownloadBloc>()),
      ],
      child: MaterialApp(
        home: ScreenMainPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          textTheme: const TextTheme(
            bodySmall: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
          ),
          scaffoldBackgroundColor: backGroundColor,
        ),
      ),
    );
  }
}
