// ignore_for_file: file_names
import "package:flutter/material.dart";
import 'package:hub_it_app/assets/hubsList.dart';
import 'package:hub_it_app/screens/hubsScreen.dart';
import 'package:hub_it_app/screens/settingsScreen.dart';

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
        actions:  <Widget>[
          Row(children: <Widget> [
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )
                ),  
              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 153, 153, 153)),
            ), 
            
              onPressed: () {},
              child: Row(
                children: const <Widget>[
                  Text('User', style: TextStyle(fontSize: 20, color: Colors.white),), // <-- Text
                  SizedBox(
                    width: 12,
                  ),
                  ImageIcon(AssetImage('assets/images/user.png'), color: Colors.white, size: 25),
                ],
              ),
            ),
            const SizedBox(width: 12),
          ]
          ),
        ],
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
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Hubs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          onTap: onItemTapped,
          backgroundColor: const Color.fromARGB(255, 56, 56, 56),
        ),
    );
  }
}