// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:personal_expense/Model/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList(
      {Key? key, required this.transactions, required this.deleteTx})
      : super(key: key);

  List<Transaction> transactions;
  Function deleteTx;
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
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: FittedBox(
                      child: Text(
                        "\$${transactions[index].amount.toStringAsFixed(2)}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  transactions[index].title,
                  style: TextStyle(
                      fontFamily: Theme.of(context)
                          .appBarTheme
                          .titleTextStyle
                          ?.fontFamily,
                      fontSize: 18),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteTx(transactions[index].id),
                ),
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
  date = "${dt.day}/${dt.month}/${dt.year}";
  return date;
}
