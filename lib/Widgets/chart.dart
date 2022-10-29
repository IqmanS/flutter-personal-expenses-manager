import 'package:flutter/material.dart';

class TransactionChart extends StatelessWidget {
  const TransactionChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Center(child: Text("Chart")),
        height: 180,
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
