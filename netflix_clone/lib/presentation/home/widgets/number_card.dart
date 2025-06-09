import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.index,
  });
  final int index; //used to pass index, different number for diff. tile.
// here we need to modify the code in maincard, ie, we just need to add numbers infront of it.
// we need to use stack & also a specific sizedbox for that gap and overlapping number.
  @override
  Widget build(BuildContext context) {
    return Stack(
      // we used to wrap with column and change it into stack bcz, directly wrapiing with stack is not possible.
      children: [
        Row(
          children: [
            // sizedbox with 40 W & 150 H
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 130,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: kradius10,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("lib/reference/chair.jpg"),
                ),
              ),
            ),
          ],
        ),
        // widget placed below row will overlap infront of it.
        Positioned(
          // to position the number.
          left: 16,
          bottom: -45,
          child: BorderedText(
            strokeWidth: 4,
            strokeColor: kYelloB,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: 145,
                color: Colors.black.withOpacity(0.19),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
