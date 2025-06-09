import 'package:dilu_1/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({super.key});

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getSavedData(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _textController,
              ),
              ElevatedButton(
                onPressed: () {
                  saveDatatoStorage();
                },
                child: Text(
                  'save Value',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveDatatoStorage() async {
    // ignore: avoid_print
    print(_textController.text);

    final SharedPrefs = await SharedPreferences.getInstance();

    await SharedPrefs.setString('saved_value', _textController.text);
  }
}
