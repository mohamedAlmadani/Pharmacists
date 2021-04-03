
import 'package:ecommerce/widget/textfieldwidget.dart';
import 'package:ecommerce/widget/widget_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ecommerce/backend/server.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class CallUs extends StatefulWidget {
  @override
  _CallUsState createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> {
  String Email;
  String phoneNumber;
  String addressComplaint;
  String Content;
  GlobalKey<FormState> callFormKey = GlobalKey();

  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }
  setEmail(String value) {
    this.Email = value;
  }
  setphoneNumber(String value) {
    this.phoneNumber = value;
  }
  setaddressComplaint(String value) {
    this.addressComplaint = value;
  }
  setContent(String value) {
    this.Content = value;
  }
  saveForm() {
    if (callFormKey.currentState.validate()) {
      callFormKey.currentState.save();
      Map map={
        'Email': this.Email,
        'phoneNumber': this.phoneNumber,
        'addressComplaint': this.addressComplaint,
        'Content':this.Content


      };
      addContactUs(map);
    } else{}
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144, height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translator.translate('contact us'),
        ),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Form(
                  key: callFormKey,
                  child: Column(
                    children: [
                      WidgetContact(hint: 'Email',saveFun: setEmail,validationFun: nullValidator,),
                      WidgetContact(hint: 'Phone number',validationFun: nullValidator,saveFun: setphoneNumber,),
                      WidgetContact(hint: 'The address of the complaint',validationFun: nullValidator,saveFun: setaddressComplaint,),
                      WidgetContact(hint: 'Content',a: 20,validationFun: nullValidator,saveFun: setContent,),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: () {
                          saveForm();
                          Get.back();
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
                              translator.translate('send'),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
