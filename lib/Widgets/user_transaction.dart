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
    return Column(
      children: [
        TransactionInput(addNewTransaction),
        const SizedBox(height: 8),
        TransactionList(
          transactions: userTransaction,
        ),
      ],
    );
  }
}
