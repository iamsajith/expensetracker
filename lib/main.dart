import 'package:flutter/material.dart';
import './widgets/newtransaction.dart';
import './models/transactions.dart';
import './widgets/transactionlist.dart';
import './widgets/chart.dart';

void main()=> runApp(MyHome());

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Expense Tracker',
   home: MyExpenses(),);
 }
}

class MyExpenses extends StatefulWidget {
  @override
  _MyExpensesState createState() => _MyExpensesState();
}
class _MyExpensesState extends State<MyExpenses> {

  final List<Transactions>_userTransactionList = [];

  List<Transactions> get recentTransactions{

    return _userTransactionList.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transactions(title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactionList.add(newTx);
    });
  }


  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
          onTap: (){},
          child:NewTransactions(_addNewTransaction),
       behavior: HitTestBehavior.opaque,
      );
    },
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
          primarySwatch:Colors.green,
      fontFamily: 'SF Pro Display Regular',
      accentColor: Colors.amber),

        home: Scaffold(
      appBar: AppBar(title: Text('My Expenses'),
          centerTitle: true,),
      body:Container(

          child:SingleChildScrollView(
            child:Container(child:Column(
              children: [

                    Chart(recentTransactions),

                TransactionList(_userTransactionList)
               ],
            ),
      ),),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed:()=> _startAddNewTransaction(context),),
    ),
        );
  }
}


