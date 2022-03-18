// ignore_for_file: file_names
import "package:flutter/material.dart";

class Variables{
  static List<bool> gray = List.filled(100,false);
  static int dividing=0;
  static final List<Widget> data = generateItems(8);

}
class HubsList extends StatefulWidget {
  const HubsList({Key? key}) : super(key: key);

  @override
  State<HubsList> createState() => _HubsList();
}

class _HubsList extends State<HubsList> {
  @override
  Widget build(BuildContext context) {
    return 
      ReorderableListView.builder(
        itemCount: Variables.data.length,
        itemBuilder: (context, index) => Variables.data[index],
        // if(true){},
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

class HubTile extends StatefulWidget{
  final String hubTitle;
  final bool myHub;
  final int i;

  const HubTile({Key? key, required this.hubTitle, required this.myHub, required this.i}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HubTile();
}

class _HubTile extends State<HubTile>{
  bool isSwitched=true;
  bool _customTileExpanded=false;
  
  @override
  Widget build(BuildContext context) {
    
    return 
      Container(
        decoration: 
          BoxDecoration(
            color: Variables.gray[widget.i]? const Color(0x01000000) :Colors.white, 
            border:  Border.all(
              width: 0.4, 
              color: Colors.grey
            ),
            boxShadow: const [BoxShadow(
              color: Colors.grey ,
              blurRadius: 1.2,
              offset: Offset(2.0,2.0)
            )]
          ),
        child:
          ExpansionTile(
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
                          isSwitched = newvalue!;
                          Variables.gray[widget.i]=!Variables.gray[widget.i];
                          _customTileExpanded=false;
                        });
                      },  
                    ),
                  const SizedBox(width: 120),
                  ImageIcon(
                    Variables.gray[widget.i]? const AssetImage('assets/images/menu.png'):
                    (_customTileExpanded? const AssetImage('assets/images/upload.png'): const AssetImage('assets/images/menu.png')),
                    color: const Color(0xff07dbca),
                  ),
                ],
              ),
            
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
                });
            },
            
            children:  
              Variables.gray[widget.i]
                ?<Widget>[const SizedBox.shrink()]
                :(widget.i==1)? generateMyHabits(7): generateHabits(10),
          ),
      );
  }
}

List<Widget> generateItems(int numberOfItems) {
  
  final List<String> _names=["NTUA Photography Club", "Prometheus Racing", 
          "NTUA Billiards' Club", "IEEE NTUA Branch", "White Noise", "Snorkeling Athens", "Rock Climbing",
          "Horse Riding", "Cooking Mastercourse"];
  final List<String> _products =
          List.generate(2*numberOfItems, (index) => "Product ${index.toString()}");
  
  return List<Widget>.generate(2*numberOfItems, (int index) {
    if(index==0){
      return Divider(key: ValueKey(index.toString()),height: 5, color: Colors.white);
    }else if(index==1){
      return HubTile(
        hubTitle: 'My Habbits',
        myHub: true,
        key: ValueKey(_products[1]),
        i:index,
      );    
    }else if((index%2)==0){
      return Divider(key: ValueKey(index.toString()),height: 5, color: Colors.white);
    }
    else if((index%2)==1){
      return HubTile(
        hubTitle: _names[(index~/2+1)%_names.length],
        myHub: false,
        key: ValueKey(_products[(index)]),
        i:index,
      );
    }else{return Divider(key: ValueKey(index.toString()),height: 15, color: Colors.white);}      
  });
}

List<Widget> generateHabits(int numberOfItems) {
  return List<Widget>.generate(numberOfItems, (int index) {
   if(index==1){
    return const Divider(height: 0.5, thickness: 4, indent: 0, endIndent: 0, color: Colors.grey);
   }else if(index%2==0 && index!=0){
     return ListTile(title: Text('Habbit ${(index~/2).toString()}'));
   }else if(index!=(numberOfItems-1)){
     return const Divider(height: 0.5, thickness: 0.5, indent: 50, endIndent: 0, color: Colors.grey);
   }else{
     return const SizedBox.shrink();
   }
  });
}

List<Widget> generateMyHabits(int numberOfItems) {
  return List<Widget>.generate(numberOfItems, (int index) {
   if(index==1){
    return const Divider(height: 0.5, thickness: 4, indent: 0, endIndent: 0, color: Colors.grey);
   }else if(index%2==0 && index!=0){
     if(numberOfItems-index<=1){
       var textStyle = const TextStyle(fontStyle: FontStyle.italic);
       return ListTile(title: Text('Add a Habit',style: textStyle));
     }else{
        return ListTile(title: Text('Habbit ${(index~/2).toString()}'));
     }
   }else if(index!=(numberOfItems-1)){
     return const Divider(height: 0.5, thickness: 0.5, indent: 50, endIndent: 0, color: Colors.grey);
   }else{
     return const SizedBox.shrink();
   }
  });
}