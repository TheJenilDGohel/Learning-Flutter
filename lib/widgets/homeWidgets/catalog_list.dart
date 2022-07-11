// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/pages/detailed_items_page.dart';

import '../../models/catalog.dart';

import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.isMobile
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];

              return InkWell(
                onTap: () => context.vxNav.push(
                  Uri(path: MyRoutes.detailedItemsRoute, queryParameters: null),
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          )
        : GridView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];

              return InkWell(
                onTap: () => context.vxNav.push(
                  Uri(
                      path: MyRoutes.detailedItemsRoute,
                      queryParameters: {"id": catalog.itemId.toString()}),
                  params: catalog,
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 15.0),
          );
    ;
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    var children2 = [
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
                "₹ ${catalog.itemPrice}".text.make(),
                AddToCart(catalog: catalog),
              ],
            ),
          ],
        ),
      ),
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              children: children2,
            )
          : Column(
              children: children2,
            ).p20(),
    ).color(context.cardColor).rounded.square(10).height(180).make().py8();
  }
}
