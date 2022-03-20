import 'package:flutter/material.dart';
import 'package:hub_it_app/screens/hubsScreen.dart';
import 'package:hub_it_app/screens/homeScreen.dart';
import 'package:hub_it_app/assets/naviBar.dart';

// import 'package:hub_it_app/main.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsWidgetState();
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
  Widget _SettingsBody() {
    return Center(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container( 
              child: Column(//COLUMN 1
                children: [
                  Navi.appBarLeading(false, false),
                  const Text("someemail@mail.com", style: TextStyle(color: Color.fromARGB(255, 100, 100, 100))),
                  const Text("Password:*********", style: TextStyle(color: Color.fromARGB(255, 100, 100, 100)))
                ],
              ),
              margin: const EdgeInsets.all(15),
            ),
            const Padding(padding: EdgeInsets.all(20.0)),
            Padding(
              padding: const EdgeInsets.only(bottom: 33),
              child: signOut(),
            ),
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
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(child : Text(_ownedhubs[index].title)),
                      width : 150,
                      height : 30,
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

  Widget signOut () {
    const Color light=Color.fromARGB(255, 241, 241, 241);
    bool hovered=false;
    return Row(
    children: <Widget> [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hovered=!hovered;
                });
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )
                ),  
              backgroundColor: hovered? MaterialStateProperty.all<Color>(Colors.black): MaterialStateProperty.all<Color>(light),
            ), 
              child: Row(
                children: const <Widget>[
                  Text("Sign Out", style: TextStyle(fontSize: 20, color:Color.fromARGB(255, 51, 51, 51)),), // <-- Text
                  SizedBox(width: 6),
                  Icon(Icons.logout, color:Color.fromARGB(255, 51, 51, 51), size: 22),
                ],
              ),
            ),
          ]
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Settings", style: TextStyle(color: Colors.white)),
            backgroundColor: const Color.fromARGB(255, 56, 56, 56),
            leading :const Icon(Icons.settings, color: Colors.white,),
        ),
        backgroundColor: const Color.fromARGB(255, 150, 150, 150),
        body: _SettingsBody(),
        bottomNavigationBar: BottomNavigationBar(
          items:  Navi.naviList,
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