
import 'package:hub_it_app/hubs.dart';
import 'package:hub_it_app/settings.dart';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

class Hubit extends StatelessWidget {
  const Hubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Hub.it!',
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
          primaryTextTheme:
              const TextTheme(headline6: TextStyle(color: Colors.white))),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeWidget();
}

class _HomeWidget extends State<HomeWidget> {
// Index of different screens
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
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

  bool isChecked = false;
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
    destroyHubsList();
    buildHubsList();
  }

  void deleteHubs(int idx) async {
    bool? _delHubs = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: const Text("Delete Hub ?"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Yes'))
              ],
            ));
    if (_delHubs!) {
      _hubs.removeAt(idx);
      setState(() {});
    }
  }

  // List View Widget
  Widget _buildTaskList() {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: _hubs.length,
        itemBuilder: (context, index) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: _hubs[index].habbits.length + 1,
            itemBuilder: (context, idx) {
              return ListTile(
                  title: idx == 0
                      ? Text(_hubs[index].title, style: const TextStyle(fontSize: 18))
                      : Text(_hubs[index].habbits[idx - 1]),
                  leading: idx == 0
                      ? Switch(
                          value: _hubs[index].enabled,
                          onChanged: (bool value) {
                            setState(() {
                              _hubs[index].enabled = value;
                            });
                          },
                          activeColor: const Color.fromARGB(250, 0, 196, 180),
                        )
                      : Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                  trailing: idx == 0
                      ? IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => deleteHubs(index),
                          highlightColor: Colors.red,
                        )
                      : null);
            },
          );
        });
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
          title: Text(DateFormat('dd/MM/yyyy').format(selectedDate),
              style: const TextStyle(color: Colors.white)),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text("User"),
              style: TextButton.styleFrom(
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                color: Colors.white),
          ],
          backgroundColor: const Color.fromARGB(255, 56, 56, 56),
        ),
        body: _buildTaskList(),
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
          backgroundColor: const Color.fromARGB(255, 56, 56, 56),
        ));
  }
}

// Create some dummy data
// Hubs data struct : Obj Hubs [String title,List <String> habbits]
final _hubs = <Hub>[];
final hub0 =
    Hub(title: "MyHub", enabled: true, habbits: ["Work", "Study", "Cook"]);
final hub1 = Hub(
    title: "German Class",
    enabled: true,
    habbits: ["Studying", "Listening", "Videos"]);
final hub2 = Hub(
    title: "Gym Freaks",
    enabled: true,
    habbits: ["Workout", "Pre Meal", "After meal"]);
void buildHubsList() {
  _hubs.add(hub0);
  _hubs.add(hub1);
  _hubs.add(hub2);
}

void destroyHubsList() {
  _hubs.clear();
}

class Hub {
  String title;
  List<String> habbits;
  bool enabled;

  Hub({required this.title, required this.habbits, required this.enabled});
}
