import 'package:flutter/material.dart';
import 'package:headphone_shop/providers/products.dart';
import 'package:headphone_shop/screens/home_screen/home_widget/list_products.dart';
import 'package:provider/provider.dart';
class ListProductScreen extends StatefulWidget {
  @override
  _ListProductScreenState createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  var _isInit = true;
  var _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProduct().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading ? Center(child: CircularProgressIndicator(),): ListProducts();
  }
}
