import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  const TransactionInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: Text("Submit"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
