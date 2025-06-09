import 'package:coffee_login/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var d = Duration(seconds: 3);
    Future.delayed(d, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/Seaside-Girl-2560x1600.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SizedBox(
            height: 250,
            width: 250,
            child: Image.asset(
              'assets/images/image copy.png',
            ),
          ),
        ),
      ),
    );
  }
}
