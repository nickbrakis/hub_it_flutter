import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
// import 'package:play/task.dart';
import 'assets/hubTile.dart';

void main() => runApp(const Hubit());

class Hubit extends StatelessWidget {
  const Hubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Hub.it!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    home: const HubitScreenWidget(),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_drop_down_sharp),
          onPressed: (){},
          tooltip: 'Calendar',
        ),
      ),
      body: const HubsList(),
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

class HubsList extends StatefulWidget {
  const HubsList({Key? key}) : super(key: key);

  @override
  State<HubsList> createState() => _HubsList();
}

class _HubsList extends State<HubsList> {
  final List<Widget> _data = generateItems(20);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children:  _data
    );
  }
}