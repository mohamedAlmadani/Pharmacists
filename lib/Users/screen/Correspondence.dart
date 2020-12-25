import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Correspondence extends StatefulWidget {
  @override
  _CorrespondenceState createState() => _CorrespondenceState();
}

class _CorrespondenceState extends State<Correspondence> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translator.translate('messages'),
        ),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            child: ListTile(
                trailing: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/people.png',
                      width: 100.w,
                      height: 100.h,
                    )),
                leading: new Container(
                  alignment: Alignment.centerRight,
                  height: 50.h,
                  width: 209.40.w,
                  decoration: BoxDecoration(
                    color: Color(0xfff7f8f9),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 1.00),
                        color: Color(0xff000000).withOpacity(0.08),
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50.00),
                  ),
                  child: Text('بارك الله فيك معتصم'),
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            child: ListTile(
                leading: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/peopletwo.jpg',
                      width: 100.w,
                      height: 100.h,
                    )),
                trailing: new Container(
                  alignment: Alignment.center,
                  height: 50.h,
                  width: 209.40.w,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 1.00),
                        color: Color(0xff000000).withOpacity(0.08),
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50.00),
                  ),
                  child: Text('هل انتهيت من برمجة الموقع ؟'),
                )),
          ),
          Spacer(),
          Transform.translate(
            offset: Offset(10.w,1.h),

            child: Container(

              child: ListTile(
                trailing: Container(
                  height: 56.00.h,
                  width: 77.00.w,
                  color: Color(0xff88a53b),
                  child: Icon(Icons.send),
                ),
                leading: SvgPicture.asset('assets/images/smiling.svg'),
                title: TextFormField(
                  decoration: InputDecoration(hintText: 'قم بكتابت رسالتك هنا'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
