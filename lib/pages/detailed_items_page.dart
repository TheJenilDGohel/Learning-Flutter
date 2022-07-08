import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class DetailedItemsPage extends StatelessWidget {
  final Item catalog;

  const DetailedItemsPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: MyTheme.ghostWhite,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\₹ ${catalog.itemPrice}".text.xl2.red800.bold.make(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.bdazzeledBlue),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              onPressed: () {},
              child: "Add To Cart".text.bold.make(),
            ).wh(120, 50),
          ],
        ).p20(),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.itemId.toString()),
              child: Image.network(catalog.itemImage),
            ).centered().h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEX,
                edge: VxEdge.TOP,
                child: Container(
                  color: MyTheme.ghostWhite,
                  child: Column(
                    children: [
                      catalog.itemName.text.xl3.bold
                          .color(MyTheme.bdazzeledBlue)
                          .ellipsis
                          .make()
                          .py12(),
                      catalog.itemDesc.text
                          .textStyle(context.captionStyle)
                          .justify
                          .maxLines(8)
                          .ellipsis
                          .bold
                          .lg
                          .make(),
                    ],
                  ).py8().p20(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
