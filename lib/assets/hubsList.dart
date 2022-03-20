// ignore_for_file: file_names
import "package:flutter/material.dart";
import 'package:hub_it_app/assets/habitsList.dart';

class Variables{
  static List<bool> gray = List.filled(100,false); //holds the gray state of hubs
  static final List<Widget> data = generateHubs(5); //creates hubs
}

class HubsList extends StatefulWidget {
  const HubsList({Key? key}) : super(key: key);

  @override
  State<HubsList> createState() => _HubsList();
}

class _HubsList extends State<HubsList> {
  @override
  Widget build(BuildContext context) {
    
    return  ReorderableListView.builder( //build the HUBS to be reordable!! => the hubs are in Variables.data
            itemCount: Variables.data.length,
            itemBuilder: (context, index) => Variables.data[index],
            padding: const EdgeInsets.symmetric(horizontal: 15.0),//create inset
            onReorder: (oldIndex, newIndex) =>
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex = newIndex - 1;
                }
                final element = Variables.data.removeAt(oldIndex);
                Variables.data.insert(newIndex, element);
              }),
          );
  }
}

List<Widget> generateHubs(int numberOfItems) {
  final List<String> hubNames=[ "Prometheus Racing", 
          "NTUA Billiard's Club","NTUA Photography Club", "IEEE NTUA Branch", "White Noise", "Snorkeling Athens", "Rock Climbing",
          "Horse Riding", "Cooking Mastercourse"];

  return List<Widget>.generate(2*numberOfItems, (int index) {
    if(index==0){
      return Divider(key: ValueKey(index.toString()),height: 5, color: Colors.white); // adds a little space 
    }else if(index==1){
      return HubTile(hubTitle: 'My Habbits', myHub: true, key: ValueKey(index.toString()), i:index);    
    }else if((index%2)==0){
      return Divider(key: ValueKey(index.toString()),height: 5, color: Colors.white);
    }else if((index%2)==1){
      return HubTile(hubTitle: hubNames[(index~/2+1)%hubNames.length], myHub: false, key: ValueKey(index.toString()), i:index);
    }else{
      return Divider(key: ValueKey(index.toString()),height: 15, color: Colors.white);
    }      
  });
}

final myHabitsList =  <Widget>[
                  const Divider(height: 5, color: Color.fromARGB(255, 0, 0, 0)),
                  const HubTask(habitTitle: Text("Cycling"), addTask: false,ind: 1, mytask: true,),
                  const Divider(indent: 60, height: 5, color: Color.fromARGB(255, 3, 7, 20)),
                  const HubTask(habitTitle: Text("Walk the dog"), addTask: false,ind: 3,mytask: true,),
                  const Divider(indent: 60, height: 5, color: Color.fromARGB(255, 3, 7, 20)),
                  const HubTask(habitTitle: Text("Do homework"), addTask: false,ind: 5,mytask: true,),
                  const Divider(indent: 60, height: 5, color: Color.fromARGB(255, 3, 7, 20)),
                  const HubTask(habitTitle: Text("Add a task", style: TextStyle(fontStyle: FontStyle.italic)), addTask: true)
                ];

class HubTile extends StatefulWidget{ //the complete Hub (contains in another function the expanded habbits
  final String hubTitle;
  final bool myHub;
  final int i;

  const HubTile({Key? key, required this.hubTitle, required this.myHub, required this.i}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HubTile();
}

class _HubTile extends State<HubTile>{
  bool isSwitched=true;
  bool isExpanded=false;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(//tile becomes gray on switch Ican have up to 100 hubs-> each hub has an ondex i
        color: Variables.gray[widget.i]? Colors.grey :Colors.white, 
        boxShadow: const [BoxShadow(blurRadius: 0.5)]
      ),
      child:
        ExpansionTile( //a hub expands to reveal tasks
          collapsedTextColor: Colors.black,
          textColor: Colors.black,
          title: Text(widget.hubTitle, overflow: TextOverflow.ellipsis, maxLines: 2,),

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
                    onChanged: (bool? newvalue) {
                      setState(() {
                        isSwitched = !isSwitched;
                        isExpanded=false; //cannot expand
                        Variables.gray[widget.i]=!Variables.gray[widget.i]; //will need to make it gray and non expandale   
                      });
                    },  
                  ),
                const SizedBox(width: 120), //adds spacer
                ImageIcon(
                  Variables.gray[widget.i]? const AssetImage('assets/images/menu.png'):
                  (isExpanded? const AssetImage('assets/images/upload.png'): const AssetImage('assets/images/menu.png')),
                  color: const Color(0xff07dbca),
                ),
              ],
            ),
          
          onExpansionChanged: (expanded) {
            setState(() {
              isExpanded = expanded;
              });
          },
          
          children:  
            Variables.gray[widget.i]
              ?<Widget>[const SizedBox.shrink()]
              :(widget.i==1)
                ?myHabitsList
                :theBestGenerator(7, false, widget.i~/2-1), //create the task list
        ),
    );
  }
} 