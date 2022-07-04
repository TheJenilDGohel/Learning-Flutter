class CatalogModel {
  static final items = [
    Item(
      itemId: 1,
      itemName: "iPhone 13 Pro",
      itemDesc:
          "A dramatically more powerful camera system. A display so responsive, every interaction feels new again. The world’s fastest smartphone chip. Exceptional durability. And a huge leap in battery life.",
      itemColor: "#505F4E",
      itemImage:
          "https://www.powerplanetonline.com/cdnassets/iphone_13_pro_max_verde_alpino_01_l.jpg",
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
}
