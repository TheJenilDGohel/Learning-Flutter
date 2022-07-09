import 'dart:ffi';
import 'package:flutter_application_1/models/catalog.dart';

class CartModel {
  static final cartmodel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartmodel;

  //catalog field
  late CatalogModel _catalog;

  //collection of itemIDs
  List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  //set catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
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
