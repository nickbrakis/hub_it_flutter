// ignore_for_file: file_names
import "package:flutter/material.dart";

class ExpandedTasksList extends StatefulWidget {
  final int tasks;//the number of tasks you want to generate (per hub)
  final bool myhub;
  const ExpandedTasksList({Key? key, required this.tasks, required this.myhub}): super(key: key);

  @override
  State<ExpandedTasksList> createState() => _ExpandedTasksList();
}

class _ExpandedTasksList extends State<ExpandedTasksList> {
  @override
  Widget build(BuildContext context) {
    return 
      ListView.builder(
        physics: const ScrollPhysics(),
        itemCount: widget.tasks,
        shrinkWrap: true,
        itemBuilder: ((context, index)  {
          if(index==0){ //add A Whole divider line! (only one)
            return const Divider(height: 5, color: Color.fromARGB(255, 0, 0, 0));
          }else if((index%2)==0){//add a divider between each tile!
            if(index==widget.tasks-1){ //if it is the last iteration, dont add divider
              return const SizedBox.shrink();
            }else{
              return const Divider(indent: 60, height: 5, color: Color.fromARGB(255, 3, 7, 20));
            }
          }else if((index%2)==1){ //add tile
            if(widget.myhub && widget.tasks-index<=2){ //add final 'My Habbits'  tile
              index=widget.tasks;
              return  const HubTask(habitTitle: Text("Add a task", style: TextStyle(fontStyle: FontStyle.italic)), addTask: true,);
            }else{
              return  HubTask(habitTitle: Text("Task ${(index~/2+1).toString()}"), addTask: false,);
            }
          }else{
            return const SizedBox.shrink();
          }
        })
      );
  }
}

class HubTask extends StatefulWidget {
  final Text habitTitle;
  final bool addTask;
  const HubTask({Key? key,required this.habitTitle, required this.addTask}) : super(key: key);

  @override
  State<HubTask> createState() => _HubTask();
}

class _HubTask extends State<HubTask> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
          setState(() {
            isPressed=!isPressed;
          });
        },
      ),
    );
  }
}