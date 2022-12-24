// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print, sized_box_for_whitespace, non_constant_identifier_names

import 'dart:math';

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
    return ListView.builder(
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
                      style: const TextStyle(color: Colors.white),
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
              trailing: MediaQuery.of(context).size.width > 360 ||
                      MediaQuery.of(context).orientation ==
                          Orientation.landscape
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Theme.of(context).primaryColor)),
                      onPressed: () => deleteTx(transactions[index].id),
                      child: Container(
                        width:
                            max(MediaQuery.of(context).size.width * 0.10, 80),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Delete"),
                            const Icon(Icons.delete)
                          ],
                        ),
                      ))
                  : IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
              subtitle: Text(Date(transactions[index].date)),
            ),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}

String Date(DateTime dt) {
  String date = "";
  date = "${dt.day}/${dt.month}/${dt.year}";
  return date;
}
