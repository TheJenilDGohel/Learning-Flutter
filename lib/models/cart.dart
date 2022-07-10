// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_application_1/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';

class CartModel {
  //catalog field
  late CatalogModel _catalog;

  //collection of itemIDs
  List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  //set catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //Get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getByID(id)).toList();

  //Get Total Price
  num get totalprice =>
      items.fold(0, (total, current) => total + current.itemPrice);

  //add Item
  void add(Item item) {
    _itemIds.add(item.itemId);
  }

  //remove Item
  void remove(Item item) {
    _itemIds.remove(item.itemId);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation({
    required this.item,
  });

  @override
  perform() {
    store?.cartModel._itemIds.add(item.itemId);
  }
}
