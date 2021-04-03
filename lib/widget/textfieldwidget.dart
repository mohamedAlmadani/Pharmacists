import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class TextFieldWidget  extends StatelessWidget {
  String hint;
  Widget icon;
  Function saveFun;
  Function validateFun;
  TextFieldWidget ({@required this.hint, this.icon,this.saveFun,this.validateFun});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144, height: 683.4285714285714,
        allowFontScaling: true);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 4.w),

      height: ScreenUtil().setHeight(50),
      width: ScreenUtil().setHeight(380),

      child:


      TextFormField(
        onSaved: (value) {
          this.saveFun(value);
        },
        validator: (value) {
          this.validateFun(value);
        },
        // textAlign: translator.currentLanguage == 'en'
        //     ? TextAlign.left
        //     : TextAlign.right,
          // decoration: InputDecoration(
          //   border: InputBorder.none,
          //   hintText: hint,
          //
          // )
          //
        decoration: InputDecoration(
         labelText:this.hint,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            // borderSide: BorderSide(
            //   color: Colors.amber,
            //   style: BorderStyle.solid,
            // ),
          ),
        ),



      )



    );
  }
}
