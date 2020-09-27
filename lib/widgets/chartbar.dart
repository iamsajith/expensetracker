
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;

  ChartBar(this.label,this.spendingAmount,this.spendingPercentage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Flexible(child: Text('\₹${spendingAmount.toStringAsFixed(0)}')),
      SizedBox(height: 4,),
      Container(
        height: 100,
          width: 10,
        child: Stack(
          children: <Widget>[Container(
            decoration:BoxDecoration(border: Border.all(color: Colors.black,width: 1),
            borderRadius: BorderRadius.circular(20),color: Color.fromRGBO(220, 220, 220, 1),),


          )],

        )),
    FractionallySizedBox(//heightFactor: spendingPercentage,
    child: Container(
      decoration: BoxDecoration(color: Theme
          .of(context)
          .primaryColor,
          borderRadius: BorderRadius.circular(20)
      ),
     ),),
    SizedBox(height: 4),
      Text(label)

    ],);
  }
}
