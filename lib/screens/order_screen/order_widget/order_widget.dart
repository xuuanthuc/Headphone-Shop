import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:headphone_shop/providers/order.dart' as ord;

class OrderItemWidget extends StatefulWidget {

  final ord.OrderItem order;

  OrderItemWidget(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItemWidget> {
  var _expandedMore = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: _expandedMore ? min(widget.order.products.length * 20.0 + 130, 300) : 100,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            ListTile(
              title: Text('\$${widget.order.amount}'),
              subtitle: Text(
                  DateFormat('dd/MM/yyy hh:mm').format(widget.order.dateTime)),
              trailing: IconButton(
                icon:
                Icon(_expandedMore ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expandedMore = !_expandedMore;
                  });
                },
              ),
            ),

            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _expandedMore ? min(widget.order.products.length * 20.0 + 10, 200): 0,
              child: ListView(
                children: widget.order.products.map((prod) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(prod.title, style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('${prod.quantity} x \$${prod.price}')
                    ],
                  ),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
