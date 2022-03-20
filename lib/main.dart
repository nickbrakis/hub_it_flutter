
import "package:flutter/material.dart";
import 'package:hub_it_app/screens/homeScreen.dart';
import 'package:hub_it_app/screens/hubsScreen.dart';
import 'package:hub_it_app/screens/settingsScreen.dart';
void main() => runApp(const Hubit());

class Hubit extends StatelessWidget {
  const Hubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Hub.it!',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryTextTheme: const TextTheme(headline6: TextStyle(color: Colors.white))
      ),
    home: const HubitHomeScreen(),
    // home: const SettingsWidget(),
    );
  }
}