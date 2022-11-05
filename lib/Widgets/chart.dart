import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class TransactionChart extends StatelessWidget {
  final userTransaction;
  TransactionChart({Key? key, this.userTransaction}) : super(key: key);
  final dataMap = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        height: 240,
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Center(child: PieChart(dataMap: dataMap)),
      ),
    );
  }
}
