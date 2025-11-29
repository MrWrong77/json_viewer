import 'package:flutter/material.dart';
import 'package:json_viewer/component/handler.dart';

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
          const Center(child: Text('Welcome to JSON Viewer!')),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter JSON here',
              labelText: 'Enter valid JSON to view the tree structure',
            ),
          ),

          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            children: [
              Handler(controller: jsonController),
              Handler(controller: jsonController),
            ],
          ),
        ],
      ),
    );
  }
}
