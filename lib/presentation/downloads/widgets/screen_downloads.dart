import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/Widgets(common)/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final List imageList = [
    "https://media.themoviedb.org/t/p/w440_and_h660_face/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
    "https://media.themoviedb.org/t/p/w440_and_h660_face/wTnV3PCVW5O92JMrFvvrRcV39RU.jpg",
    "https://media.themoviedb.org/t/p/w440_and_h660_face/wWba3TaojhK7NdycRhoQpsG0FaH.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //to get a container space for any size.
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView(
        children: [
          const _smartDownloads(),
          Text('Introducing Downloads For You'),
          Text(
            "we'll Download a Personalized selection of Movies & Shows for you, So there's always something to watch on your Device",
          ),
          SizedBox(
            width: size.width,
            height: size.width,
            //color: kWhiteB,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.39,
                  backgroundColor: kYello,
                ),
                DownloadsImageWidget(
                  imageList: imageList[0],
                  size: size,
                  margin: EdgeInsets.only(left: 150),
                  angle: 20,
                ),
                DownloadsImageWidget(
                  imageList: imageList[1],
                  size: size,
                  margin: EdgeInsets.only(right: 150),
                  angle: -20,
                ),
                DownloadsImageWidget(
                  imageList: imageList[2],
                  size: size,
                  margin: EdgeInsets.only(bottom: 5),
                ),
              ],
            ),
          ),
          MaterialButton(
            color: kYelloB,
            onPressed: () {},
            child: Text(
              'Setup',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          MaterialButton(
            color: kWhiteB,
            onPressed: () {},
            child: Text(
              'See What You Can Download',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        constWidth,
        Icon(
          Icons.settings,
          color: kYelloB,
        ),
        constWidth,
        Text('Smart Downloads'),
        constWidth,
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    required this.size,
    this.angle = 0,
    required this.margin,
  });

  final Size size;
  final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * 0.4,
        height: size.width * 0.58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageList),
          ),
        ),
      ),
    );
  }
}
