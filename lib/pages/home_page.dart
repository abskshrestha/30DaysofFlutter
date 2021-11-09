import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "codepur";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalouge App"),
      ),
      body: Center(
        child: Text('Welcome to $days off flutter by $name'),
      ),
      drawer: Drawer(),
    );
  }
}
