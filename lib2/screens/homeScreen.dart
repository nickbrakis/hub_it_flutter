// ignore_for_file: file_names
import "package:flutter/material.dart";
import 'package:hub_it_app/assets/hubsList.dart';

class HubitHomeScreen extends StatefulWidget{
  const HubitHomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HubitHomeScreen();
}

class _HubitHomeScreen extends State<HubitHomeScreen>{ //actually starting here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hub.it!'), //app name
        leading: IconButton( //===============must insert calendar================
          icon: const Icon(Icons.arrow_drop_down_sharp),
          onPressed: (){},
          tooltip: 'Calendar',
        ),
      ),

      body: const HubsList(),

      bottomNavigationBar: BottomAppBar(//================ must insert navi=================
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(null)),
          ],
        ),
        color: Colors.blue,
      ),
    );
  }
}