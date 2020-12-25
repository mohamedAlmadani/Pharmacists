import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AddAd extends StatefulWidget {
  @override
  _AddAdState createState() => _AddAdState();
}

class _AddAdState extends State<AddAd> {
  bool isAccepted = false;
  bool isAccepted1 = false;
  bool isAccepted2 = false;
  bool isAccepted3 = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translator.translate('addAd'),
        ),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 30.h),
                      child: TextFormField(
                          textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,

                          decoration: InputDecoration(
                          labelText: translator.translate('product name'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                   // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: translator.currentLanguage=='en'?MainAxisAlignment.end:MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              // width: 8,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Text(translator.translate('raise the picture'),
                              textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,

                            ),
                            trailing: Container(
                              height: 38.h,
                              width: 62.w,
                              child: SvgPicture.asset(
                                'assets/images/upload.svg',
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff789139),
                                border: Border.all(
                                  width: 1.00,
                                  color: Color(0xfff5f5f5),
                                ),
                                borderRadius: BorderRadius.circular(6.00),
                              ),
                            ),
                            title: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          translator.translate('note'),
                          textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,

                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 30.h),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText:  translator.translate('price'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 30.h),
                      child: TextFormField(
                        maxLines: 12,
                        decoration: InputDecoration(
                          hintText:  translator.translate('description'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          translator.translate('advertising settings'),
                      textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,

                      style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(translator.translate('allow internal messages'),
                            style: TextStyle(
                              color:Color(0xff888787),
                              fontWeight: FontWeight.w800,
                            ),
                              textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,

                            ),
                            Spacer(),
                           Checkbox(
                              value:isAccepted ,
                              onChanged: (value){
                                this.isAccepted=value;
                                setState(() {

                                });

                              },
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Text(translator.translate('without phone'),
                              style: TextStyle(
                                color:Color(0xff888787),
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,

                            ),
                            Spacer(),
                            Checkbox(
                              value:isAccepted1 ,
                              onChanged: (value){
                                this.isAccepted1=value;
                                setState(() {

                                });

                              },
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Text(translator.translate('allow non-hassle'),
                              textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,

                              style: TextStyle(
                                color:Color(0xff888787),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Spacer(),
                            Checkbox(
                              value:isAccepted2 ,
                              onChanged: (value){
                                this.isAccepted2=value;
                                setState(() {

                                });

                              },
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Text(translator.translate('automatic reposting'),
                              style: TextStyle(
                                color:Color(0xff888787),
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,

                            ),
                            Spacer(),
                            Checkbox(
                              value:isAccepted3 ,
                              onChanged: (value){
                                this.isAccepted3=value;
                                setState(() {

                                });

                              },
                            ),

                          ],
                        ),
                        SizedBox(height: 30.h,),
                        Container(
                          alignment: Alignment.center,
                          child: Text(translator.translate('add'),
                            style: TextStyle(
                              color:Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          height: 50.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(12)
                          ),

                        ),


                      ],
                    ),
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
