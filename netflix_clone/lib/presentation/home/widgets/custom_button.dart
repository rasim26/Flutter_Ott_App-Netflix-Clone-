
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class Custom_button extends StatelessWidget {
  const Custom_button({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteB,
          size: 30,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
