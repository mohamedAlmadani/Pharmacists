import 'package:ecommerce/Users/screen/pageLogin.dart';
import 'package:ecommerce/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ecommerce/Users/screen/Customer registration.dart';


class Clint extends StatefulWidget {
  @override
  _ClintState createState() => _ClintState();
}

class _ClintState extends State<Clint> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);

    return Scaffold(
        appBar: AppBar(
          title: Text(translator.translate('sign up')),
          centerTitle: true,
          backgroundColor: Color(0xff88a53b),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(30),
                    horizontal: ScreenUtil().setWidth(30)),
                child: Container(
                  child: Column(
                    textDirection: translator.currentLanguage == 'en'
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    mainAxisAlignment: translator.currentLanguage == 'en'
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(translator.translate('new_user'),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff4d4d4d),
                          ),
                          textAlign: translator.currentLanguage == 'en'
                              ? TextAlign.left
                              : TextAlign.right),
                      Text(translator.translate('new_user_sub'),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xff959595),
                          ),
                          textAlign: translator.currentLanguage == 'en'
                              ? TextAlign.left
                              : TextAlign.right),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(CustomerResgister(userType.mershant));
                },
                child: Container(
                  height: ScreenUtil().setHeight(150),
                  width: ScreenUtil().setHeight(150),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff8d8d8d).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    // crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/icon2.svg'),
                      new Text(
                        translator.translate('stores'),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: Color(0xff4d4d4d),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(70),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(CustomerResgister(userType.customer));
                  //context.rootNavigator.push(Routes.customerResgister,arguments: CustomerResgisterArguments(type: userType.customer));
                },
                child: Container(
                  height: ScreenUtil().setHeight(150),
                  width: ScreenUtil().setHeight(150),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff8d8d8d).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    // crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/iconuser.svg'),
                      Text(
                        translator.translate('customer'),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: Color(0xff4d4d4d),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(70),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(LoginPage());
                  // context.rootNavigator.push(Routes.customerResgister,arguments: CustomerResgisterArguments(type: userType.customer));
                },
                child: Container(
                  height: ScreenUtil().setHeight(150),
                  width: ScreenUtil().setHeight(150),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff8d8d8d).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    // crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/iconuser.svg'),
                      Text(
                        translator.translate('login'),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: Color(0xff4d4d4d),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
