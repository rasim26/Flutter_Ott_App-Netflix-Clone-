import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/WishList/wish_list.dart';
import 'package:netflix_clone/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_clone/presentation/home/widgets/screen_home.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottom_navigation.dart';
import 'package:netflix_clone/presentation/search/search.dart';

// This is the main page.
class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    SearchScreen(),
    ScreenWishList(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
    //ui il ulla athe order il thanne code ilum
    //kondu varan shramikkuka.
  }
}
