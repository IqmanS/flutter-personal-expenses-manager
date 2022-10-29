import 'package:flutter/material.dart';
import 'package:personal_expense/Model/transaction.dart';

class transactionList extends StatelessWidget {
  transactionList({Key? key, required this.transactions}) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((trans) {
        return Container(
          height: 80,
          child: Card(
            child: ListTile(
              leading: Text("\$" + trans.amount.toString()),
              title: Text(trans.title),
              trailing: Icon(Icons.edit),
              subtitle: Text(Date(trans.date)),
            ),
          ),
        );
      }).toList(),
    );
  }
}

String Date(DateTime dt) {
  String date = "";
  date =
      dt.day.toString() + "/" + dt.month.toString() + "/" + dt.year.toString();
  return date;
}
