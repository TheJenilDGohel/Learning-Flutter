import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        onTap: () {
          print("${item.itemName} is Pressed");
        },
        leading: Image.network(
          item.itemImage,
        ),
        title: Text(item.itemName),
        subtitle: Text(item.itemDesc),
        trailing: Text(
          "\₹ ${item.itemPrice}",
          textScaleFactor: 1.3,
          style: TextStyle(
            color: Colors.purpleAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
