import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Expense> expenses = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Budget_tracker_app(
        all_expenses: expenses,
      ),
    );
  }
}

class Budget_tracker_app extends StatefulWidget {

  final List<Expense> all_expenses;

  Budget_tracker_app({required this.all_expenses});

  @override
  State<Budget_tracker_app> createState() => _Budget_tracker_appState();
}

class _Budget_tracker_appState extends State<Budget_tracker_app> {

   int balance = 0;

   void add_income(String income_name, int amount)
   {
     setState(() {
       balance += amount;
       widget.all_expenses.add(Expense(name: income_name, amount: amount));
     });

     Navigator.pop(context);
   }

   void add_expense(String expense_name, int amount)
   {
     setState(() {
       balance -= amount;
       widget.all_expenses.add(Expense(name: expense_name, amount: amount));
     });

     Navigator.pop(context);
   }

   void showExpensesPage() {
     Navigator.push(
       context,
       MaterialPageRoute(
         builder: (context) => ExpensesPage(
           expenses: widget.all_expenses,
         ),
       ),
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: Column(
        children: [
          Container(
            //color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    //color: Colors.yellow[200],
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow[200],
                    ),
                    child: Icon(Icons.account_circle_rounded,
                      size: 100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(child: Text('Welcome Back',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[200],
                    )
                  )
                ),
                SizedBox(
                  height: 110,
                ),
                Center(
                  child: Card(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                        child: Column(
                          children: [
                            Text('B A L A N C E',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[200],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text('$balance',
                                style: TextStyle(
                                  fontSize: 20,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.yellow[200],
                                )
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ],
            )
          )
        ],
      ),
      floatingActionButton: Row(
        children: <Widget>[
          SizedBox(
            width: 80,
          ),
        Container(
          //color: Colors.white,
          height: 100,
          width: 100,
          child: FloatingActionButton(onPressed: showExpensesPage,
            child: Text('Show List',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[200],
                )),
            backgroundColor: Colors.black,
          ),
        ),
          SizedBox(
            width: 50,
          ),
          Container(
            //color: Colors.white,
            width: 100,
            height: 100,
            child: FloatingActionButton(
              onPressed: (){
                showDialog(context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Choose an option'),
                        actions: [
                          Row(
                            children: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                                showDialog(context: context,
                                    builder: (BuildContext context){
                                        String incomeName = "";
                                        int amount = 0;
                                        return AlertDialog(
                                          title: Text('Add Income'),
                                          content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                          TextField(
                                          decoration: InputDecoration(labelText: 'Income Name'),
                                          onChanged: (value) {
                                            incomeName = value;
                                          },
                                        ),
                                          TextField(
                                            decoration: InputDecoration(labelText: 'Amount'),
                                            onChanged: (value){
                                              amount = int.parse(value);
                                            },
                                          )
                                      ]
                                      ),
                                          actions: [
                                            Row(
                                              children: [
                                                TextButton(onPressed: (){Navigator.pop(context);},
                                                    child: Text('Cancel')),
                                                SizedBox(
                                                  width: 100,
                                                ),
                                                TextButton(onPressed: (){
                                                  if(amount != 0 && incomeName != "")
                                                    {
                                                      add_income(incomeName, amount);
                                                    }
                                                },
                                                    child: Text('Save'))
                                              ],
                                            )
                                          ],
                                        );
                                    }
                                    );
                              },
                                  child: Text('Income')),
                              SizedBox(
                                width: 130,
                              ),
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                                showDialog(context: context,
                                    builder: (BuildContext context){
                                      String expenseName = "";
                                      int amount = 0;
                                      return AlertDialog(
                                        title: Text('Add Expense'),
                                        content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                decoration: InputDecoration(labelText: 'Expense Name'),
                                                onChanged: (value) {
                                                  expenseName = value;
                                                },
                                              ),
                                              TextField(
                                                decoration: InputDecoration(labelText: 'Amount'),
                                                onChanged: (value){
                                                  amount = int.parse(value);
                                                },
                                              )
                                            ]
                                        ),
                                        actions: [
                                          Row(
                                            children: [
                                              TextButton(onPressed: (){Navigator.pop(context);},
                                                  child: Text('Cancel')),
                                              SizedBox(
                                                width: 100,
                                              ),
                                              TextButton(onPressed: (){
                                                if(amount != 0 && expenseName != "")
                                                {
                                                  add_expense(expenseName, amount);
                                                }
                                              },
                                                  child: Text('Save')),

                                            ],
                                          )
                                        ],
                                      );
                                    }
                                );
                              },
                                  child: Text('Expense'))
                            ],
                          )
                        ],
                      );
                    });
              },
              child: Text('+',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[200],
              )),
              backgroundColor: Colors.black,
            ),
          ),

        ],
      ),
    );
  }
}
class Expense{
  final String name;
  final int amount;

  Expense({required this.name, required this.amount});
}

class ExpensesPage extends StatefulWidget {
  final List<Expense> expenses;

  ExpensesPage({required this.expenses});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      appBar: AppBar(
        centerTitle: true,
        title: Text('All Transactions',
        style:TextStyle(
            color: Colors.yellow[200],
        )
        ),
        backgroundColor: Colors.purple[700],
      ),
      body: ListView.builder(
        itemCount: widget.expenses.length,
        itemBuilder: (context, index) {
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Adjust the value to control the amount of rounding
              ),
            margin: EdgeInsets.all(10.0),
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 8, 0, 8),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(widget.expenses[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellow[200],
                      ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${widget.expenses[index].amount}',
                        style: TextStyle(
                          fontSize: 15,
                            color: Colors.yellow[200],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                        width: 200,
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      widget.expenses.remove(widget.expenses[index]);
                    });
                  },
                      icon: Icon(Icons.delete,
                      color: Colors.yellow[200],
                      ),

                  ),
                ],
              ),
            )
          );
        },
      ),
    );
  }
}
