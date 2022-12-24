// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/Model/transaction.dart';
import 'package:pie_chart/pie_chart.dart';

class TransactionChart extends StatefulWidget {
  final userTransaction;
  TransactionChart({Key? key, required this.userTransaction}) : super(key: key);

  @override
  State<TransactionChart> createState() => _TransactionChartState();
}

class _TransactionChartState extends State<TransactionChart> {
  Map<String, double> transactionToMap(List<Transaction> trans) {
    int length = trans.length;
    final dataMap = <String, double>{
      "Monday": 0,
      "Tuesday": 0,
      "Wednesday": 0,
      "Thursday": 0,
      "Friday": 0,
      "Saturday": 0,
      "Sunday": 0,
    };
    for (int i = 0; i < length && i < 10; i++) {
      if (i == 10) {
        break;
      } else {
        dataMap[DateFormat("EEEE").format(trans[i].date)] =
            (dataMap[DateFormat("EEEE").format(trans[i].date)]! + 1);
      }
    }
    return dataMap;
  }

  @override
  Widget build(BuildContext context) {
    final dataMap = transactionToMap(widget.userTransaction);
    print(dataMap);
    return Card(
        elevation: 7,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: PieChart(
              chartValuesOptions: ChartValuesOptions(
                decimalPlaces: 0,
                showChartValueBackground: true,
              ),
              dataMap: dataMap,
              legendOptions: MediaQuery.of(context).size.height <
                      MediaQuery.of(context).size.width
                  ? LegendOptions(
                      showLegends: false,
                    )
                  : LegendOptions(),
            ),
          ),
        ));
  }
}
