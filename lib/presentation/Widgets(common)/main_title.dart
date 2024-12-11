import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 25,
      ),
    );
  }
}
