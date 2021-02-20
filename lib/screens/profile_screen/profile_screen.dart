import 'package:flutter/material.dart';
import 'package:headphone_shop/screens/order_screen/orders_screen.dart';
import 'package:headphone_shop/screens/product_manager_screen/product_manager_screen.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            onPressed: (){
              Navigator.of(context).pushNamed(ProductManagerScreen.routeName);
            },
            child: Text('Edit'),
          ),
          FlatButton(
            onPressed: (){
              Navigator.of(context).pushNamed(OrderScreen.routeName);
            },
            child: Text('Order'),
          ),
        ],
      ),
    );
  }
}
