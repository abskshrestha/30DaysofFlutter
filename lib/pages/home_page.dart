import 'package:flutter/material.dart';
import 'package:flutter_catalouge/models/catalouge.dart';
import 'package:flutter_catalouge/widgets/drawer.dart';
import 'package:flutter_catalouge/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "codepur";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalougeModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalouge App",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
