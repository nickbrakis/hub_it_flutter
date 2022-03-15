import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
// import 'package:play/task.dart';

void main() => runApp(Hubit());

class Hubit extends StatelessWidget {
  const Hubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Hub.it!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    home: HubitScreenWidget(),
    );
  }
}

class HubitScreenWidget extends StatefulWidget{
  const HubitScreenWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HubitScreenWidget();
}

class _HubitScreenWidget extends State<HubitScreenWidget>{ //actually starting here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hub.it!'),
        // actions: [
        //   IconButton(
        //     onPressed: (){},
        //     icon: Image.asset('assets/images/network.png'),
        //     tooltip: 'Car Mode',
        //     ),
        //     IconButton(
        //     onPressed: (){},
        //     icon: const Icon(Icons.exposure_minus_1),
        //     tooltip: 'Car Mode',
        //     ),
        // ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_drop_down_sharp),
          onPressed: (){},
          tooltip: 'Calendar',
        ),
      ),
      // body: HubList(),
      body: const MyStatefulWidget(),
      bottomNavigationBar: BottomAppBar(
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


class HubList extends StatelessWidget{
  const HubList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hub();
  }
}

class Hub extends StatelessWidget{
  const Hub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: 
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text("Photography Ntua"),
            
            Icon(Icons.playlist_add),
          ],
        ),
      collapsed: Text('la'),
      expanded: Text('hihi'),
      // tapHeaderToExpand: true,
      // hasIcon: true,
    );
  }

}
//======================
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Hub $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<Item> _data = generateItems(8);
  bool _customTileExpanded = false;
  final isSwitched = List<bool>.filled(12,false);
  int count=1;


  @override
  Widget build(BuildContext context) {

  return ListView(
    padding: const EdgeInsets.all(8),
    children: <Widget>[
      ExpansionTile(
          title: 
            const Text('My Habbits', overflow: TextOverflow.ellipsis, maxLines: 1,),
          trailing: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ImageIcon(
                  _customTileExpanded
                  // ignore: prefer_const_constructors
                  ? AssetImage('assets/images/upload.png')
                  // ignore: prefer_const_constructors
                  : AssetImage('assets/images/menu.png'),
                  color: Color.fromARGB(255, 7, 219, 202),
                ),
              ],
            ),
         
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
          // subtitle: Text('Trailing expansion arrow icon'),
          children: const <Widget>[
            ListTile(title: Text('This is tile number 1')),
            ],
          ),
      //MAKE CLASSSS==================================
      ExpansionTile(
          title: 
            const Text('NTUA Photography Club', overflow: TextOverflow.ellipsis, maxLines: 1,),
          trailing: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Switch(
                  activeColor: Color(0xff565656),
                  activeTrackColor: Color(0xff07dbca),
                  inactiveThumbColor: Color(0xff07dbca),
                  inactiveTrackColor: Color(0xff565656),
                  value: isSwitched[1],
                  onChanged: (value) {
                    setState(() {
                      // count--;
                      isSwitched[1] = value;
                    });
                  },
                ),
                const SizedBox(width: 120),
                ImageIcon(
                  _customTileExpanded
                  // ignore: prefer_const_constructors
                  ? AssetImage('assets/images/upload.png')
                  // ignore: prefer_const_constructors
                  : AssetImage('assets/images/menu.png'),
                  color: const Color(0xff07dbca),
                ),
              ],
            ),
         
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
          // subtitle: Text('Trailing expansion arrow icon'),
          children: const <Widget>[
            ListTile(title: Text('This is tile number 1')),
            ],
          ),
      //======================make CLASS===========================================
      ExpansionTile(
          title: 
            const Text('NTUA Photography Club', overflow: TextOverflow.ellipsis, maxLines: 1,),
          trailing: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Switch(
                  activeColor: Color(0xff565656),
                  activeTrackColor: Color(0xff07dbca),
                  inactiveThumbColor: Color(0xff07dbca),
                  inactiveTrackColor: Color(0xff565656),
                  
                  value: isSwitched[2],
                  onChanged: (value) {
                    setState(() {
                      isSwitched[2] = value;
                    });
                  },
                ),
                const SizedBox(width: 120),
                ImageIcon(
                  _customTileExpanded
                  // ignore: prefer_const_constructors
                  ? AssetImage('assets/images/upload.png')
                  // ignore: prefer_const_constructors
                  : AssetImage('assets/images/menu.png'),
                  color: const Color(0xff07dbca),
                ),
              ],
            ),
         
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
          // subtitle: Text('Trailing expansion arrow icon'),
          children: const <Widget>[
            ListTile(title: Text('This is tile number 1')),
            ],
          ),
          ExpansionTile(
          title: 
            const Text('NTUA Photography Club', overflow: TextOverflow.ellipsis, maxLines: 1,),
          trailing: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Switch(
                  activeColor: Color(0xff565656),
                  activeTrackColor: Color(0xff07dbca),
                  inactiveThumbColor: Color(0xff07dbca),
                  inactiveTrackColor: Color(0xff565656),
                  value: isSwitched[3],
                  onChanged: (value) {
                    setState(() {
                      isSwitched[3] = value;
                    });
                  },
                ),
                const SizedBox(width: 120),
                ImageIcon(
                  _customTileExpanded
                  // ignore: prefer_const_constructors
                  ? AssetImage('assets/images/upload.png')
                  // ignore: prefer_const_constructors
                  : AssetImage('assets/images/menu.png'),
                  color: const Color(0xff07dbca),
                ),
              ],
            ),
         
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
          // subtitle: Text('Trailing expansion arrow icon'),
          children: const <Widget>[
            ListTile(title: Text('This is tile number 1')),
            ],
          ),ExpansionTile(
          title: 
            const Text('NTUA Photography Club', overflow: TextOverflow.ellipsis, maxLines: 1,),
          trailing: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Switch(
                  activeColor: Color(0xff565656),
                  activeTrackColor: Color(0xff07dbca),
                  inactiveThumbColor: Color(0xff07dbca),
                  inactiveTrackColor: Color(0xff565656),
                  value: isSwitched[4],
                  onChanged: (value) {
                    setState(() {
                      isSwitched[4] = value;
                    });
                  },
                ),
                const SizedBox(width: 120),
                ImageIcon(
                  _customTileExpanded
                  // ignore: prefer_const_constructors
                  ? AssetImage('assets/images/upload.png')
                  // ignore: prefer_const_constructors
                  : AssetImage('assets/images/menu.png'),
                  color: const Color(0xff07dbca),
                ),
              ],
            ),
         
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
          // subtitle: Text('Trailing expansion arrow icon'),
          children: const <Widget>[
            ListTile(title: Text('This is tile number 1')),
            ],
          ),ExpansionTile(
          title: 
            const Text('NTUA Photography Club', overflow: TextOverflow.ellipsis, maxLines: 1,),
          trailing: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Switch(
                  activeColor: Color(0xff565656),
                  activeTrackColor: Color(0xff07dbca),
                  inactiveThumbColor: Color(0xff07dbca),
                  inactiveTrackColor: Color(0xff565656),
                  value: isSwitched[5],
                  onChanged: (value) {
                    setState(() {
                      isSwitched[5] = value;
                    });
                  },
                ),
                const SizedBox(width: 120),
                ImageIcon(
                  _customTileExpanded
                  // ignore: prefer_const_constructors
                  ? AssetImage('assets/images/upload.png')
                  // ignore: prefer_const_constructors
                  : AssetImage('assets/images/menu.png'),
                  color: const Color(0xff07dbca),
                ),
              ],
            ),
         
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
          // subtitle: Text('Trailing expansion arrow icon'),
          children: const <Widget>[
            ListTile(title: Text('This is tile number 1')),
            ],
          ),
    ],
  );
  }
}