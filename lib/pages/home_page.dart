import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'dart:convert';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/catalog.dart';
import '../widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/homeWidgets/catalogL_list.dart';
import '../widgets/homeWidgets/catalog_header.dart';

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
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Navigator.pushNamed(context, MyRoutes.cartRoute)),
        backgroundColor: context.theme.buttonColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Vx.white,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: Vx.mH24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.heightBox,
              CatalogHeader(),
              5.heightBox,
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator(
                  color: MyTheme.bdazzeledBlue,
                ).centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
