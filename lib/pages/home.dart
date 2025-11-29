import 'package:flutter/material.dart';
import 'package:json_viewer/component/handler.dart';
import 'package:json_viewer/component/text_operator.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController jsonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Viewer')),
      body: Column(
        spacing: 20,
        children: [
          Text('Welcome to JSON Viewer!'),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Enter JSON here',
              labelText: 'Enter valid JSON to view the tree structure',
            ),
          ),

          Row(
            spacing: 10,
            children: [
              Handler(controller: jsonController),
              TextOperator(name: 'Key'),
            ],
          ),
        ],
      ),
    );
  }
}
