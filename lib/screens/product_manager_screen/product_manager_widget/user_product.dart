import 'package:flutter/material.dart';
import 'package:headphone_shop/providers/products.dart';
import 'package:headphone_shop/screens/edit_products_screen/edit_products_screen.dart';
import 'package:headphone_shop/screens/product_manager_screen/product_manager_screen.dart';
import 'package:provider/provider.dart';

class ProductManagerItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String from;
  final double price;
  final String imageUrl;

  ProductManagerItem(
    this.id,
    this.title,
    this.description,
    this.from,
    this.price,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              IconButton(icon: Icon(Icons.auto_fix_high, color: Theme.of(context).primaryColor,), onPressed: (){
                Navigator.of(context).pushReplacementNamed(EditProduct.routeName, arguments: id);
              }),
              IconButton(icon: Icon(Icons.delete,color: Theme.of(context).primaryColor,), onPressed: (){
                Provider.of<Products>(context, listen: false).deleteProduct(id);
                Navigator.of(context).pushReplacementNamed(ProductManagerScreen.routeName);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
