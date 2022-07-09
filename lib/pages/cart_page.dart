import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          _CartList().p24().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$999".text.xl4.red400.make(),
          ElevatedButton(
            onPressed: () {},
            child: "Buy Now".text.color(context.theme.buttonColor).white.make(),
          ).wh(110, 50),
        ],
      ).p16(),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Icon(
          CupertinoIcons.check_mark_circled_solid,
        ),
        title: "Item Count : 1".text.bold.make(),
        subtitle: "Item Price : \$500".text.semiBold.make(),
        trailing: Icon(CupertinoIcons.cart_badge_minus),
      ),
    );
  }
}
