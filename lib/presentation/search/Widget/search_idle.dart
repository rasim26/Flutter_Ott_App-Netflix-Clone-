import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/Widget/title.dart';

// const imageUrl =
//     "https://media.themoviedb.org/t/p/w500_and_h282_face/2vq5GTJOahE03mNYZGxIynlHcWr.jpg";
const imageUrl =
    "https://posters.movieposterdb.com/12_03/2011/1216475/s_1216475_99f43261.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        constHeight,
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (ctx, index) => TopSearchItemTile(),
          separatorBuilder: (ctx, index) => constHeight20,
          itemCount: 10,
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          // to make it 1/3 rd of width
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('lib/reference/chair.jpg'),
            ),
          ),
        ),
        Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
              color: kWhiteB,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: kWhiteB,
          radius: 20,
          child: CircleAvatar(
            backgroundColor: kbla,
            radius: 18,
            child: Icon(
              Icons.play_arrow_rounded,
              color: kYello,
            ),
          ),
        )
      ],
    );
  }
}
