import 'package:flutter/material.dart';
import 'package:personal_expense/Widgets/transaction_list.dart';

class TransactionInput extends StatefulWidget {
  final Function addTrans;

  TransactionInput(this.addTrans);

  @override
  State<TransactionInput> createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate = null;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTrans(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    ).then((dateSelected) {
      if (dateSelected == null)
        return;
      else
        setState(() {
          _selectedDate = dateSelected;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedDate == null
                        ? "No Date Choosen"
                        : "Date:  ${Date(_selectedDate!)}",
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.resolveWith(
                          (states) => Size(80, 40)),
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 0),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Theme.of(context).primaryColor),
                    ),
                    onPressed: _presentDatePicker,
                    child: Icon(Icons.calendar_month_sharp),
                    //child: Text("Select Date"),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: const Text(
                "Add Transaction",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.resolveWith(
                      (states) => Size(150, 50)),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Theme.of(context).primaryColor)),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
