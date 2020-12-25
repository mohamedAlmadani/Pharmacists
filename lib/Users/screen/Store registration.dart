import 'package:auto_route/auto_route.dart';

import 'package:ecommerce/route/custom_route.gr.dart';
import 'package:ecommerce/widget/textfieldwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class StoreRegister extends StatefulWidget {
  @override
  _StoreRegisterState createState() => _StoreRegisterState();
}

class _StoreRegisterState extends State<StoreRegister> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translator.translate('store registration'),
        ),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(5),
                  horizontal: ScreenUtil().setWidth(50)),
              child: Container(
                child: Column(
                  mainAxisAlignment: translator.currentLanguage == 'en'
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/shop.svg',
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(10),
                        ),
                        Text(
                          translator.translate('store registration'),
                          style: TextStyle(
                            //fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Color(0xff959595),
                          ),

                        )
                      ],
                    ),
                    Text(
                      translator.translate('new_user_sub'),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xff959595),
                      ),
                      textAlign: translator.currentLanguage == 'en'
                          ? TextAlign.left
                          : TextAlign.right,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
            TextFieldWidget(hint:   translator.translate('company Name'),),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            TextFieldWidget(hint:translator.translate('user name'),),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            TextFieldWidget(hint: translator.translate('password'),),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            TextFieldWidget(hint: translator.translate('email'),),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(5),
                  horizontal: ScreenUtil().setWidth(30)),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: translator.currentLanguage=='en'?MainAxisAlignment.end:MainAxisAlignment.start,
                children: [
                  Row(

                    children: [
                      SvgPicture.asset(
                        'assets/images/location.svg',
                        fit: BoxFit.cover,



                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(20),
                      ),
                      Text(
                          translator.translate('locate your store'),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff4d4d4d),
                        ),
                          textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,

                      )
                    ],
                  ),
                ],
              ),
            ),
            TextFieldWidget(hint:  translator.translate('phone number'),),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Directionality(
              textDirection: translator.currentLanguage =='en'?TextDirection.rtl:TextDirection.ltr,
              child: Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(48),
                width: ScreenUtil().setWidth(380),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    // width: 8,
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: ListTile(

                  trailing: Text(
                    translator.translate('raising the logo'),
                    textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,

                  ),
                  leading: Container(

                    alignment: Alignment.center,
                    height: 32.h,
                    width: 55.w,
                    child: Icon(Icons.photo_camera),
                    decoration: BoxDecoration(
                      color: Color(0xff789139),
                      border: Border.all(
                        width: 1.00,
                        color: Color(0xfff5f5f5),
                      ),
                      borderRadius: BorderRadius.circular(6.00),
                    ),

                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            TextFieldWidget(hint:  translator.translate('company activity'),),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            GestureDetector(
              onTap: () {
                context.rootNavigator.push(Routes.mainPage);
              },
              child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(48),
                  width: ScreenUtil().setWidth(380),
                  decoration: BoxDecoration(
                    color: Color(0xff88a53b),
                    borderRadius: BorderRadius.circular(22.00),
                  ),
                  child: Text(
                    translator.translate('register'),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Color(0xffffffff),
                    ),
                  )),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(60),
            ),
          ],
        ),
      ),
    );
  }
}
