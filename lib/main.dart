
import 'package:ecommerce/Users/screen/Shops.dart';

import 'package:ecommerce/Users/screen/shopandclint.dart';
import 'package:ecommerce/backend/SPHelper.dart';
import 'package:ecommerce/backend/server.dart';
import 'package:ecommerce/models/user.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Users/screen/About the application.dart';
import 'Users/screen/Product details.dart';
import 'Users/screen/Terms and Conditions.dart';
import 'Users/screen/call us.dart';
import 'backend/pharmacist_provider.dart';
import 'package:ecommerce/backend/appGet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SPHelper.spHelper.initSharedPreferences();
  Get.put(AppGet());
  await Firebase.initializeApp();
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
    return ChangeNotifierProvider<Pharmacistprovider>(
      create: (context){
        return Pharmacistprovider();
      },

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ecommerce',
          localizationsDelegates: translator.delegates,
          locale: translator.locale,
          supportedLocales: translator.locals(),
          home:Splashscreen() ,

        ),
      ),
    );
  }
}

class Splashscreen extends StatefulWidget {

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String userId;
  AppUser appUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splachMethods();


    appUser=SPHelper.spHelper.getUser();
    appGet.appUser=appUser;
    userId= getUserId();
    if(userId!=null){
      fetchSplachData();

    }
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) => {
      userId ==null?Get.off(Clint()):Get.off(Shops())
    });
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140.h,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logoph.jpg',
                  width: 250.w,
                  height: 250.h,
                  fit: BoxFit.cover,

                ),
              ),
            ),
            // SizedBox(
            //   height: 60.h,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text(translator.translate('skip'),
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //           color: Color(0xff88a53b),
            //         ),
            //         textAlign: translator.currentLanguage == 'en'
            //             ? TextAlign.left
            //             : TextAlign.right),
            //     GestureDetector(
            //       onTap: () {
            //         Get.to(Clint());
            //
            //       },
            //       child: Container(
            //         child: Text(
            //           translator.translate('register'),
            //           textAlign: translator.currentLanguage == 'en'
            //               ? TextAlign.left
            //               : TextAlign.right,
            //           style: TextStyle(
            //               color: Colors.green,
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

