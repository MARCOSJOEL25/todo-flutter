// ignore: file_names
import 'dart:math';

import 'package:app/models/todo.dart';
import 'package:app/widget/card_todo.dart';
import 'package:flutter/material.dart';
import 'package:app/const/Colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoList = todo.todolist();
  final _controllerEdit = TextEditingController();
  List<todo> _foundList = [];

  @override
  void initState() {
    _foundList = todoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _gustombarapp(),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              searchbox(
                functionOnChange: _onChangeTextRenderList,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 20),
                      child: const Text(
                        "All ToDos",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ),
                    for (todo itemtodo in _foundList)
                      card_todo(
                        todoitem: itemtodo,
                        changedTodo: _handleToDoChange,
                        deletedTodo: _handleToDoDeleted,
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _controllerEdit,
                  decoration: const InputDecoration(
                      hintText: 'Add a new todo item',
                      border: InputBorder.none),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  _addTodo();
                },
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 32),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(60, 60), elevation: 10),
              ),
            )
          ]),
        )
      ]),
    );
  }

  void _handleToDoChange(todo todoitem) {
    setState(() {
      todoitem.isDone = !todoitem.isDone;
    });
  }

  void _handleToDoDeleted(String Id) {
    setState(() {
      todoList.removeWhere((item) => item.id == Id);
    });
  }

  void _onChangeTextRenderList(String value) {
    List<todo> result;
    if (value.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((item) =>
              item.todoText!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundList = result;
    });
  }

  void _addTodo() {
    setState(() {
      todoList.add(todo(
          id: DateTime.now().millisecond.toString(),
          todoText: _controllerEdit.text,
          isDone: false));
    });
    _controllerEdit.clear();
  }

  AppBar _gustombarapp() {
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          Container(
            width: 40,
            height: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/avatar.jpeg')),
          )
        ],
      ),
      backgroundColor: tdBGColor,
    );
  }
}

class searchbox extends StatelessWidget {
  final functionOnChange;

  const searchbox({
    super.key,
    this.functionOnChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => functionOnChange(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: "Search",
        ),
      ),
    );
  }
}
