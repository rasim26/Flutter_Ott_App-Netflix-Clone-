// here we divided this part into 3 sections, first section is smartdownloads,
// second section is that 2 text widgets and that photo thing, and last section is that set up and its below buttons.
// listview is used here.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/Widgets(common)/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
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
          const _SmartDownloads(),
          Section2(),
          const Section3(),
        ],
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    "https://media.themoviedb.org/t/p/w440_and_h660_face/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
    "https://media.themoviedb.org/t/p/w440_and_h660_face/wTnV3PCVW5O92JMrFvvrRcV39RU.jpg",
    "https://media.themoviedb.org/t/p/w440_and_h660_face/wWba3TaojhK7NdycRhoQpsG0FaH.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        constHeight,
        Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhiteB,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        constHeight,
        Text(
          "We'll download a personalised selection of\n movies & shows for you, so there's\n always something to watch on your\n device",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blueGrey[200],
            fontSize: 15,
          ),
        ),
        constHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          //color: kWhiteB,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.41,
                backgroundColor: kYello?.withOpacity(0.4),
                // ? is  used to make it conditional..
              ),
              DownloadsImageWidget(
                imageList: imageList[0],
                size: size,
                margin: EdgeInsets.only(left: 170),
                angle: 12,
              ),
              DownloadsImageWidget(
                imageList: imageList[1],
                size: size,
                margin: EdgeInsets.only(right: 170),
                angle: -12,
              ),
              DownloadsImageWidget(
                imageList: imageList[2],
                size: size,
                margin: EdgeInsets.only(top: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kYelloB,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        constHeight,
        MaterialButton(
          color: kWhiteB,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See What You Can Download',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
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
        width: size.width * 0.44,
        height: size.width * 0.59,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageList),
          ),
        ),
      ),
    );
  }
}
