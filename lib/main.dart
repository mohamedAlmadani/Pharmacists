import 'package:ecommerce/Users/screen/Correspondence.dart';
import 'package:ecommerce/Users/screen/Products.dart';
import 'package:ecommerce/Users/screen/Shops.dart';
import 'package:ecommerce/Users/screen/add%20ad.dart';
import 'package:ecommerce/Users/screen/main_page.dart';
import 'package:ecommerce/route/custom_route.gr.dart';
import 'package:ecommerce/utils/Product_moceup.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


import 'package:flutter/material.dart';

import 'Users/screen/About the application.dart';
import 'Users/screen/Product details.dart';
import 'Users/screen/Terms and Conditions.dart';
import 'Users/screen/call us.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(

    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['en', 'ar'],
    assetsDirectory: 'assets/langs/',
     // NOT YET TESTED
  );

  runApp(LocalizedApp(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      localizationsDelegates: translator.delegates,
      locale: translator.locale,
      supportedLocales: translator.locals(),

      builder: ExtendedNavigator.builder<CustomRouter>(
        router: CustomRouter(),

      ),


    );
  }
}

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60.h,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Image.asset(
                  'assets/images/logolast.png',
                  width: 350.w,
                  height: 350.h,

                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 60.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  translator.translate('skip'),


                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff88a53b),
                  ),
                    textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right

                ),

                GestureDetector(
                  onTap: () {
                    context.rootNavigator.push(Routes.clint);
                  },
                  child: Container(
                    child: Text(
                      translator.translate('register'),
                        textAlign: translator.currentLanguage =='en'?TextAlign.left:TextAlign.right,


                        style: TextStyle(
                          color: Colors.green,

                          fontSize: 20,
                          fontWeight: FontWeight.bold),

                    ),


                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
