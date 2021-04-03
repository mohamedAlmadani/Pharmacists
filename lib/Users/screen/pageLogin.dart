import 'package:ecommerce/backend/server.dart';
import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/widget/textfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


class LoginPage extends StatelessWidget {
  userType type;

  String email;
  String password;
  saveEmail(String value) {
    this.email = value;
  }

  savepassword(String value) {
    this.password = value;
  }

  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }

  GlobalKey<FormState> loginKey = GlobalKey();
  saveForm() {
    if (loginKey.currentState.validate()) {
      loginKey.currentState.save();

      signInUsingEmailAndPassword(this.email, this.password);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff88a53b),
          centerTitle: true,
        title: Text(
          translator.translate('login'),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Color(0xffffffff),
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(
              height: ScreenUtil().setHeight(140),
            ),
            Form(
              key: loginKey,
             child: Container(
               child: Column(
                 children: [
                   TextFieldWidget(
                     hint: 'Email',
                     saveFun: saveEmail,
                     validateFun: nullValidator,
                   ),
                   SizedBox(
                     height: ScreenUtil().setHeight(20),
                   ),
                   TextFieldWidget(

                     hint: 'Password',
                     saveFun: savepassword,
                     validateFun: nullValidator,
                   ),
                 ],
               ),
             ),

            ),
            SizedBox(
              height: ScreenUtil().setHeight(80),
            ),
            GestureDetector(
              onTap: ()  async{
                await saveForm();
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
                    translator.translate('login'),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Color(0xffffffff),
                    ),
                  )),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(40),
            ),

          ],
        ),
      ),
    );
  }
}