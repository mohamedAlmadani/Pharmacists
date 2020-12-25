import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/route/custom_route.gr.dart';
import 'package:ecommerce/utils/shops_moceup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


class Shops extends StatefulWidget {

  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
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

      body: Container(
        color: Color(0xFFDAE0C8),


        child: GestureDetector(
           onTap: (){
             context.rootNavigator.push(Routes.customProducts);

           },
          child: Container(


            margin: EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.w),
            child: ListView.separated(
                separatorBuilder: (context,index){
                  if(index.isOdd){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
                        height: 50.h,
                        width: 50.w,
                        color: Colors.white,
                        child: Text('السادة الكرام، نود اعلامكم بتوفر بعض من اصناف ومنتجات شركة زاد الجمال بصيدلية السيد ',
                            textAlign: TextAlign.right
                        ),




                      ),
                    );

                  }
                  return Divider();

                },


                itemCount: shops.length,
                itemBuilder: (context, index) {
                  return Container(

                   // width: 90.w,
                    height: 75.h,
                    child: ListTile(

                      trailing: new Container(
                        alignment: Alignment.center,
                        height: 160.h,
                        width: 95.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(shops[index].image),
                            fit: BoxFit.cover
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.00,3.00),
                              color: Color(0xff3b3b3b).withOpacity(0.10),
                              blurRadius: 6,
                            ),
                          ], borderRadius: BorderRadius.circular(22.00),
                        ),
                      ),

                      leading: Icon(Icons.arrow_back_ios),
                      title:Text('${shops[index].name }',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,


                      ),

                    ),
                  );
                }

                ),

          ),
        ),
      ),
    );
  }
}
