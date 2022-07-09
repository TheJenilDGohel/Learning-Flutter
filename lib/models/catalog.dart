// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel {
  static final catmodel = CatalogModel._internal();

  CatalogModel._internal();

  factory CatalogModel() => catmodel;

  static List<Item> items = [];

  //Get Item By ID

  Item getByID(int id) =>
      items.firstWhere((element) => element.itemId == id, orElse: null);

  //Get Item By Position

  Item getByPos(int pos) => items[pos];
}

class Item {
  final int itemId;
  final String itemName;
  final String itemDesc;
  final num itemPrice;
  final String itemColor;
  final String itemImage;
  Item({
    required this.itemId,
    required this.itemName,
    required this.itemDesc,
    required this.itemPrice,
    required this.itemColor,
    required this.itemImage,
  });

  Item copyWith({
    int? itemId,
    String? itemName,
    String? itemDesc,
    num? itemPrice,
    String? itemColor,
    String? itemImage,
  }) {
    return Item(
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      itemDesc: itemDesc ?? this.itemDesc,
      itemPrice: itemPrice ?? this.itemPrice,
      itemColor: itemColor ?? this.itemColor,
      itemImage: itemImage ?? this.itemImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemId': itemId,
      'itemName': itemName,
      'itemDesc': itemDesc,
      'itemPrice': itemPrice,
      'itemColor': itemColor,
      'itemImage': itemImage,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      itemId: map['itemId'] as int,
      itemName: map['itemName'] as String,
      itemDesc: map['itemDesc'] as String,
      itemPrice: map['itemPrice'] as num,
      itemColor: map['itemColor'] as String,
      itemImage: map['itemImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(itemId: $itemId, itemName: $itemName, itemDesc: $itemDesc, itemPrice: $itemPrice, itemColor: $itemColor, itemImage: $itemImage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.itemId == itemId &&
        other.itemName == itemName &&
        other.itemDesc == itemDesc &&
        other.itemPrice == itemPrice &&
        other.itemColor == itemColor &&
        other.itemImage == itemImage;
  }

  @override
  int get hashCode {
    return itemId.hashCode ^
        itemName.hashCode ^
        itemDesc.hashCode ^
        itemPrice.hashCode ^
        itemColor.hashCode ^
        itemImage.hashCode;
  }
}
