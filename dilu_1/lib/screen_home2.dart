import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: Text(name),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            //   ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //     child: Text('Go Back'),
            //   )
            Text('value found'),
          ],
        ),
      ),
    );
  }
}
