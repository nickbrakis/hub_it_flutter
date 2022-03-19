// ignore_for_file: file_names
import "package:flutter/material.dart";
import 'package:hub_it_app/assets/hubsList.dart';

import 'package:intl/intl.dart';

class HubitHomeScreen extends StatefulWidget{
  const HubitHomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HubitHomeScreen();
}

  

class _HubitHomeScreen extends State<HubitHomeScreen>{ //actually starting here
  DateTime selectedDate = DateTime.now();
  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    // destroyHubsList();
    // buildHubsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('dd/MM/yyyy').format(selectedDate),
              style: const TextStyle(color: Colors.white)),//app name
        leading: IconButton( //this is the calendar
          icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white, size: 40.0),
          onPressed: () => selectDate(context),
          tooltip: 'Calendar',
        ),
        actions:  <Widget>[
          Row(children: <Widget> [
            ElevatedButton(
              onPressed: () {},
              child: Row(
                children: const <Widget>[
                  Text('User', style: TextStyle(fontSize: 20, color: Colors.white),), // <-- Text
                  SizedBox(
                    width: 15,
                  ),
                  ImageIcon(AssetImage('assets/images/user.png'), color: Colors.white, size: 25),
                ],
              ),
            ),
            const SizedBox(
                    width: 15,
                  ),]
          ),
        ],

        backgroundColor: const Color.fromARGB(255, 56, 56, 56),
      ),

      body: Column(
        children: [
          Container(height: 10, color: const Color.fromARGB(180, 53, 53, 53)),
          Container(height: 10, color: Colors.white),
          const Expanded(
            child: HubsList()
          )
        ]
      ),

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