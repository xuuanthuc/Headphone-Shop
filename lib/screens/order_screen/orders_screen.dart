import 'package:flutter/material.dart';
import 'package:headphone_shop/providers/order.dart';
import 'package:headphone_shop/screens/order_screen/order_widget/order_widget.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  Future<void> _refeshOrder(BuildContext context) async{
    await Provider.of<Order>(context, listen: false).fetchAndSetOrder();
  }
  static const routeName = 'order-screen';
  @override
  Widget build(BuildContext context) {

    // final order = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      body: FutureBuilder(//lay ket qua tu _refeshOrder truoc roi xay dung len list order
        future: _refeshOrder(context),
        builder:(ctx, snapshot)=> snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator(),) :
        Consumer<Order>( // chi lay provider trong widget nay va build lai widget nay tranh build lai ca trang, neu dung final order o tren se build lai ca trang lien tuc, tuong tu voi user_products_screen
          builder:(ctx, order, _) => RefreshIndicator(
            onRefresh: () => _refeshOrder(context),
            child: ListView.builder(
              itemBuilder: (ctx, i) => OrderItemWidget(order.orders[i]),
              itemCount: order.orders.length,
            ),
          ),
        ),
      ),
    );
  }
}
