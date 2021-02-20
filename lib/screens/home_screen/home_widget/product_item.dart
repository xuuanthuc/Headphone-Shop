import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:headphone_shop/providers/cart.dart';
import 'package:headphone_shop/screens/product_detail_screen/detai_product_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String from;
  final String description;
  final double price;
  final String imageUrl;

  ProductItem(this.id, this.title, this.from, this.description, this.price,
      this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    void _pressAddToCart() {
      cart.addToCart(id, title, price);
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('One Item Added to Cart'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.black45,
        ),
      );
    }

    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(DetailProduct.routeName, arguments: id),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                child: Hero(
                  tag: id,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/ping.png'),
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Container(
                  padding: EdgeInsets.all(15),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(57, 57, 57, 1)),
                      ),
                      Text(
                        from,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(143, 143, 143, 1)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${price}',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              color: Colors.white,
                              icon: Icon(Icons.shopping_cart_outlined),
                              onPressed: _pressAddToCart,
                            ),
                          )
                        ],
                      )
                    ],
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
