import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:headphone_shop/providers/cart.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;
  CartList(this.id,this.productId,this.title,this.price,this.quantity);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {//tra ve gia tri xac nhan true hay false, true thi tiep tuc thuc hien
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('Are you sure??'),
              content: Text('Delete your order!'),
              actions: [
                FlatButton(onPressed: () {
                  Navigator.of(ctx).pop(false); //tra lai ket qua vi false
                }, child: Text('No')),
                FlatButton(onPressed: () {
                  Navigator.of(ctx).pop(true); // tro ve nhung tiep tuc thuc hien cau lenh onDismiss
                }, child: Text('Yes')),
              ],
            ));
      },
      onDismissed: (dismiss) => Provider.of<Cart>(context, listen: false).removeCart(productId),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 5,),
                    Text('\$${price * quantity}'),
                  ],
                ),
                Text('x ${quantity}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
