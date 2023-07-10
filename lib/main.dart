import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Counter_App_Assignment(),
  ));
}

class Counter_App_Assignment extends StatefulWidget {
  const Counter_App_Assignment({super.key});

  @override
  State<Counter_App_Assignment> createState() => _Counter_App_AssignmentState();
}

class _Counter_App_AssignmentState extends State<Counter_App_Assignment> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text(
          'Counter App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.black,
          )
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[100],
      ),
      body:Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(135, 300, 0, 0),
                child: Text('Count = $count',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
              )
            ],
          ),
          Row(
            children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(105.0, 100.0, 30.0, 0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    count += 1;
                  });
                },
                child: Text('+',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                    )),
                backgroundColor: Colors.deepPurple[100],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 100.0, 0, 0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    count -= 1;
                  });
                },
                child: Text('-',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                    )),
                backgroundColor: Colors.deepPurple[100],
              ),
            ),
            ],
          ),
        ],
      ),




      );
  }
}


