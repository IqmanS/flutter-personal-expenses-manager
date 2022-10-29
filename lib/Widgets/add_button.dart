import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.grey.shade700,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }
}
