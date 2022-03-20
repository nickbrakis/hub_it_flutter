// ignore: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navi{
  static final naviList=<BottomNavigationBarItem> [
            BottomNavigationBarItem(
              activeIcon: Expanded(child: Stack(
                alignment: Alignment.center,
                children: const <Widget>[
                Icon(Icons.home, size: 18),
                FaIcon(FontAwesomeIcons.circle)
              ],),),
              icon: const Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: Expanded(child: Stack(
                alignment: Alignment.center,
                children: const <Widget>[
                Icon(Icons.people, size: 18),
                FaIcon(FontAwesomeIcons.circle)
              ],),),
              icon: const Icon(Icons.people),
              label: "Hubs",
            ),
            BottomNavigationBarItem(
              activeIcon: Expanded(child: Stack(
                alignment: Alignment.center,
                children: const <Widget>[
                Icon(Icons.settings, size: 18),
                FaIcon(FontAwesomeIcons.circle)
              ],),),
              icon: const Icon(Icons.settings),
              label: "Settings",
            ),
          ];
          
  static final appBarActions = <Widget>[
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
        ];

  static appBarLeading (bool intend, bool dark) {
    const Color light=Color.fromARGB(255, 241, 241, 241);
    return Row(
    children: <Widget> [
            intend? const SizedBox(width: 12): const SizedBox.shrink(),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )
                ),  
              backgroundColor: MaterialStateProperty.all<Color>(dark? const Color.fromARGB(255, 153, 153, 153): light),
            ), 
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Text('User', style: TextStyle(fontSize: 20, color: dark? Colors.white: Colors.black),), // <-- Text
                  const SizedBox(width: 12),
                  ImageIcon(const AssetImage('assets/images/user.png'), color: dark? Colors.white: Colors.black, size: 25),
                ],
              ),
            ),
          ]
        );
  }
  
  
}