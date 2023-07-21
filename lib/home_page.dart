import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final expense_name_AddController = TextEditingController();
  final expense_amount_AddController = TextEditingController();

  void addNewExpense()
  {
    showDialog(context: context,
        builder: (context) => AlertDialog(
          title: Text('New Entry'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Text('New Entry'),
              ),
              Row(
                children: <Widget>[
                  Text('Category: '),
                  TextField(controller: expense_name_AddController,)
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Price: '),
                  TextField(controller: expense_amount_AddController,)
                ],
              )
            ]
          ),
          actions: [MaterialButton(onPressed: save,
          child: Text('Save')),
          MaterialButton(onPressed: cancel,
          child: Text('Cancel'),)],
        ));
  }

  void save()
  {

  }

  void cancel()
  {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(85, 50, 0, 0),
            child: Icon(Icons.account_circle_rounded,
            size: 100
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
            child: Text('Welcome Back',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )),
          ),
        ]
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
        child: Container(
          child: FloatingActionButton(
            onPressed: addNewExpense,
            backgroundColor: Colors.black,
            child: Text('+',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            )),
          ),
        ),
      ),
    );
  }
}
