import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/WishList/title.dart';

class ScreenWishList extends StatelessWidget {
  const ScreenWishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WishlistTitle(),
        constHeight,
        Expanded(
          child: Wishlistshowitem(),
        )
      ],
    );
  }
}

class WishListItem extends StatelessWidget {
  const WishListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/reference/Group 4.jpg'),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(9),
      ),
    );
  }
}

class Wishlistshowitem extends StatelessWidget {
  const Wishlistshowitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        constHeight20,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.40,
            //helps to give the tiles in aspect ratio
            children: List.generate(
              4,
              (index) {
                return const WishListItem();
              },
            ),
          ),
        ),
      ],
    );
  }
}

//   }
// }
// class Wishlistitemtile extends StatelessWidget {
//   const Wishlistitemtile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Row(
//       children: [
//         Container(
//           width: screenWidth * 0.35,
//           height: 65,
//           // to make it 1/3 rd of width
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage('lib/reference/chair.jpg'),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
