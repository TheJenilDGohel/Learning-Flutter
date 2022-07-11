import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'dart:convert';
import '../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/homeWidgets/catalog_list.dart';
import '../widgets/homeWidgets/catalog_header.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = Uri.parse("https://jsonkeeper.com/b/8NMY");

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalog_dataJson =
    //     await rootBundle.loadString("assets/files/catalog_data.json");

    final response = await http.get(url);
    final catalog_dataJson = response.body;

    final decodedData = jsonDecode(catalog_dataJson);
    var productData = decodedData['Products'];

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cartModel;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        builder: (context, store, status) => FloatingActionButton(
          onPressed: (() => Navigator.pushNamed(context, MyRoutes.cartRoute)),
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Vx.white,
          ),
        ).badge(
          color: Vx.orange400,
          size: 18,
          count: _cart.items.length,
          textStyle: TextStyle(color: Vx.black),
        ),
        mutations: {AddMutation, RemoveMutation},
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
