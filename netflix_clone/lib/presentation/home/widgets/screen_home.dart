import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

import 'package:netflix_clone/presentation/Widgets(common)/main_title.dart';
import 'package:netflix_clone/presentation/Widgets(common)/main_title_card.dart';
import 'package:netflix_clone/presentation/home/widgets/background_main_card_home.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //for netflix like scrolling. ie, when we scroll down, scroll stops and next column will appear.
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                // we can get this info when we use print & debug consol.
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    // we used refactoring the title in main_title_card.dart
                    BackgroundMainCardHome(),
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
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: Duration(milliseconds: 1500),
                        width: double.infinity,
                        height: 80,
                        color: kbla.withOpacity(0.23),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'lib/reference/L.png',
                                  height: 40,
                                  width: 40,
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
                                constWidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'TV Shows',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Movies',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Categories',
                                  style: kHomeTitleText,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : constHeight
              ],
            ),
          );
        },
      ),
    );
  }
}
