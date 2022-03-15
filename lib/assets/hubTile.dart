
import 'package:flutter/material.dart';

class HubTile extends StatefulWidget{
  final String hubTitle;
  final bool myHub;
  const HubTile({Key? key, required this.hubTitle, required this.myHub}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HubTile();
}

class _HubTile extends State<HubTile>{
  bool isSwitched=false;
  bool _customTileExpanded=false;
  
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
          title: 
            Text(widget.hubTitle, overflow: TextOverflow.ellipsis, maxLines: 1,),
          trailing: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (!widget.myHub) Switch(
                    activeColor: const Color(0xff565656),
                    activeTrackColor: const Color(0xff07dbca),
                    inactiveThumbColor: const Color(0xff07dbca),
                    inactiveTrackColor: const Color(0xff565656),
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
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
          children: const <Widget>[
            ListTile(title: Text('This is tile number 1')),
            ],
          );
  }
}

List<HubTile> generateItems(int numberOfItems) {
  final List<String> _names=["NTUA Photography Club", "Prometheus Racing", 
  "NTUA Billiards' Club", "IEEE NTUA Branch", "White Noise", "Snorkeling Athens", "Rock Climbing",
  "Horse Riding", "Cooking Mastercourse"];
  return List<HubTile>.generate(numberOfItems, (int index) {
    if(index!=0){
      return HubTile(
        hubTitle: _names[index%_names.length],
        myHub: false,
      );
    } else{
      return const HubTile(
        hubTitle: 'My Habbits',
        myHub: true,
      );
    }
  });
}