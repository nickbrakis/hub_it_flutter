import 'package:flutter/material.dart';
import 'package:hub_it_app/screens/hubsScreen.dart';
import 'package:hub_it_app/screens/homeScreen.dart';

// import 'package:hub_it_app/main.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsWidgetState();
}

Widget _SettingsBody() {
  return Center(
    child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 200, 200, 200),
                        border: Border.all(
                          color: const Color.fromARGB(255, 200, 200, 200),
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child:
                              Row(children: const [Text("User", style: TextStyle(fontSize: 20)), Icon(Icons.person)])),
                    ),
                    const IconButton(onPressed: null, icon: Icon(Icons.edit, color: Color(0xff07dbca)))
                  ],
                ),
                const Text("someemail@mail.com", style: TextStyle(color: Color.fromARGB(255, 100, 100, 100))),
                const Text("Password:*********", style: TextStyle(color: Color.fromARGB(255, 100, 100, 100)))
              ],
            ),
            margin: const EdgeInsets.all(15),
          ),
          Container(
            child: Row(children: [
              Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 200, 200, 200),
                    border: Border.all(
                      color: const Color.fromARGB(255, 200, 200, 200),
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: const [
                      TextButton(onPressed: null, child: Text("Sign out", style: TextStyle(fontSize: 20))),
                      Icon(Icons.logout)
                    ],
                  ))
            ]),
            margin: const EdgeInsets.all(15),
          )
        ]),
        const Text("Manage Your Hubs", style: TextStyle(fontSize: 20)),
        const Divider(),
        Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: _ownedhubs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 200, 200, 200),
                      border: Border.all(
                        color: const Color.fromARGB(255, 200, 200, 200),
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(_ownedhubs[index].title),
                  ),
                  trailing: const IconButton(icon: Icon(Icons.edit), onPressed: null),
                );
              }),
          margin: const EdgeInsets.all(15),
        ),
      ],
    ),
  );
}

class _SettingsWidgetState extends State<SettingsWidget> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HubitHomeScreen()));
          break;
        case 1:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HubsWidget()));
          break;
        case 2:
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text("Settings", style: TextStyle(color: Colors.white)),
            backgroundColor: const Color.fromARGB(255, 56, 56, 56)),
        backgroundColor: const Color.fromARGB(255, 150, 150, 150),
        body: _SettingsBody(),
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

//dummy owned hubs
final myownedhub1 = Hub(title: "MyHub", habbits: ["Work", "Study", "Cook"]);
final myownedhub2 = Hub(title: "MyHub2", habbits: ["Read a Book", "Go for a Walk", "Meditate"]);

var _ownedhubs = <Hub>[myownedhub1, myownedhub2];