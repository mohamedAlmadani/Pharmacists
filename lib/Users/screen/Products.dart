import 'package:ecommerce/Users/screen/Product%20details.dart';
import 'package:ecommerce/Users/screen/product_detaild.dart';
import 'package:ecommerce/backend/pharmacist_provider.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/models/productlearn.dart';
import 'package:ecommerce/utils/Product_moceup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomProducts extends StatefulWidget {
  List<Product> products;

  CustomProducts({products});

  @override
  _CustomProductsState createState() => _CustomProductsState();
}

class _CustomProductsState extends State<CustomProducts> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المنتجات",
        ),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      body: Selector<Pharmacistprovider, List<Products>>(
        builder: (context, value, child) {
          return value.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(ProductDeatails(value[index]));
                          },
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 5.h),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  verticalDirection: VerticalDirection.down,
                                  children: [
                                    new Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.w),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              value[index].imageUrl,
                                            ),
                                            fit: BoxFit.cover,
                                          )),
                                      height: 125.h,
                                      width: 125.w,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${value[index].name}',
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${value[index].price}',
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.ssp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 75.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                );
        },
        selector: (x, y) {
          return y.products;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Color(0xff88A53B),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Container(
// child: GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// childAspectRatio: 1,
// mainAxisSpacing: 4,
// crossAxisSpacing: 4,
// ),
// itemCount: products.length,
// itemBuilder: (context, index) {
// return GestureDetector(
// onTap: () {
// ExtendedNavigator.of(context).push(Routes.productDetails,
// arguments:
// ProductDetailsArguments(product: products[index]));
// },
// child: Card(
// margin:
// EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
// elevation: 10,
// child: Container(
// margin:
// EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
// child: SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// mainAxisSize: MainAxisSize.min,
// verticalDirection: VerticalDirection.down,
// children: [
// new Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10.w),
// image: DecorationImage(
// image: AssetImage(
// products[index].imageUrl,
// ),
// fit: BoxFit.cover,
// )),
// height: 125.h,
// width: 125.w,
// ),
// Directionality(
// textDirection: TextDirection.rtl,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// '${products[index].productName}',
// style: TextStyle(
// color: Colors.black87,
// fontWeight: FontWeight.bold),
// ),
// Text(
// '${products[index].price}',
// style: TextStyle(
// color: Colors.blueAccent,
// fontSize: 18.ssp),
// ),
// ],
// ),
// ),
// SizedBox(
// height: 75.h,
// )
// ],
// ),
// ),
// ),
// ),
// );
// }),
// ),
