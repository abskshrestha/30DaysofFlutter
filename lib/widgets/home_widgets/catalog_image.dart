import 'package:flutter/cupertino.dart';
import 'package:flutter_catalouge/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
