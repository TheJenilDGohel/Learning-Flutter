import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/catalog.dart';
import '../widgets/drawer.dart';

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
      appBar: AppBar(
        title: Text("Catalog App"),
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 7,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: GridTile(
                      header: Container(
                        child: Text(
                          item.itemName,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.lato().fontFamily,
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      child: Image.network(
                        item.itemImage,
                        fit: BoxFit.cover,
                      ),
                      footer: Container(
                        child: Text(
                          item.itemPrice.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.lato().fontFamily,
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: CatalogModel.items.length)
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
