import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // to save data
  final List<String> _todoList = <String>[];
  // for text field
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('To-do list')),
        ),
        body: ListView(children: _getItems(),),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showMyDialog(context),
          child: const Icon(Icons.add),
          tooltip: 'Add Item',
        ),
      );
  }

  // for adding data to list
  void _addTodoItem(String title) {
    // to notify the app that the state has changed
    setState(() {
      _todoList.add(title);
    });
    // to clear the textfield once an item is added to the list
    _textFieldController.clear();
  }

  // to populate the listview
  Widget _buildTodoItem(String title) {
    return ListTile(title: Text(title),);
  }

  // to display a dialog for the user to input items
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a task'),
          content: TextField(
            controller: _textFieldController,
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text('Cancel')
              ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              }, 
              child: const Text('Add')
              ),
          ],
        );
      }
      );
  }

  List<Widget> _getItems(){
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }


}