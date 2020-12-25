import 'package:ecommerce/widget/textfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class CustomerResgister extends StatefulWidget {
  @override
  _CustomerResgisterState createState() => _CustomerResgisterState();
}

class _CustomerResgisterState extends State<CustomerResgister> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144, height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translator.translate('mycustomer'),
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
                  mainAxisAlignment: translator.currentLanguage=='en'?MainAxisAlignment.end:MainAxisAlignment.end,

                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/usericon.svg',
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(15),
                        ),
                        Text(
                          translator.translate('mycustomer'),
                          textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,


                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Color(0xff959595),
                          ),
                        )
                      ],
                    ),
                    Text(
                      translator.translate('new_user_sub'),
                      textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,


                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xff959595),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
            TextFieldWidget(
              hint: translator.translate('user name'),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),

            TextFieldWidget(
              hint:  translator.translate('password'),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),

            TextFieldWidget(
              hint:  translator.translate('email'),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            TextFieldWidget(
              hint:  translator.translate('phone number'),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(48),
                width: ScreenUtil().setWidth(380),
                decoration: BoxDecoration(
                  color: Color(0xff88a53b),borderRadius: BorderRadius.circular(22.00),
                ),
                child:  Text(
                  translator.translate('register'),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color:Color(0xffffffff),
                  ),
                )
            ),






          ],
        ),
      ),
    );
  }
}
