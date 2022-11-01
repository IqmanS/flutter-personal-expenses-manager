import 'package:flutter/material.dart';
import 'package:personal_expense/Model/transaction.dart';
import 'package:personal_expense/Widgets/transaction_input.dart';
import 'package:personal_expense/Widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  Widget build(BuildContext context) {
    final List<Transaction> userTransaction = [
      Transaction(id: "1", title: "Shoes", amount: 69, date: DateTime.now()),
      Transaction(id: "2", title: "File", amount: 649, date: DateTime.now()),
      Transaction(id: "2", title: "MAGIC", amount: 79, date: DateTime.now()),
      Transaction(id: "3", title: "PANTS", amount: 689, date: DateTime.now())
    ];
    void addNewTransaction(String title, double amount) {
      final newTrans = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
      );
      setState(() {
        userTransaction.add(newTrans);
        print(userTransaction);
      });
    }

    return Column(
      children: [
        TransactionInput(addNewTransaction),
        const SizedBox(height: 8),
        transactionList(
          transactions: userTransaction,
        ),
      ],
    );
  }
}
