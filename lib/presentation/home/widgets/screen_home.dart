import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/Widgets(common)/main_card.dart';
import 'package:netflix_clone/presentation/Widgets(common)/main_title.dart';
import 'package:netflix_clone/presentation/Widgets(common)/main_title_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // this widget helps to scroll through columns vertical.
        child: Column(
          children: [
            // we used refactoring the title in main_title_card.dart
            MainTitleCard(
              title: "Released in the past year",
            ),
            constHeight,
            MainTitleCard(
              title: "Trending Now",
            ),
            constHeight,
            Column(
              // this will make the tile with number on it, just like in Netflix.
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainTitle(
                  title: "Top 10 TV Shows in India",
                ),
                constHeight,
                LimitedBox(
                  maxHeight: 200,
                  child: ListView(
                    scrollDirection:
                        Axis.horizontal, // to make it horizontal mo
                    children: List.generate(
                      10,
                      (index) => NumberCard(
                        index: index,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            MainTitleCard(
              title: "Tense Dramas",
            ),
            constHeight,
            MainTitleCard(
              title: "South Indian Cinema",
            ),
          ],
        ),
      ),
    );
  }
}
