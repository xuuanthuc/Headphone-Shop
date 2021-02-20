import 'package:flutter/material.dart';
import 'package:headphone_shop/providers/cart.dart';
import 'package:headphone_shop/providers/products.dart';
import 'package:headphone_shop/screens/edit_products_screen/edit_products_screen.dart';
import 'package:headphone_shop/screens/home_screen/home_screen.dart';
import 'package:headphone_shop/screens/product_detail_screen/detai_product_screen.dart';
import 'package:headphone_shop/screens/product_manager_screen/product_manager_screen.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (ctx) => Products()),
        Provider(create: (ctx) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Color.fromRGBO(245, 246, 248, 1),
          primaryColor: Color.fromRGBO(255, 45, 84, 1),
          primaryColorDark: Color.fromRGBO(63, 63, 63, 1),
        ),
        home: HomeScreen(),
        routes: {
          DetailProduct.routeName: (ctx) => DetailProduct(),
          ProductManagerScreen.routeName: (ctx) => ProductManagerScreen(),
          EditProduct.routeName: (ctx) => EditProduct(),
        },
      ),
    );
  }
}
