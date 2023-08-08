import 'package:flutter/material.dart';

class TodoApiScreenPage extends StatelessWidget {
  const TodoApiScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do form api Page"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Text("data");
                }),
          ),
        ],
      )),
    );
  }
}
