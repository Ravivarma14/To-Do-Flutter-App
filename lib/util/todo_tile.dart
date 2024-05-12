import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile  extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile ({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 25,right: 25, top: 12, bottom: 12),
      child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                SlidableAction(onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
              ],
            ),
            child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Checkbox(
                        value: taskCompleted,
                        onChanged: onChanged,
                      activeColor: Colors.blue,
                      side: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  const SizedBox(width: 10),
                  Text(
                      taskName,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      //fontWeight: FontWeight.bold,
                      decoration: taskCompleted==true ? TextDecoration.lineThrough : TextDecoration.none ,
                    ),
                  ),
                  ],
                ),
              ),
          ),
    );
  }
}
