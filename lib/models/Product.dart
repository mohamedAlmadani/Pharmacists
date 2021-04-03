import 'package:flutter/material.dart';

class Product {
  String imageUrl;
  String productName;


  String price;
  String description;
  String imageSlider;

  Product(
      {

        this.imageUrl,
        this.price,
        this.productName,
        this.description,
        this.imageSlider
        });
}