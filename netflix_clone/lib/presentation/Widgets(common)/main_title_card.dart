import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/Widgets(common)/main_card.dart';
import 'package:netflix_clone/presentation/Widgets(common)/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        constHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal, // to make it horizontal mo
            children: List.generate(
              10,
              (index) => const MainCard(),
            ),
          ),
        ),
      ],
    );
  }
}
