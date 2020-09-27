import 'package:flutter/material.dart';
//import './widgets/transactionlist.dart';
class NewTransactions extends StatefulWidget {
  final Function addTx;
  NewTransactions(this.addTx);


  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}


class _NewTransactionsState extends State<NewTransactions> {

  final titleController = TextEditingController();
  final amountController= TextEditingController();



  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

     Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
            children: [
              TextField(decoration: InputDecoration(labelText: 'Title'),
                //onChanged: (val){titleInput=val;},
                controller: titleController,
                onSubmitted:(_)=> submitData(),
              ),

              TextField(decoration: InputDecoration(labelText: 'Price'),
                //onChanged: (val){amountInput=val;}
                controller: amountController,
                  keyboardType:TextInputType.number,
              onSubmitted:(_)=> submitData(),
                  ),
              FlatButton(
                child:Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text('Add Transaction',style: TextStyle(color: Theme.of(context).primaryColor),),),
                onPressed:submitData,
                )
            ]
        ),
      ),

    );

  }
}
