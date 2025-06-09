import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/Widgets(common)/main_title.dart';

class WishlistTitle extends StatelessWidget {
  const WishlistTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return MainTitle(title: "Movie WatchList");
  }
}
