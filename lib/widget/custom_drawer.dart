import 'package:ecommerce/route/custom_route.gr.dart';
import 'package:ecommerce/utils/listdrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';
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
           trailing :
              OutlineButton(

                onPressed: () {
                  translator.setNewLanguage(
                    context,
                    newLanguage: translator.currentLanguage == 'ar' ? 'en':'ar',
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
                  context.rootNavigator.push(Routes.aboutTheApplication);
                },
                leading : Text(translator.translate('about the app')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Container(
              child: ListTile(
                onTap: () {
                  context.rootNavigator.push(Routes.correspondence);
                },
               leading : Text(translator.translate('messages')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Container(
              child: ListTile(
                onTap: () {
                  context.rootNavigator.push(Routes.termsAndConditions);
                },
                leading : Text(translator.translate('terms and conditions')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Container(
              // width: 90.w,
              // height: 75.h,
              child: ListTile(
                onTap: () {
                  context.rootNavigator.push(Routes.callUs);
                },
                leading : Text(translator.translate('contact us')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Spacer(),
            Row(
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
            )
          ]),
    );
  }
}
