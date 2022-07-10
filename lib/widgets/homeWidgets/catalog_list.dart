// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/pages/detailed_items_page.dart';

import '../../models/catalog.dart';
import '../../pages/home_page.dart';
import '../../themes/themes.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
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
              builder: (context) => DetailedItemsPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.itemId.toString()),
            child: CatalogImage(
              image: catalog.itemImage,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalog.itemName.text.semiBold
                    .color(context.accentColor)
                    .make()
                    .py12(),
                catalog.itemDesc.text
                    .textStyle(context.captionStyle)
                    .maxLines(4)
                    .ellipsis
                    .bold
                    .make(),
                5.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\₹ ${catalog.itemPrice}".text.make(),
                    AddToCart(catalog: catalog),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(10).height(180).make().py8();
  }
}
