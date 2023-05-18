import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(15)),
      child: Text(
        title,
        style: const TextStyle(fontSize: 42, color: Colors.white),
      ),
    );
  }
}
