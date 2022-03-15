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
      'Trekking'
    ];
  // created widget to solve enter tap problem which takes as to buildResults
  Widget _showHub() {
    if (!suggestions.contains(query)) {
      query = "Hub not exists";
    }
    return Center(child: Text(query));
  }

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
  Widget buildResults(BuildContext context) => Container(
    child: _showHub(),
    color: const Color.fromARGB(255, 165, 165, 165),
    alignment: Alignment.center,
    height : 169,
    margin: const EdgeInsets.all(10.0),
  );


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
        var res_suggestion = listToShow[index];
        return ListTile(
          title: Text(res_suggestion),
          onTap: () {
            query = res_suggestion;
            showResults(context);
          },
          trailing : IconButton (
            icon:const Icon(Icons.add),
            onPressed: () {
              query = res_suggestion;
              showResults(context);
            },
          ),
        );
      }
    );

  }
}