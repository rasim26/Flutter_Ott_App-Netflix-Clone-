import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        constWidth,
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: kWhiteB,
          ),
        ),
        Spacer(),
        Icon(
          Icons.cast,
          size: 25,
          color: kWhiteB,
        ),
        constWidth,
        Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(14),
          ),
          width: 25,
          height: 25,
        ),
        //color: Colors.blueGrey,
        constWidth,
      ],
    );
  }
}
