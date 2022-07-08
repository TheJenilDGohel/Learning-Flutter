import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/detailed_items_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../pages/home_page.dart';
import '../../themes/themes.dart';
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
                    .color(MyTheme.bdazzeledBlue)
                    .make()
                    .py12(),
                catalog.itemDesc.text
                    .textStyle(context.captionStyle)
                    .maxLines(4)
                    .ellipsis
                    .justify
                    .bold
                    .make(),
                5.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\₹ ${catalog.itemPrice}".text.make(),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.bdazzeledBlue),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                        onPressed: () {},
                        child: "Buy Now".text.make()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).white.rounded.square(10).height(180).make().py8();
  }
}
