import 'dart:io';

import 'package:ecommerce/Users/screen/Shops.dart';
import 'package:ecommerce/backend/pharmacist_provider.dart';
import 'package:ecommerce/backend/server.dart';
import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/widget/textfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CustomerResgister extends StatefulWidget {
  userType type;
  CustomerResgister(this.type);
  String companyName;

  String userName;

  String email;
  String userId;

  String password;

  String mobileNumber;

  File logo;

  String logoUrl;

  String companyActivity;

  saveCompanyName(String value) {
    this.companyName = value;
  }

  saveUserName(String value) {
    this.userName = value;
  }

  saveEmail(String value) {
    this.email = value;
  }

  savepassword(String value) {
    this.password = value;
  }

  saveMobileNum(String value) {
    this.mobileNumber = value;
  }

  saveLogo(File value) {
    this.logo = value;
  }

  saveCompanyActivity(String value) {
    this.companyActivity = value;
  }

  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }


  @override
  _CustomerResgisterState createState() => _CustomerResgisterState();
}

class _CustomerResgisterState extends State<CustomerResgister> {

   GlobalKey<FormState> formKey = GlobalKey();

  saveForm(){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      AppUser appUser =widget.type ==userType.mershant?AppUser.mershantUser({
        'companyActivity' :this.widget.companyActivity,
        "userId":"",
        'userName':this.widget.userName,
        'email': this.widget.email,
        'password':this.widget.password,
        'mobileNumber':this.widget.mobileNumber,
        'compnayName': this.widget.companyName,

      })
          :AppUser.customerUser({
        'companyActivity' :this.widget.companyActivity,
        'userName':this.widget.userName,
        'email': this.widget.email,
        "userId":"",
        'password':this.widget.password,
        'mobileNumber':this.widget.mobileNumber,


      });
      saveUserInFirebase(appUser);
      Logger().e(appUser);
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
    return Scaffold(
      appBar: AppBar(
        title: this.widget.type == userType.customer
            ? Text(
                translator.translate('mycustomer'),
              )
            : Text(
                translator.translate('store registration'),
              ),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      body: Column(
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
                mainAxisAlignment: translator.currentLanguage == 'en'
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      this.widget.type == userType.customer
                          ? SvgPicture.asset(
                              'assets/images/usericon.svg',
                              fit: BoxFit.cover,
                            )
                          : SvgPicture.asset(
                              'assets/images/shop.svg',
                              fit: BoxFit.cover,
                            ),
                      SizedBox(
                        width: ScreenUtil().setWidth(15),
                      ),
                      this.widget.type == userType.customer
                          ? Text(
                              translator.translate('mycustomer'),
                              textAlign: translator.currentLanguage == 'en'
                                  ? TextAlign.left
                                  : TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Color(0xff959595),
                              ),
                            )
                          : Text(
                              translator.translate('store registration'),
                              style: TextStyle(
                                //fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Color(0xff959595),
                              ),
                            )
                    ],
                  ),
                  this.widget.type == userType.customer
                      ? Text(
                          translator.translate('new_user_sub'),
                          textAlign: translator.currentLanguage == 'en'
                              ? TextAlign.left
                              : TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff959595),
                          ),
                        )
                      : Text(
                          translator.translate('new_user_sub'),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff959595),
                          ),
                          textAlign: translator.currentLanguage == 'en'
                              ? TextAlign.left
                              : TextAlign.right,
                        ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),
          Form(
              key: formKey,
              child: Expanded(
                child: ListView(
                  children: [
                    TextFieldWidget (
                     hint: translator.translate('user name'),
                      saveFun: widget.saveUserName,
                      validateFun: widget.nullValidator,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),

                    TextFieldWidget(
                      hint: translator.translate('password'),
                      saveFun:widget.savepassword,
                      validateFun: widget.nullValidator,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    TextFieldWidget(
                      hint: translator.translate('email'),
                      saveFun: widget.saveEmail,
                      validateFun: widget.nullValidator,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    TextFieldWidget(
                      hint: translator.translate('phone number'),
                      saveFun: widget.saveMobileNum,
                      validateFun: widget.nullValidator,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    this.widget.type == userType.mershant
                        ? TextFieldWidget(
                            saveFun: widget.saveCompanyName,
                            validateFun: widget.nullValidator,
                            hint: translator.translate('company Name'),
                          )
                        : Container(),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    this.widget.type == userType.mershant
                        ? Container(

                          alignment: Alignment.center,
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(380),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              // width: 8,
                            ),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: ListTile(
                            trailing: Text(
                              translator.translate('raising the logo'),
                              textAlign: translator.currentLanguage == 'en'
                                  ? TextAlign.left
                                  : TextAlign.right,
                            ),
                            leading:   Selector<Pharmacistprovider,File>(
                              builder: (context, value, child) {
                                return  GestureDetector(
                                  onTap: () async {
                                    PickedFile pickedFile = await ImagePicker()
                                        .getImage(source: ImageSource.gallery);
                                 File file =File(pickedFile.path);
                                    Provider.of<Pharmacistprovider>(context,listen: false).setFile(file);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 32.h,
                                    width: 55.w,
                                    child: Icon(Icons.photo_camera),
                                    decoration: BoxDecoration(
                                      color: Color(0xff789139),
                                      border: Border.all(
                                        width: 1.00,
                                        color: Color(0xfff5f5f5),
                                      ),
                                      borderRadius: BorderRadius.circular(6.00),
                                    ),
                                  ),
                                );
                              },
                              selector: (x, y) {
                                return y.file;

                              },
                            )



                          ),
                        )
                        : Container(),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    this.widget.type == userType.mershant
                        ? TextFieldWidget(
                            saveFun: widget.saveCompanyActivity,
                            validateFun: widget.nullValidator,
                            hint: translator.translate('company activity'),
                          )
                        : Container(),
                    SizedBox(
                      height: ScreenUtil().setHeight(25),
                    ),
                    GestureDetector(
                      onTap: ()  {
                       saveForm();
                      // Get.to(Shops());
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
                            translator.translate('register'),
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
              ))
        ],
      ),
    );
  }
}
