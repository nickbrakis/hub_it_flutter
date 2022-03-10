import 'dart:js';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(HubIt());

class HubIt extends StatelessWidget {
  const HubIt({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hub.it Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
        primaryTextTheme:const TextTheme(
          headline6: TextStyle(
            color: Colors.white
          )
        )
      ),
      home:const homeWidget (),
    );
  }
}

class homeWidget  extends StatefulWidget{
  const homeWidget ({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _homeWidget ();
}

class _homeWidget  extends State<homeWidget >{
// Index of different screens
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
//  For calendar
DateTime selectedDate = DateTime.now();
Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
  if (picked != null && picked != selectedDate) {
    setState(() {
      selectedDate = picked;
    });
  }
}
final _hubs = <Hub>[];
bool _hub_state = false;

final hub1 = Hub(title: "german class");


// List View Widget
Widget _buildTaskList() {
  return ListView.separated( 
    padding: const EdgeInsets.all(16.0),
    separatorBuilder: (context, index) => const Divider(), 
    itemCount: 1,
    itemBuilder: (context, index) {
      return SwitchListTile(
        title: const Text("Hub name"),
        value: _hub_state,
        onChanged: (bool value) {
          setState(() {
            _hub_state = value;
          });
        },
        secondary: IconButton(
          icon: const Icon(Icons.arrow_drop_down),
          onPressed: () {},
        ),  
        controlAffinity: 
          ListTileControlAffinity.leading, 
      );
    },
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: () => _selectDate(context),
              color: Colors.white,
            ),
        title : Text(
          DateFormat('dd/MM/yyyy').format(selectedDate), 
          style: const TextStyle(
            color: Colors.white
          )
        ),
        actions: <Widget>[
          TextButton(
            onPressed: (){}, 
            child: const Text("User"),
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.person),
            color: Colors.white
            ),
        ],
        backgroundColor: Color.fromARGB(255, 56, 56, 56),
      ),
      body : _buildTaskList(),
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
        onTap: _onItemTapped,
        backgroundColor: Color.fromARGB(255, 56, 56, 56),
      )
    );
  }
}

class Hub {
  String title;
  List<String> ? habbits;

  Hub({required this.title, this.habbits});

}