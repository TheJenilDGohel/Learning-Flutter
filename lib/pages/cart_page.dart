import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';

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
    final _cart = (VxState.store as MyStore).cartModel;
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "Total Price :".text.xl2.color(context.accentColor).make(),
              "₹ ${_cart.totalprice}".text.xl3.red400.make(),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                context.theme.buttonColor,
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Feature is underconstruction yet.".text.make(),
                ),
              );
            },
            child: "Buy Now".text.white.white.make(),
          ).wh(110, 48),
        ],
      ).p16(),
    );
  }
}

class _CartList extends StatelessWidget {
  _CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cartModel;
    return _cart.items.isEmpty
        ? "Your Cart Is Empty !".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              leading: Icon(
                CupertinoIcons.check_mark_circled_solid,
              ),
              title: _cart.items[index].itemName.text.bold.make(),
              subtitle: "Price : ₹ ${_cart.items[index].itemPrice}"
                  .text
                  .semiBold
                  .make(),
              trailing: IconButton(
                icon: Icon(
                  CupertinoIcons.cart_badge_minus,
                ),
                onPressed: () {
                  _cart.remove(_cart.items[index]);
                  // setState(() {});
                },
              ),
            ),
          );
  }
}
