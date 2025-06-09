import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';

class BackgroundMainCardHome extends StatelessWidget {
  const BackgroundMainCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity, // to get the maximum screen width.
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(kmainimage),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              //we need to position the icon button
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Custom_button(
                  icon: Icons.add,
                  title: 'Mylist',
                ),
                _playbutton(),
                Custom_button(
                  icon: Icons.info_outline,
                  title: 'Info',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

TextButton _playbutton() {
  return TextButton.icon(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(kWhiteB),
    ),
    icon: Icon(
      Icons.play_arrow,
      color: kbla,
      size: 29,
    ),
    onPressed: () {},
    label: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Play',
        style: TextStyle(
          color: kbla,
          fontSize: 18,
        ),
      ),
    ),
  );
}
