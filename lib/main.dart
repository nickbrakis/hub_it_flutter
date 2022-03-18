
import "package:flutter/material.dart";
import '/screens/homeScreen.dart';
void main() => runApp(const Hubit());

class Hubit extends StatelessWidget {
  const Hubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Hub.it!',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    home: const HubitHomeScreen(),
    );
  }
}