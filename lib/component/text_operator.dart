import 'package:flutter/material.dart';

class TextOperator extends StatelessWidget {
  final String name;
  const TextOperator({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 65, 206, 231)),
          borderRadius: BorderRadius.circular(10),
        ),
        // 根据name长度动态调整字体大小
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: name.length > 3 ? 10 : 14,
            ),
          ),
        ),
        // child: Center(child: Text(name, style: TextStyle(fontSize: 14))),
      ),
    );
  }
}
