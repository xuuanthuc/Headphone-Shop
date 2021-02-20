import 'package:flutter/material.dart';
import 'package:headphone_shop/screens/cart_screen/cart_widget/cart_list.dart';
import 'package:headphone_shop/screens/cart_screen/cart_widget/cart_totel.dart';
import 'package:headphone_shop/providers/cart.dart';
import 'package:provider/provider.dart';
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (ctx, cart, _) =>
      Column(
        children: [
          CartItemWidget(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => CartList(
                cart.items.values.toList()[index].id,
                cart.items.keys.toList()[index],
                cart.items.values.toList()[index].title,
                cart.items.values.toList()[index].price,
                cart.items.values.toList()[index].quantity,
              ),
              itemCount: cart.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
