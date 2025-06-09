// We need 2 ui's for this part, a search button with searching bar
// A search result Ui , with the help of api keys.
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/Widget/search_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: TextEditingController(),
                style: TextStyle(
                  color: kWhiteB,
                  // backgroundColor: kWhiteB.withOpacity(0.5),
                ),
                decoration: InputDecoration(
                    fillColor: kYello,
                    prefixIcon: Icon(Icons.search_rounded),
                    suffixIcon: Icon(Icons.clear_all_rounded),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        color: kYelloB,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Search for your favourite movie'),
              ),
              constHeight,
              // const Expanded(
              //   child: SearchIdleWidget(),
              // ),
              const Expanded(child: SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
