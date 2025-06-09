import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_scroll_view/horizontal_scroll_view.dart';
import 'package:weather_app_2025/Screens/menu.dart';
import 'package:weather_app_2025/constants/colour.dart';
import 'package:weather_app_2025/constants/font.dart';
import 'package:weather_icons/weather_icons.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "WeatherApp",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: appbarcolor,
          ),
        ),
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   color: appbarcolor,
        //   tooltip: 'Open menu',
        //   onPressed: () {},
        // ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: appbarcolor,
            ),
            tooltip: 'Search',
          ),
        ],
      ),
      drawer: const NavigationDrawer(),
      backgroundColor: const Color.fromARGB(255, 148, 180, 219),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kottakkal',
                  style: GoogleFonts.barlow(
                    textStyle: TextStyle(
                      fontSize: 29,
                      color: Fontcolor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '34°C',
                          style: GoogleFonts.coustard(fontSize: 75),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: Image.asset(
                        'lib/pngs/cloud.png',
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20)),
                  width: double.infinity,
                  height: 100,
                  margin: EdgeInsets.all(4),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    WeatherIcons.thermometer,
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  '34°C',
                                  style: smallfont,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: Icon(
                                    WeatherIcons.raindrops,
                                    size: 60,
                                  ),
                                ),
                                Text(
                                  '49%',
                                  style: smallfont,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    WeatherIcons.wind_beaufort_0,
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  '3 Km/hr',
                                  style: smallfont,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: appbarcolor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                HorizontalScrollView(
                  itemWidth: 130,
                  crossAxisSpacing: 8.0,
                  children: [
                    Container(
                      height: 150,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blueGrey),
                      margin: EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '9:00 Am',
                              style: TextStyle(
                                fontSize: 18,
                                color: Fontcolor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              WeatherIcons.cloud,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('33°C'),
                          ),
                          Text('scattered clouds'),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey),
                  margin: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '12:00 Pm',
                          style: TextStyle(
                            fontSize: 18,
                            color: Fontcolor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          WeatherIcons.cloud,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('34°C'),
                      ),
                      Text('scattered clouds'),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey),
                  margin: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '9:00 Am',
                          style: TextStyle(
                            fontSize: 18,
                            color: Fontcolor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          WeatherIcons.cloud,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('36°C'),
                      ),
                      Text('scattered clouds'),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey),
                  margin: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '9:00 Am',
                          style: TextStyle(
                            fontSize: 18,
                            color: Fontcolor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          WeatherIcons.cloud,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('33°C'),
                      ),
                      Text('scattered clouds'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Colors.grey,
        shadowColor: appbarcolor,
        surfaceTintColor: appbarcolor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Container();
  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: ListTile(
              leading: Text(
                'Menu',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text(
              'History',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.dark_mode_outlined),
            title: Text(
              'Dark Mode',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
        ],
      );
}
