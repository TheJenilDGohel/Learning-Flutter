import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_application_1/widgets/homeWidgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class DetailedItemsPage extends StatelessWidget {
  final Item catalog;

  const DetailedItemsPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
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
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog.itemName.text.xl3.bold
                          .color(context.accentColor)
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
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\₹ ${catalog.itemPrice}".text.xl2.red500.bold.make(),
            AddToCart(
              catalog: catalog,
            ).wh(120, 50),
          ],
        ).p20(),
      ),
    );
  }
}
