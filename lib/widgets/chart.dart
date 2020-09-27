import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';
import './chartbar.dart';


class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String,Object>> get transactionValueCharts{
    return List.generate(7, (index){
      final weekDay=DateTime.now().subtract(Duration(days: index),);
      var totalAmount=0.0;

      for(var i=0;i<recentTransactions.length;i++){
        if(recentTransactions[i].date.day==weekDay.day&&
        recentTransactions[i].date.month==weekDay.month&&
        recentTransactions[i].date.year==weekDay.year)
        totalAmount+=recentTransactions[i].amount;
      }

      print(totalAmount);

      return {'day':DateFormat.E().format(weekDay).substring(0,1),
        'amount':totalAmount};
    });
  }
  
  double get percentage{
    return transactionValueCharts.fold(0.0, (sum, item){
      return sum+item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 5,margin: EdgeInsets.all(20),
    child: Container(
      padding: EdgeInsets.all(10),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:transactionValueCharts.map((data){
        return Flexible(
          fit: FlexFit.tight,
          child: ChartBar(data['day'],data['amount'],
              percentage==0.0? 0.0
              :(data['amount'] as double)/percentage),
        );
      }).toList(),),
    ),
    );
  }
}
