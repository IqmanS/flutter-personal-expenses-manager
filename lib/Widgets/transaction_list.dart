// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:personal_expense/Model/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList({Key? key, required this.transactions}) : super(key: key);

  List<Transaction> transactions;
  //TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 80,
            child: Card(
              child: ListTile(
                minLeadingWidth: 60,
                leading:
                    Text("\$" + transactions[index].amount.toStringAsFixed(2)),
                title: Text(
                  transactions[index].title,
                  style: TextStyle(
                      fontFamily: Theme.of(context)
                          .appBarTheme
                          .titleTextStyle
                          ?.fontFamily,
                      fontSize: 18),
                ),
                trailing: Icon(Icons.edit),
                subtitle: Text(Date(transactions[index].date)),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}

String Date(DateTime dt) {
  String date = "";
  date =
      dt.day.toString() + "/" + dt.month.toString() + "/" + dt.year.toString();
  return date;
}
