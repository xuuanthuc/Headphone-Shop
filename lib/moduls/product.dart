import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String title;
  final String from;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    @required this.id,
    @required this.title,
    @required this.from,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
  });
}
