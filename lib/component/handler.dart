import 'package:flutter/material.dart';

class Handler extends StatelessWidget {
  final TextEditingController controller;
  const Handler({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      color: const Color.fromARGB(255, 53, 186, 238),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'fileter',
        ),
      ),
    );
  }
}
