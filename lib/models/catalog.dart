class Item {
  final String itemId;
  final String itemName;
  final String itemDesc;
  final num itemPrice;
  final String itemColor;
  final String itemImage;

  Item(
      {this.itemId,
      this.itemName,
      this.itemDesc,
      this.itemPrice,
      this.itemColor,
      this.itemImage});
}

final Product = [
  Item(
    itemId: "Catalog001",
    itemName: "iPhone 13 Pro",
    itemDesc:
        "A dramatically more powerful camera system. A display so responsive, every interaction feels new again. The world’s fastest smartphone chip. Exceptional durability. And a huge leap in battery life.",
    itemColor: "#505F4E",
    itemImage:
        "https://static.jazp.com/uploads/202203/40068bd2ffe5411b571174fef90f8b0b.jpeg",
    itemPrice: 124000,
  ),
];
