import 'package:ecommerce/models/productlearn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/backend/pharmacist_provider.dart';

import 'product_detaild.dart';
class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Selector<Pharmacistprovider, List<Products>>(
        builder: (context, value, child) {
          return value.isEmpty?Center(child: CircularProgressIndicator(),):
            ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap:(){
                  Get.to(ProductDeatails(value[index]));
                } ,
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          value[index].imageUrl??'hhh',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        children: [
                          Text(value[index].name??''),
                          Text(value[index].price??''),
                           Text(value[index].description??''),


                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        selector: (x, y) {
          return y.products;
        },
      ),
    );
  }
}