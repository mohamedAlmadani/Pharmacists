import 'package:ecommerce/route/custom_route.gr.dart';
import 'package:ecommerce/utils/sextion_moceup.dart';
import 'package:ecommerce/widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translator.translate('sections'),
        ),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      drawer: CustomDraer(),
      body: Column(
        children: [
          SizedBox(
              height: ScreenUtil().setHeight(220),
              width: ScreenUtil().setWidth(600),
              child: Carousel(
                images: [
                  ExactAssetImage("assets/images/delivery.png"),
                  ExactAssetImage("assets/images/deliveryone.jpg"),
                ],
                dotSize: 4.0,
                dotSpacing: 15.0,
                indicatorBgPadding: 5.0,
                borderRadius: true,
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.w),
            color: Color(0xFFDAE0C8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  translator.translate('main sections'),
                  textAlign: translator.currentLanguage == 'en'
                      ? TextAlign.left
                      : TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Color(0xff000000),
                  ),

                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                context.rootNavigator.push(Routes.shops);


              },
              child: Container(
                color: Color(0xFFDAE0C8),
                // alignment: Alignment.center,

                child: ListView.builder(

                  itemCount: sections.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        alignment: Alignment.center,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 111.h,
                                  width: 191.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(sections[index].image),
                                        fit: BoxFit.cover),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0.00, 3.00),
                                        color:
                                            Color(0xff3b3b3b).withOpacity(0.10),
                                        blurRadius: 6,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.00),
                                      bottomRight: Radius.circular(10.00),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 111.h,
                                width: 191.w,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.00, 3.00),
                                      color: Color(0xff000000).withOpacity(0.16),
                                      blurRadius: 6,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.00),
                                    bottomLeft: Radius.circular(10.00),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  '${sections[index].name}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21,
                                      color: Colors.black87),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 75.h,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.rootNavigator.push(Routes.addAd);

        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff88A53B),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
