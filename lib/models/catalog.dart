class CatalogModel {
  static List<Item> items = [
    Item(
      itemId: 1,
      itemName: "iPhone 13 Pro",
      itemDesc:
          "A dramatically more powerful camera system. A display so responsive, every interaction feels new again. The world’s fastest smartphone chip. Exceptional durability. And a huge leap in battery life.",
      itemColor: "#505F4E",
      itemImage:
          "https://cdn.mos.cms.futurecdn.net/CAZ6JXi6huSuN4QGE627NR-320-80.jpg",
      itemPrice: 124000,
    ),
  ];
}

class Item {
  final num itemId;
  final String itemName;
  final String itemDesc;
  final num itemPrice;
  final String itemColor;
  final String itemImage;

  Item(
      {required this.itemId,
      required this.itemName,
      required this.itemDesc,
      required this.itemPrice,
      required this.itemColor,
      required this.itemImage});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      itemId: map["itemId"],
      itemName: map["itemName"],
      itemDesc: map["itemDesc"],
      itemPrice: map["itemPrice"],
      itemColor: map["itemColor"],
      itemImage: map["itemImage"],
    );
  }

  toMap() => {
        "itemId": itemId,
        "itemName": itemName,
        "itemDesc": itemDesc,
        "itemPrice": itemPrice,
        "itemColor": itemColor,
        "itemImage": itemImage,
      };
}
