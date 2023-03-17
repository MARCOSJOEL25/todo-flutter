import 'package:app/const/Colors.dart';
import 'package:app/models/todo.dart';
import 'package:flutter/material.dart';

class card_todo extends StatelessWidget {
  final todo todoitem;
  final changedTodo;
  final deletedTodo;

  const card_todo(
      {super.key,
      required this.todoitem,
      required this.changedTodo,
      required this.deletedTodo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          changedTodo(todoitem);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          todoitem.isDone
              ? Icons.check_box
              : Icons.check_box_outline_blank_outlined,
          color: tdBlue,
        ),
        title: Text(
          todoitem.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todoitem.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(20)),
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.delete),
            iconSize: 18,
            onPressed: () {
              deletedTodo(todoitem.id);
            },
          ),
        ),
      ),
    );
  }
}
