import 'package:flutter/material.dart';
import 'package:flutter_catalouge/widgets/drawer.dart';

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
        child: Text('Welcome to $days of flutter by $name'),
      ),
      drawer: MyDrawer(),
    );
  }
}
