import 'package:flutter/material.dart';
import 'package:headphone_shop/screens/product_manager_screen/product_manager_screen.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: (){
          Navigator.of(context).pushNamed(ProductManagerScreen.routeName);
        },
        child: Text('Edit'),
      ),
    );
  }
}
