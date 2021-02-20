import 'package:flutter/material.dart';
import 'package:headphone_shop/providers/products.dart';
import 'package:headphone_shop/screens/edit_products_screen/edit_products_screen.dart';
import 'package:headphone_shop/screens/product_manager_screen/product_manager_widget/user_product.dart';
import 'package:provider/provider.dart';

class ProductManagerScreen extends StatelessWidget {
  static const routeName = '/mangager-product';

  Future<void> _refeshProduct(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined),
                onPressed:() => Navigator.of(context).pop(),
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text('Your Products', style: TextStyle(color: Theme.of(context).primaryColor),),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
              child: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).pushNamed(EditProduct.routeName);
                    }),
              ),
            )
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: FutureBuilder(
          future: _refeshProduct(context),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: () => _refeshProduct(context),
                      child: Consumer<Products>(
                        builder: (ctx, products, _) => ListView.builder(
                          itemBuilder: (ctx, index) => Column(
                            children: [
                              ProductManagerItem(
                                products.items[index].id,
                                products.items[index].title,
                                products.items[index].description,
                                products.items[index].from,
                                products.items[index].price,
                                products.items[index].imageUrl,
                              ),
                            ],
                          ),
                          itemCount: products.items.length,
                        ),
                      ),
                    ),
        ));
  }
}
