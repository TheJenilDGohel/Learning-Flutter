import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'dart:convert';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/catalog.dart';
import '../widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalog_dataJson =
        await rootBundle.loadString("assets/files/catalog_data.json");
    final decodedData = jsonDecode(catalog_dataJson);
    var productData = decodedData["Products"];

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.ghostWhite,
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
                  child: CircularProgressIndicator(
                    color: MyTheme.bdazzeledBlue,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.deepBlue).make(),
        "Tranding Products".text.xl2.color(MyTheme.pinegreen).make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];

        return CatalogItem(catalog: catalog);
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
          CatalogImage(
            image: catalog.itemImage,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              catalog.itemName.text.semiBold
                  .color(MyTheme.bdazzeledBlue)
                  .make()
                  .py12(),
              Text(
                catalog.itemDesc,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: context.captionStyle,
              ),
              ButtonBar(
                children: [
                  "\₹ ${catalog.itemPrice}".text.make(),
                ],
              ),
            ]),
          ),
        ],
      ),
    ).white.rounded.square(120).height(190).make().py8();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.white.make().p16().w32(context);
  }
}
