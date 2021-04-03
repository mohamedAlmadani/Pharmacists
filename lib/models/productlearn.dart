import 'package:flutter/material.dart';
class Products{
  String name;
  String price;
  String description;
  bool isCall;
  bool isMessage;
  String marketId;
  String imageUrl;
  // String productId;
  Products(this.description, this.imageUrl, this.isCall, this.isMessage,
      this.marketId, this.name, this.price,);

  Products.fromMap(Map map){
    this.name = map['productName'];
    this.price = map['ProductPrice'];
    this.description = map['ProductDescription'];
    this.isCall = map['allowCalling'];
    this.isMessage = map['allowMessing'];
    this.imageUrl = map['imageUrl'];
    this.marketId = map['marketId'];
    // this.productId=map['productId'];

  }
}