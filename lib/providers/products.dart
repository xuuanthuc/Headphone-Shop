import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:headphone_shop/moduls/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   from: 'USA',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //   'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Red Shirt',
    //   from: 'Viet Nam',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //   'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Red Shirt',
    //   from: 'China',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //   'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'Red Shirt',
    //   from: 'Japan',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //   'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p5',
    //   title: 'Red Shirt',
    //   from: 'Japan',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //   'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p6',
    //   title: 'Red Shirt',
    //   from: 'Japan',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //   'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p7',
    //   title: 'Red Shirt',
    //   from: 'Japan',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //   'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p8',
    //   title: 'Red Shirt',
    //   from: 'Japan',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //   'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addProducts(Product product) async {
    final url = 'https://headphone-shop-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.post(url, body: json.encode({
        'title': product.title,
        'description': product.description,
        'price': product.price,
        'from': product.from,
        'imageUrl': product.imageUrl,
      }));
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        from: product.from,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
    }
  }
  Future<void> fetchAndSetProduct() async{
    var url = 'https://headphone-shop-default-rtdb.firebaseio.com/products.json';
    try{
      final response = await http.get(url);
      if(response.statusCode == 200){
        Map<String, dynamic> _mapData = jsonDecode(response.body);

        final List<Product> loadedProduct = [];
        _mapData.forEach((pordId, pordData) {//duyet phan tu theo id la name va gia tri tra ve ben trong do gan vao pordData
          loadedProduct.add(Product(
            id: pordId,
            title: pordData['title'],
            from: pordData['from'],
            description: pordData['description'],
            price: pordData['price'],
            imageUrl: pordData['imageUrl'],
          ));
        });
        _items = loadedProduct;
        notifyListeners();
      }
    }catch(error){}
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((element) => element.id == id); //prodIndex lay gia tri product co id moi trung voi id cu
    if (prodIndex >= 0) {
      final url = 'https://headphone-shop-default-rtdb.firebaseio.com/products/$id.json?';
      await http.patch(url, body: json.encode({
        'title': newProduct.title,
        'description': newProduct.description,
        'from': newProduct.from,
        'price': newProduct.price,
        'imageUrl': newProduct.imageUrl,
      }));
      _items[prodIndex] = newProduct; //tao product moi nhan gia tri tu prodindex o tren
      notifyListeners();
    } else {
      print('.heelo..');
    }
  }

  void deleteProduct(String id) {
      final url = 'https://headphone-shop-default-rtdb.firebaseio.com/products/$id.json?';
    http.delete(url);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}