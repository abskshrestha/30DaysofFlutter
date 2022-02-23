import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalouge/models/catalouge.dart';
import 'package:flutter_catalouge/pages/home_detail_page.dart';
import 'package:flutter_catalouge/pages/home_page.dart';

import 'package:flutter_catalouge/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_catalouge/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];        
        return InkWell(
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog: catalog,
              ),
              ),
              ),
          child: CatalogItem(Catalog: catalog,));
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
          Hero(
            tag: Key(Catalog.id.toString()),
            child: CatalogImage(
              image: Catalog.image,),
          ),
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
                     child: "Add to cart".text.make())
                  ],
                  
                ).pOnly(right: 8.0),
                ],
                ),
                )
        ],)
    ).white.rounded.square(150).make().py16();
  }
}
