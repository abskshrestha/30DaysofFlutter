import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalouge/models/catalouge.dart';
import 'package:flutter_catalouge/widgets/drawer.dart';
import 'package:flutter_catalouge/widgets/item_widget.dart';
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

        body: SafeArea(
      child: Container(
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().expand()
            else
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];        
        return CatalogItem(Catalog: catalog,);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item Catalog; //import
  const CatalogItem(
      {Key? key, required this.Catalog})
      : assert(Catalog != null),
        super(key: key);
  
  @override
  Widget build(BuildContext context) {
final String image;
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: Catalog.image,),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                Catalog.desc.text.sm.make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${Catalog.price}".text.bold.xl.make(),
                    ElevatedButton(onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                    shape: MaterialStateProperty.all(StadiumBorder(),),
                    ),
                     child: "Buy".text.make())
                  ],
                  
                ).pOnly(right: 8.0),
                ],
                ),
                )
        ],)
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);
final String image; 
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
          ).box.rounded.p8.color(MyTheme.creamColor).make().py16().w40(context);
  }
}
