import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 128,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: kradius10,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("lib/reference/padikal.jpg"),
            // image: NetworkImage(
            //   "https://www.figma.com/design/e2guy1rWdFiNs1pz00DeSF/Ui-for-Ott-App?node-id=472-62&t=WCLRxSwtifEMUFQI-4",
            // ),
          ),
        ),
      ),
    );
  }
}
