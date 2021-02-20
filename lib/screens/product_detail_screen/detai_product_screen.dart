import 'package:flutter/material.dart';
import 'package:headphone_shop/providers/cart.dart';
import 'package:headphone_shop/providers/products.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatelessWidget {
  static const routeName = '/detail-product';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments;
    final productData = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(left: 14, bottom: 7, top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).primaryColor,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Text(
          productData.title,
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80)),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 40),
                    child: Hero(
                        tag: productId,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(productData.imageUrl))),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        productData.description,
                        style: TextStyle(fontSize: 19, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Brand',
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        productData.from,
                        style: TextStyle(fontSize: 19, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  )
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${productData.price}',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: RaisedButton(
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                Provider.of<Cart>(context, listen: false)
                                    .addToCart(productData.id,
                                        productData.title, productData.price);
                              },
                              child: Text(
                                '+1 TO CART',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
