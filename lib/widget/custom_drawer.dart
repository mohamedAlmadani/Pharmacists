import 'package:ecommerce/Users/screen/About%20the%20application.dart';
import 'package:ecommerce/Users/screen/Terms%20and%20Conditions.dart';
import 'package:ecommerce/Users/screen/User_chat.dart';
import 'package:ecommerce/Users/screen/call%20us.dart';
import 'package:ecommerce/Users/screen/new_product_page.dart';
import 'package:ecommerce/backend/repository.dart';
import 'package:ecommerce/backend/server.dart';
import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/utils/listdrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class CustomDraer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Drawer(
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            SizedBox(
              height: 40.h,
            ),
            Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logolast.png'),
                ),
                shape: BoxShape.circle,
              ),
            ),
            // Container(
            //   // width: 90.w,
            //   // height: 75.h,
            //   child: ListTile(
            //
            //     trailing: Text('اللغة '),
            //     leading:
            //    OutlineButton(
            //         onPressed: () {
            //           translator.setNewLanguage(
            //             context,
            //             newLanguage: translator.currentLanguage == 'en' ? 'ar':'en',
            //             remember: true,
            //             restart: true,
            //           );
            //         },
            //         child: Text(translator.translate('buttonTitle')),
            //       ),
            //     )
            //   ),
            ListTile(
              leading: Text(translator.translate('language')),
              trailing: OutlineButton(
                onPressed: () {
                  translator.setNewLanguage(
                    context,
                    newLanguage:
                        translator.currentLanguage == 'ar' ? 'en' : 'ar',
                    remember: true,
                    restart: true,
                  );
                },
                child: Text(translator.translate('buttonTitle')),
              ),
            ),

            Container(
              // width: 90.w,
              // height: 75.h,
              child: ListTile(
                onTap: () {
                  Get.to(AboutTheApplication());
                },
                leading: Text(translator.translate('about the app')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Container(
              child: ListTile(
                onTap: () {
                  Get.to(UserPage());
                },
                leading: Text(translator.translate('messages')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Container(
              child: ListTile(
                onTap: () {
                  Get.to(TermsAndConditions());

                },
                leading: Text(translator.translate('terms and conditions')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Repository.repository.appUser.type == userType.mershant? Container(
              child: ListTile(
                onTap: () {
                  Get.to(NewProduct());

                },
                leading: Text(translator.translate('add Product')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ):Container(),
            Container(
              // width: 90.w,
              // height: 75.h,
              child: ListTile(
                onTap: () {
                Get.to(CallUs());
                },
                leading: Text(translator.translate('contact us')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                signOut();


              },
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    translator.translate('logout'),
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  SvgPicture.asset(

                    'assets/images/logout.svg',
                    height: 18.h,
                    width: 18.w,
                  ),
                ],
              ),
            )
          ]),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: Repository.repository.appUser.logoUrl!=null?
            CircleAvatar(
              backgroundImage: NetworkImage(Repository.repository.appUser.logoUrl),
            )
                :CircleAvatar(
              child: Text(Repository.repository.appUser.userName[0].toUpperCase()),
            )
            ,
            accountEmail: Text(Repository.repository.appUser.email),
            accountName: Text(Repository.repository.appUser.userName),
          ),
          Repository.repository.appUser.type == userType.mershant
              ? ListTile(
                  title: Text('Add product'),
            onTap: (){
             Get.to(NewProduct());
            },
                )
              : ListTile(
                  title: Text('Send Message'),
                ),
          ListTile(
            title: Text('LOGOUT'),
            onTap: (){
              signOut();
            },
          ),
        ],
      ),
    );
  }
}
