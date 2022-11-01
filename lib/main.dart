import 'package:flutter/material.dart';
import 'package:personal_expense/Widgets/add_button.dart';
import 'package:personal_expense/Widgets/chart.dart';

import 'Widgets/user_transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Personal Expenses"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Container(
                child: TransactionChart(),
                height: 180,
              ),
              const SizedBox(height: 8),
              // TransactionInput(),
              // Expanded(
              //     child: transactionList(
              //   transactions: transaction,
              // )),
              UserTransactions(),
            ],
          ),
        ),
      ),
      floatingActionButton: AddButton(),
    );
  }
}
