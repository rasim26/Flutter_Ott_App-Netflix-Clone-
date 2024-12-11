import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/Widget/title.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w440_and_h660_face/wTnV3PCVW5O92JMrFvvrRcV39RU.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        constHeight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.35,
            //helps to give the tiles in aspect ratio
            children: List.generate(
              20,
              (index) {
                return const MainCardMovie();
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MainCardMovie extends StatelessWidget {
  const MainCardMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/reference/Frame 1.png'),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(9),
      ),
    );
  }
}
