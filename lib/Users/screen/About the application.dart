import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';



class AboutTheApplication extends StatefulWidget {
  @override
  _AboutTheApplicationState createState() => _AboutTheApplicationState();
}

class _AboutTheApplicationState extends State<AboutTheApplication> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
        (translator.translate('about the app')),
        ),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/logolast.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
              //  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
              translator.translate('about the app'),
              textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,

              style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color:Color(0xff839f3a),



                    ),



                    // textAlign: TextAlign.right,
                    // textDirection: TextDirection.rtl,

                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    translator.translate('myabout the app'),
                      textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,

                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color:Colors.black87,
                      fontFamily: 'Raleway'

                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                    child: Row(
                       // mainAxisAlignment: translator.currentLanguage=='en'?MainAxisAlignment.end:MainAxisAlignment.start,

                      crossAxisAlignment: translator.currentLanguage=='en'?CrossAxisAlignment.end:CrossAxisAlignment.start,
                      children: [
                       Container(
                         child: Icon(Icons.phone,
                         color: Colors.white,
                         ),
                          height: 35.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            color: Color(0xff839f3a),
                            shape: BoxShape.circle,
                          ),
                        ),
                      SizedBox(width: 10.w,),
                      Container(
                        child: Icon(Icons.share,
                          color: Colors.white,
                        ),
                          height: 35.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            color: Color(0xff839f3a),
                            shape: BoxShape.circle,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
