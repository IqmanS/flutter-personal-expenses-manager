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
    // Transaction(id: "1", title: "Shoes", amount: 69, date: DateTime.now()),
    // Transaction(id: "2", title: "File", amount: 649, date: DateTime.now()),
    // Transaction(id: "2", title: "Magic", amount: 79, date: DateTime.now()),
    // Transaction(id: "3", title: "Pants", amount: 689, date: DateTime.now())
  ];
  void _addNewTransaction(String title, double amount) {
    final newTrans = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      userTransaction.add(newTrans);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
        elevation: 0,
        title: const Text(
          "Personal Expenses",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Container(
                child: TransactionChart(),
              ),
              const SizedBox(height: 8),
              // TransactionInput(),
              userTransaction.isEmpty
                  ? Container(
                      height: 500,
                      child: Column(
                        children: [
                          Flexible(child: Container(), flex: 1),
                          SvgPicture.asset(
                            "assets/undraw_Empty.svg",
                            height: 240,
                          ),
                          Flexible(
                            flex: 2,
                            child: Text(
                              "No Expense added",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    )
                  : TransactionList(
                      transactions: userTransaction,
                    ),
              //UserTransactions(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade700,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
