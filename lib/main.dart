import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatefulWidget {
  const TodoApp({ Key? key }) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // to save data
  final List<String> _todoList = <String>[];
  // for text field
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('To-do list'),
        ),),
    );
  }

  // for adding data to list
  void _addTodoItem(String title) {
    // to notify the app that the state has changed
    setState(() {
      _todoList.add(title);
    });
    // to clear the textfield once an item is added to the list
    _textEditingController.clear();
  }

  // to populate the listview
  Widget _buildTodoItem(String title) {
    return ListTile(title: Text(title),);
  }




}