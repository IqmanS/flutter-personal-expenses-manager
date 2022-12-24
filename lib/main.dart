// ignore_for_file: sized_box_for_whitespace
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_expense/Widgets/chart.dart';
import 'package:personal_expense/Widgets/transaction_input.dart';

import 'Model/transaction.dart';
import 'Widgets/transaction_list.dart';

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
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.grey,
        textTheme: ThemeData.dark().textTheme.apply(
                fontFamily: GoogleFonts.quicksand(
              fontWeight: FontWeight.w500,
            ).fontFamily),
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
              titleTextStyle: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
      ),
      home: MyHomePage(title: 'Personal Expenses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> userTransaction = [
    Transaction(id: "1", title: "Shoes", amount: 69, date: DateTime.now()),
    Transaction(id: "2", title: "File", amount: 649, date: DateTime.now()),
    Transaction(
        id: "2",
        title: "Magic",
        amount: 79,
        date: DateTime.now().subtract(const Duration(days: 2))),
    Transaction(
        id: "3",
        title: "Pants",
        amount: 689,
        date: DateTime.now().subtract(const Duration(days: -1)))
  ];
  void _addNewTransaction(String title, double amount, DateTime choosenDate) {
    final newTrans = Transaction(
      title: title,
      amount: amount,
      date: choosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      userTransaction.add(newTrans);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      userTransaction.removeWhere((element) => element.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bctx) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: TransactionInput(_addNewTransaction),
        );
      },
    );
  }

  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: const Icon(Icons.add),
        )
      ],
      elevation: 0,
      title: const Text(
        "Personal Expenses",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
    final txChart = Container(
      padding: isLandscape
          ? const EdgeInsets.symmetric(vertical: 4, horizontal: 32)
          : const EdgeInsets.fromLTRB(8, 8, 8, 4),
      height: isLandscape
          ? (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom) *
              0.80
          : (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom) *
              0.35,
      child: TransactionChart(userTransaction: userTransaction),
    );
    final txList = userTransaction.isEmpty
        ? Column(
            children: [
              //Flexible(child: Container(), flex: 1),
              SvgPicture.asset(
                "assets/undraw_Empty.svg",
                height: (MediaQuery.of(context).size.height) * 0.65,
              ),
              const Text(
                "No Expense added",
                style: TextStyle(fontSize: 18),
              ),
            ],
          )
        : Container(
            padding: isLandscape
                ? const EdgeInsets.symmetric(vertical: 4, horizontal: 32)
                : const EdgeInsets.fromLTRB(8, 8, 8, 4),
            height: isLandscape
                ? (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom) *
                    0.95
                : (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom) *
                    0.65,
            child: TransactionList(
              transactions: userTransaction,
              deleteTx: _deleteTransaction,
            ),
          );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (isLandscape)
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Show Chart"),
                Switch.adaptive(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    })
              ]),
            if (isLandscape) _showChart ? txChart : txList,
            if (!isLandscape) txChart,
            if (!isLandscape) txList
          ],
        ),
      ),
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              backgroundColor: Colors.grey.shade700,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => _startAddNewTransaction(context),
            ),
      floatingActionButtonLocation: isLandscape
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.centerFloat,
    );
  }
}
