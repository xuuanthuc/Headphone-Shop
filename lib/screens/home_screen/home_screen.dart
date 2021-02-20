import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:headphone_shop/screens/cart_screen/cart_screen.dart';
import 'package:headphone_shop/screens/home_screen/home_widget/list_products.dart';
import 'package:headphone_shop/screens/home_screen/home_widget/list_products_screen.dart';
import 'package:headphone_shop/screens/order_screen/orders_screen.dart';
import 'package:headphone_shop/screens/product_manager_screen/product_manager_screen.dart';
import 'package:headphone_shop/screens/profile_screen/profile_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onTapTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  List<Widget> _children = [
    ListProductScreen(),
    CartScreen(),
    ProductManagerScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text('Welcome to the store', style: TextStyle(color: Color.fromRGBO(156, 157, 159, 1)),),
      ),
      body: _children[_currentIndex],
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 20,
                offset: Offset(0, 10),
              )
            ]),
        height: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  label: 'Order'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_pin,
                  ),
                  label: 'Setting'),
            ],
            onTap: _onTapTapped,
            selectedItemColor: Theme.of(context).primaryColor,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
