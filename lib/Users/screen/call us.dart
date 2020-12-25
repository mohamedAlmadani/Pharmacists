import 'package:ecommerce/widget/textfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class CallUs extends StatefulWidget {
  @override
  _CallUsState createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144, height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translator.translate('terms and conditions'),
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
            TextFieldWidget(hint:  translator.translate('email'),),
            SizedBox(height: 10.h,),
            TextFieldWidget(hint: translator.translate('phone number'),),
            SizedBox(height: 10.h,),

            TextFieldWidget(hint:translator.translate('phone number'),),
            SizedBox(height: 10.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),

                  child: Text(translator.translate('text content'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color:Color(0xff839f3a),



                    ),
                      textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right


                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.w),

                    padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 4.w),
                    height: 300.h,
                    width: 300.w,

                    child:


                    TextFormField(
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,

                      textAlign: TextAlign.right,
                      // decoration: InputDecoration(
                      //   border: InputBorder.none,
                      //   hintText: hint,
                      //
                      // )
                      //
                      decoration: InputDecoration(


                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),



                    )



                ),
              ],
            ),
            SizedBox(height: 20.h,),

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
            SizedBox(height: 30.h,),











          ],
        ),
      ),
    );
  }
}
