// ignore_for_file: file_names
import "package:flutter/material.dart";
import "package:hub_it_app/assets/hubsList.dart";

import '../screens/homeScreen.dart';
List<List<String>> hubsHabits=[["Landscapes", "Portrait", "Videos", "Photoshop"],
["Algorithms", "Data", "Work", "Study structures"],["Books", "Notes","Testing","Pritning"], ["Training", "Rest","Mealprep", "Test"]];
List<Widget> theBestGenerator (int tasks, bool myhub, int currentHub){
  return <Widget>[
      ListView.builder(
        physics: const ScrollPhysics(),
        itemCount: tasks,
        shrinkWrap: true,
        itemBuilder: ((context, index)  {
          if(index==0){ //add A Whole divider line! (only one)
            return const Divider(height: 5, color: Color.fromARGB(255, 0, 0, 0));
          }else if((index%2)==0){//add a divider between each tile!
            if(index==tasks-1){ //if it is the last iteration, dont add divider
              return const SizedBox.shrink();
            }else{
              return const Divider(indent: 60, height: 5, color: Color.fromARGB(255, 3, 7, 20));
            }
          }else if((index%2)==1){ //add tile
              return  HubTask(habitTitle: Text(hubsHabits[currentHub][index~/2]), addTask: false,ind: index);
          }else{
            return const SizedBox.shrink();
          }
        })
      ),
      myhub? const Divider(indent: 60, height: 5, color: Color.fromARGB(255, 3, 7, 20)): const SizedBox.shrink(),
      myhub? const HubTask(habitTitle: Text("Add a task", style: TextStyle(fontStyle: FontStyle.italic)), addTask: true): const SizedBox.shrink(),];
  }

TextEditingController mycontroller = TextEditingController();
class HubTask extends StatefulWidget {
  
  final Text habitTitle;
  final bool addTask;
  final bool mytask;
  final int ind;
  const HubTask({Key? key,required this.habitTitle, required this.addTask, this.ind=0, this.mytask=false}) : super(key: key);

  @override
  State<HubTask> createState() => _HubTask();
}
  bool finished=false;

class _HubTask extends State<HubTask> {
  
  final myController = TextEditingController();
  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () =>{
          if(widget.ind%2!=0 && widget.mytask){
            showDialog<String>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('This Task will be deleted!'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('No, keep it!'),
                      onPressed: () {
                        setState(() {
                          myController.clear();
                          Navigator.pop(context);
                        });
                      },
                    ),
                    TextButton(
                      child: const Text("Discard it!"),
                      onPressed: () {
                        setState(() {
                             myHabitsList[widget.ind]=const SizedBox.shrink();
                              myHabitsList[widget.ind+1]=const SizedBox.shrink();
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HubitHomeScreen()));
                        });
                      },
                    ),
                  ],
                );
              },
            ),
          }
        },
      contentPadding: const EdgeInsets.symmetric(horizontal: 60.0),//create inset
      title: widget.habitTitle, 
      trailing: IconButton(
        color: const Color(0xff07dbca),
        icon: widget.addTask?
          const Icon(Icons.add_circle):
          isPressed? 
            const Icon(Icons.radio_button_checked): 
            const Icon(Icons.radio_button_unchecked),
        tooltip: 'Mark as Done',
        onPressed: () {//mark here variables for other pages
          if(widget.addTask){
            showDialog<String>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add a task!'),
                  content: TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Today I will ...',
                    ),
                    controller: myController,
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('CANCEL'),
                      onPressed: () {
                        setState(() {
                          myController.clear();
                          Navigator.pop(context);
                        });
                      },
                    ),
                    TextButton(
                      child: const Text("OK"),
                      onPressed: () {
                        setState(() {
                            myHabitsList.last=const SizedBox.shrink();
                            myHabitsList.add(HubTask(habitTitle: Text(myController.text), addTask: false, ind:myHabitsList.length-1));
                            myHabitsList.add(const Divider(indent: 60, height: 5, color: Color.fromARGB(255, 3, 7, 20)));
                            myHabitsList.add(const HubTask(habitTitle: Text("Add a task", style: TextStyle(fontStyle: FontStyle.italic)), addTask: true));
                            myController.clear();
                            finished=true;
                            
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HubitHomeScreen()));
                        });
                      },
                    ),
                  ],
                );
              },
            );
          }
          setState(() {
            isPressed=!isPressed;
            
          });
        },
      ),
    );
  }
}