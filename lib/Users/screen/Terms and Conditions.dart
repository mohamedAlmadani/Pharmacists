import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
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
                    translator.translate('terms and conditions'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color:Color(0xff839f3a),



                    ),
                      textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right




                    // textAlign: TextAlign.right,
                    // textDirection: TextDirection.rtl,

                  ),
                  SizedBox(height: 10.h,),
                  Column(
                    children: [
                      Text(
                        translator.translate('myterms'),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color:Colors.black87,
                            fontFamily: 'Raleway'

                        ),
                          textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right

                      ),



                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
