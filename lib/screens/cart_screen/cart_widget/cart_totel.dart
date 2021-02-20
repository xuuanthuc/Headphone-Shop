import 'package:flutter/material.dart';
import 'package:headphone_shop/providers/cart.dart';
import 'package:headphone_shop/providers/order.dart';
import 'package:headphone_shop/screens/order_screen/orders_screen.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                label: Text(
                  '\$${cart.totalAmount}',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlatButton.icon(
                  splashColor: Colors.amber,
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () async {
                    await Provider.of<Order>(context, listen: false).addOrder(
                        cart.items.values.toList(), cart.totalAmount);
                    cart.clear();
                    Navigator.of(context).pushNamed(OrderScreen.routeName);
                  },
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: Text('Order Now'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
