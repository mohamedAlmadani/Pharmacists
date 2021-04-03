import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Users/screen/Products.dart';
import 'package:ecommerce/Users/screen/product_page.dart';
import 'package:ecommerce/backend/pharmacist_provider.dart';
import 'package:ecommerce/backend/server.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/models/sliderimage.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import 'package:ecommerce/models/market.dart';
import 'package:ecommerce/utils/shops_moceup.dart';
import 'package:ecommerce/widget/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class Shops extends StatefulWidget {
  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero).then((value) => getImageSlider());
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      endDrawer: CustomDraer(),
      appBar: AppBar(
        title: Text(
          translator.translate('sections'),
        ),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 250.h,
                width: double.infinity,
                child: Selector<Pharmacistprovider, List<String>>(
                  builder: (context, value, child) {
                    print(value.length);
                    return value.isEmpty
                        ?Column(
                      children: [
                        Expanded(child: Image.asset('assets/images/k.png',width: double.infinity,fit: BoxFit.cover,))
                      ],
                    )
                        : CarouselSlider.builder(

                            itemCount: value.length,
                            slideBuilder: (index) {
                              // DocumentSnapshot sliderimage =value[index]
                              return CachedNetworkImage(
                                imageUrl:  value[index],
                                  fit: BoxFit.cover,
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),


                              );
                            },
                            slideTransform: CubeTransform(rotationAngle: 0),
                             slideIndicator: CircularSlideIndicator(
                                 indicatorBackgroundColor: Colors.red,
                                 currentIndicatorColor: Colors.green),
                          );
                  },
                  selector: (x, y) {
                    return y.imageSlider;
                  },
                ),
              ),
              Consumer<Pharmacistprovider>(
                builder: (context, value, child) {
                  return value.markets.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.markets.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                Provider.of<Pharmacistprovider>(context,
                                        listen: false)
                                    .selectMarket = value.markets[index];
                                await GetAllMarketProductFromFirebase(
                                    value.markets[index].marketId);
                                Get.to(CustomProducts());
                              },
                              child: Container(
// width: 90.w,
                                height: 75.h,
                                child: ListTile(
                                  trailing: new Container(
                                    alignment: Alignment.center,
                                    height: 160.h,
                                    width: 95.w,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              value.markets[index].logoUrl ??
                                                  ''),
                                          fit: BoxFit.cover),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0.00, 3.00),
                                          color: Color(0xff3b3b3b)
                                              .withOpacity(0.10),
                                          blurRadius: 6,
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(22.00),
                                    ),
                                  ),
                                  leading: Icon(Icons.arrow_back_ios),
                                  title: Text(
                                    '${value.markets[index].userName}',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            );
                          });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Container(
// color: Color(0xFFDAE0C8),
//
//
// child: GestureDetector(
// onTap: (){
// context.rootNavigator.push(Routes.customProducts);
//
// },
// child: Container(
//
//
// margin: EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.w),
// child: ListView.separated(
// separatorBuilder: (context,index){
// if(index.isOdd){
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// margin: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
// height: 50.h,
// width: 50.w,
// color: Colors.white,
// child: Text('السادة الكرام، نود اعلامكم بتوفر بعض من اصناف ومنتجات شركة زاد الجمال بصيدلية السيد ',
// textAlign: TextAlign.right
// ),
//
//
//
//
// ),
// );
//
// }
// return Divider();
//
// },
//
//
// itemCount: shops.length,
// itemBuilder: (context, index) {
// return Container(
//
// // width: 90.w,
// height: 75.h,
// child: ListTile(
//
// trailing: new Container(
// alignment: Alignment.center,
// height: 160.h,
// width: 95.w,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage(shops[index].image),
// fit: BoxFit.cover
// ),
// boxShadow: [
// BoxShadow(
// offset: Offset(0.00,3.00),
// color: Color(0xff3b3b3b).withOpacity(0.10),
// blurRadius: 6,
// ),
// ], borderRadius: BorderRadius.circular(22.00),
// ),
// ),
//
// leading: Icon(Icons.arrow_back_ios),
// title:Text('${shops[index].name }',
// textDirection: TextDirection.rtl,
// textAlign: TextAlign.right,
//
//
// ),
//
// ),
// );
// }
//
// ),
//
// ),
// ),
// ),
