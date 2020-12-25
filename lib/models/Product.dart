import 'package:flutter/material.dart';

class Product {
  String imageUrl;
  String productName;


  String price;
  String description;

  Product(
      {

        this.imageUrl,
        this.price,
        this.productName,
        this.description,
        });
}