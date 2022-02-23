import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalouge/utils/routes.dart';
import 'package:flutter_catalouge/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalouge/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalouge/models/catalouge.dart';

import 'package:flutter_catalouge/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "codepur";

  void initState() {
    super.initState();
    loadData();
  }

  // loadData() async {
  //  var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
  //  var decodedData = jsonDecode(catalogJson);
  //  print(decodedData);

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
      child: const Icon(CupertinoIcons.cart),
      ),
        body: SafeArea(
      child: Container(
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().py(16).expand()
            else
                CircularProgressIndicator().centered().expand(),
              
          ],
        ),
      ),
    ));
  }
}




