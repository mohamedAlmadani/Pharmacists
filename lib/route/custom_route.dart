import 'package:ecommerce/Users/screen/About%20the%20application.dart';
import 'package:ecommerce/Users/screen/Correspondence.dart';
import 'package:ecommerce/Users/screen/Customer%20registration.dart';
import 'package:ecommerce/Users/screen/Product%20details.dart';
import 'package:ecommerce/Users/screen/Products.dart';
import 'package:ecommerce/Users/screen/Shops.dart';
import 'package:ecommerce/Users/screen/Store%20registration.dart';
import 'package:ecommerce/Users/screen/Terms%20and%20Conditions.dart';
import 'package:ecommerce/Users/screen/add%20ad.dart';
import 'package:ecommerce/Users/screen/call%20us.dart';
import 'package:ecommerce/Users/screen/main_page.dart';
import 'package:ecommerce/Users/screen/shopandclint.dart';
import 'package:ecommerce/main.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: Splashscreen, initial: true),
    MaterialRoute(page: Clint),
    MaterialRoute(page: StoreRegister),
    MaterialRoute(page: CustomerResgister),
    MaterialRoute(page: MainPage),
    MaterialRoute(page: CustomProducts),
    MaterialRoute(page: ProductDetails),
    MaterialRoute(page: AboutTheApplication),
    MaterialRoute(page: CallUs),
    MaterialRoute(page: TermsAndConditions),
    MaterialRoute(page: Correspondence),
    MaterialRoute(page: AddAd),
    MaterialRoute(page: Shops),




  ],
)
class $CustomRouter {}