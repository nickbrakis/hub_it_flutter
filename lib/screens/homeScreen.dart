// ignore_for_file: file_names
import "package:flutter/material.dart";
import 'package:hub_it_app/assets/hubsList.dart';
import 'package:hub_it_app/screens/hubsScreen.dart';
import 'package:hub_it_app/screens/settingsScreen.dart';
import 'package:hub_it_app/assets/naviBar.dart';

import 'package:intl/intl.dart';

class HubitHomeScreen extends StatefulWidget{
  const HubitHomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HubitHomeScreen();
}

  

class _HubitHomeScreen extends State<HubitHomeScreen>{ //actually starting here
  DateTime selectedDate = DateTime.now();
  int _selectedIndex = 0;

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

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          break;
        case 1:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HubsWidget()));
          break;
        case 2:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const SettingsWidget()));
          break;
        default:
      }
    });
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
        actions:  Navi.appBarActions,
        backgroundColor: const Color.fromARGB(255, 56, 56, 56),
      ),

      body: Column(
        children: [
          Container(height: 10, color: const Color.fromARGB(255, 187, 187, 187)),
          Container(height: 10, color: Colors.white),
          const Expanded(
            child: HubsList()
          )
        ]
      ),

      bottomNavigationBar: BottomNavigationBar(
          items: Navi.naviList,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          onTap: onItemTapped,
          backgroundColor: const Color.fromARGB(255, 56, 56, 56),
        ),
    );
  }
}