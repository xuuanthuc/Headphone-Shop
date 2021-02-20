import 'package:flutter/material.dart';
import 'package:headphone_shop/providers/products.dart';
import 'package:headphone_shop/screens/home_screen/home_widget/product_item.dart';
import 'package:provider/provider.dart';

class ListProducts extends StatelessWidget {
  Future<void> _refeshProduct(BuildContext context) async{
    await Provider.of<Products>(context, listen: false).fetchAndSetProduct();
  }
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final productItem = products.items;
    return RefreshIndicator(
      onRefresh: () => _refeshProduct(context),
      child: Container(
        padding: EdgeInsets.only(top: 15,left: 15,right: 15),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 15,
          ),
          itemCount: productItem.length,
          itemBuilder: (ctx, index) => ProductItem(
            productItem[index].id,
            productItem[index].title,
            productItem[index].from,
            productItem[index].description,
            productItem[index].price,
            productItem[index].imageUrl,
          ),
        ),
      ),
    );
  }
}
