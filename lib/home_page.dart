import 'package:flutter/material.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller= TextEditingController();
  List todoList=[
    ["To do list item 1", false],
    ["To do list item 2", true],
    ["To do list item 3", false],
    ["To do list item 4", false],
    ["To do list item 5", false],
    ["To do list item 6", false],
    ["To do list item 7", false],
    ["To do list item 8", false],
    ["To do list item 9", false],
    ["To do list item 10", false],
  ];

  void checkedBoxChecked(bool value, int index){
    setState(() {
      todoList[index][1]= !todoList[index][1];
    });
  }

  // save new task
  void saveNewTask(){
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // delete task
  void deleteTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }

  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    });
  }

  final controller= ScrollController();
  final double itemSize= 120;

  void onListenerController(){
    setState(() {

    });
  }
  @override
  void initState() {
    controller.addListener(onListenerController);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(onListenerController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('TO DO',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[400],
      ),
      body: Stack(

        children: [ ListView.builder(
          itemCount: todoList.length,
          controller: controller,
          itemBuilder: (context,index){
            final itemOffset= index * itemSize;
            final difference= controller.offset - itemOffset;
            final percent = 1- (difference/(itemSize/2));
            double scale=percent;
            double opacity= percent;
            if(opacity > 1.0) opacity=1.0;
            if(opacity < 0.0 ) opacity=0.0;
            if(scale>1.0) scale=1.0;
            return Opacity(
              opacity: opacity,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..scale(scale,1.0),
                child: ToDoTile(
                        taskName: todoList[index][0],
                        taskCompleted: todoList[index][1],
                        onChanged: (value) => checkedBoxChecked(value!, index),
                      deleteFunction: (context) => deleteTask(index),
                ),
              ),
            );
          },
        ),
      ]
      ),
    );
  }
}
