import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{
  final List<Transactions> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height,
      child:transactions.isEmpty ?
          Container(
            padding: EdgeInsets.only(bottom: 600),
              height: 100,
              child:Center(child:Text('No transactions added yet!',textAlign: TextAlign.center,)))
          :ListView.builder(
        itemBuilder:(ctx,index){
          return Card(child:Row(
            children: <Widget>[
              Container(
                padding:EdgeInsets.all(10),
                child:Text('\₹${transactions[index].amount.toStringAsFixed(2)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: Colors.black,width: 2
                    )
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Container(
                    //margin:EdgeInsets.only(left: 20),
                    //child:Center(child: Text(transactions[index].id,style: TextStyle(fontSize: 18,),),),
                     // ),
                    Container(margin: EdgeInsets.only(left: 20),
                      child: Text(transactions[index].title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
                  //]
                  Container(margin: EdgeInsets.only(left: 20),
                    child:Text(DateFormat.yMMMd().add_jm().format(transactions[index].date),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),),)

          ],)

            ],

          ));
        },
        itemCount:transactions.length,
        ),
    );
  }
}
