import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hub_it_app/settings.dart';
import 'package:hub_it_app/main.dart';


class HubsWidget extends StatefulWidget {
  const HubsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HubsWidgetState();
}

class _HubsWidgetState extends State<HubsWidget> {
  // Index of different screens
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => homeWidget()));
            break;
        case 1:
          break;
        case 2:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SettingsWidget()));
          break;
        default:
      }
    });
  }


  final _color2 = const Color.fromARGB(255, 204, 77, 77);
  final _color1 = const Color.fromARGB(255, 112, 239, 222);
  

  Widget _hubsBodyList() {
    destroyHubsList();
    buildHubsList();
    return Container(
      alignment: Alignment.center,
      width : double.infinity,
      height: 500,
      child : Container (
        width : 358,
        height : 457,
        margin: const EdgeInsets.all(10.0),
        color: const Color.fromARGB(255, 165, 165, 165),
        child : ListView.separated(
          shrinkWrap: true,
          itemCount: _hubs.length + 1,
          separatorBuilder:  (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: index == 0 ? null : const Icon(Icons.accessibility_sharp),
              title : index == 0 ? const Text("My Hubs", style : TextStyle(fontSize : 25)) :Text(_hubs[index - 1].title),
              trailing :index == 0 ? null : Container (
                width : 75,
                height :32,
                decoration: BoxDecoration( 
                  color: _hubs[index - 1].isFollow ? _color2 : _color1,
                  borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                child : IconButton(
                  icon: _hubs[index - 1].isFollow ? const Text('Unfollow', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      letterSpacing: 0.25,
                      fontWeight: FontWeight.normal,
                      )
                    ) : const Text('Follow', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      letterSpacing: 0.25,
                      fontWeight: FontWeight.normal,
                      )
                    ),
                  onPressed: () {
                    setState(() {
                      _hubs[index-1].isFollow = !_hubs[index-1].isFollow;
                    });
                  },
                ),
              )
            );
          }, 
        ),
      ),
    );
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hubs Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context, 
                delegate: MySearchDelegate()
              );
            }, 
          )
        ],
      ),
      body : _hubsBodyList(),
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
      )
    );
  }
}

class MySearchDelegate extends SearchDelegate { 

  List <String> suggestions = [
      'Photography',
      'Cinema', 
      'Coding',
      'Cycling',
      'Reading',
      'Trekking',
      'MyHub',
      'German Class', 
      'Gym Freaks' 
    ];
 
  Widget _hubsSearchPage() {
    int hubIdx = _hubs.indexWhere((value) => value.title == query) ; 
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(15.0),
      children: <Widget> [
        Container(
            alignment: Alignment.center,
            child: Container (
                alignment: Alignment.bottomLeft,
                width : 358,
                height : 169,
                margin: const EdgeInsets.all(10.0),
                child: !suggestions.contains(query) ? const Text("Hub not exists") : Text(query),
                decoration: BoxDecoration (
                  image: DecorationImage(
                    image: NetworkImage("assets/$query.jpg"),
                     fit: BoxFit.cover,
                    ),
                  ),
              ),
            ),
        Container(
          alignment: Alignment.center,
          child : hubIdx != - 1 ? Container (
            width: 358,
            color : const Color.fromARGB(255, 165, 165, 165),
            child : ListView(
                shrinkWrap: true,
                children: <Widget> [
                  const ListTile(
                    leading: Icon(Icons.favorite, color:  Color.fromARGB(255, 112, 239, 222)),
                    title: Text("Top Hub's Hub.iter "),
                    subtitle: Text("Some User"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.favorite, color:  Color.fromARGB(255, 112, 239, 222)),
                    title: Text("Top Hub's Habbit "),
                    subtitle: Text("Some habbit"),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _hubs[hubIdx].habbits.length + 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: index == 0 ? const Icon(Icons.star_border_outlined, color:  Color.fromARGB(255, 112, 239, 222)) : const Icon(null),
                        title: index == 0 ? 
                          Text(_hubs[hubIdx].title) 
                          :Text(_hubs[hubIdx].habbits[index-1], 
                                style: const TextStyle(fontSize: 13),
                                ),
                        subtitle: null,
                      );
                    }
                  ),
                ],
              ),
          ) : null,
      ),
      ]);
  }

  @override
  final searchFieldLabel = "find hubs!";

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null),
  ); 

  @override 
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      onPressed: () {
        query = '';
      }, 
      icon: const Icon(Icons.clear),
    )
  ];

  @override 
  Widget buildResults(BuildContext context) => _hubsSearchPage();

  @override 
  Widget buildSuggestions(BuildContext context) {
    var listToShow; 
    if (query.isNotEmpty) {
      listToShow = suggestions.where((e) => e.contains(query) && e.startsWith(query)).toList();
    }
    else {
      listToShow = suggestions;
    }
    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (context, index) {
        var resSuggestion = listToShow[index];
        return ListTile(
          title: Text(resSuggestion),
          onTap: () {
            query = resSuggestion;
            showResults(context);
          },
          trailing : IconButton (
            icon:const Icon(Icons.add),
            onPressed: () {
              query = resSuggestion;
              showResults(context);
            },
          ),
        );
      }
    );
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
  bool isFollow = true;

  Hub({required this.title, required this.habbits, required this.enabled});
}
