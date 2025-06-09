// // here we divided this part into 3 sections, first section is smartdownloads,
// second section is that 2 text widgets and that photo thing, and last section is that set up and its below buttons.
// listview is used here.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/bloc/download_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/Widgets(common)/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

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
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   //postframecall means , ee widget build cheyth kazhinjittulla frame.
    //   // call here for the api, ie, this is the framework.
    //   BlocProvider.of<DownloadBloc>(context)
    //       .add(DownloadEvent.getDownloadsImages());
    // });
    BlocProvider.of<DownloadBloc>(context)
        .add(const DownloadEvent.getDownloadsImages());
    final Size size = MediaQuery.of(context).size;

    // search more about inherit widget in web.
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
        BlocBuilder<DownloadBloc, DownloadsState>(
          builder: (context, state) {
            print(state.downloads);
            return SizedBox(
              width: size.width,
              height: size.width,
              //color: kWhiteB,
              child: Stack(
                // if we use stack in bloc, there's a chance for errors. so avoid.
                // instead we can use in sizedbox
                alignment: Alignment.center,

                children: [
                  CircleAvatar(
                    radius: size.width * 0.41,
                    backgroundColor: kYello?.withOpacity(0.4),
                    // ? is  used to make it conditional..
                  ),
                  DownloadsImageWidget(
                    imageList:
                        '$imageAppendUrl${state.downloads?[0].backdropPath}',
                    size: size,
                    margin: EdgeInsets.only(left: 170),
                    angle: 12,
                  ),
                  DownloadsImageWidget(
                    imageList:
                        '$imageAppendUrl${state.downloads?[1].backdropPath}',
                    size: size,
                    margin: EdgeInsets.only(right: 170),
                    angle: -12,
                  ),
                  DownloadsImageWidget(
                    imageList:
                        '$imageAppendUrl${state.downloads?[2].backdropPath}',
                    size: size,
                    margin: EdgeInsets.only(top: 14),
                  ),
                ],
              ),
            );
          },
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
            image: AssetImage(imageList),
          ),
        ),
      ),
    );
  }
}
