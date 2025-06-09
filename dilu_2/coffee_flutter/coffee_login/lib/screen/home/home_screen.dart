import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/image copy 2.png',
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 100, left: 25, right: 25, bottom: 25),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 13.0),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 13.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
