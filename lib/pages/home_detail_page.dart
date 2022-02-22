import 'package:flutter/material.dart';
import 'package:flutter_catalouge/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalouge/models/catalouge.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : assert(catalog != null), super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.white,
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl.red800.make(),
                    ElevatedButton(onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                    shape: MaterialStateProperty.all(StadiumBorder(),),
                    ),
                     child: "Buy".text.make()).wh(100, 50)
                  ],
        
      ).p32(),
     backgroundColor: Vx.white,
      body: SafeArea(
      bottom: false,
        child: Column(
            children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,

                child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                    catalog.desc.text.xl.make(),
                10.heightBox,
                  ],
                ).py64(),
                          ),
              ),
            )
            ],
          )
      ),
    );
  }
}
