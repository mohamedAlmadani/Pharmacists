// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../Users/screen/About%20the%20application.dart';
import '../Users/screen/Correspondence.dart';
import '../Users/screen/Customer%20registration.dart';
import '../Users/screen/Product%20details.dart';
import '../Users/screen/Products.dart';
import '../Users/screen/Shops.dart';
import '../Users/screen/Store%20registration.dart';
import '../Users/screen/Terms%20and%20Conditions.dart';
import '../Users/screen/add%20ad.dart';
import '../Users/screen/call%20us.dart';
import '../Users/screen/main_page.dart';
import '../Users/screen/shopandclint.dart';
import '../main.dart';
import '../models/Product.dart';

class Routes {
  static const String splashscreen = '/';
  static const String clint = '/Clint';
  static const String storeRegister = '/store-register';
  static const String customerResgister = '/customer-resgister';
  static const String mainPage = '/main-page';
  static const String customProducts = '/custom-products';
  static const String productDetails = '/product-details';
  static const String aboutTheApplication = '/about-the-application';
  static const String callUs = '/call-us';
  static const String termsAndConditions = '/terms-and-conditions';
  static const String correspondence = '/Correspondence';
  static const String addAd = '/add-ad';
  static const String shops = '/Shops';
  static const all = <String>{
    splashscreen,
    clint,
    storeRegister,
    customerResgister,
    mainPage,
    customProducts,
    productDetails,
    aboutTheApplication,
    callUs,
    termsAndConditions,
    correspondence,
    addAd,
    shops,
  };
}

class CustomRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashscreen, page: Splashscreen),
    RouteDef(Routes.clint, page: Clint),
    RouteDef(Routes.storeRegister, page: StoreRegister),
    RouteDef(Routes.customerResgister, page: CustomerResgister),
    RouteDef(Routes.mainPage, page: MainPage),
    RouteDef(Routes.customProducts, page: CustomProducts),
    RouteDef(Routes.productDetails, page: ProductDetails),
    RouteDef(Routes.aboutTheApplication, page: AboutTheApplication),
    RouteDef(Routes.callUs, page: CallUs),
    RouteDef(Routes.termsAndConditions, page: TermsAndConditions),
    RouteDef(Routes.correspondence, page: Correspondence),
    RouteDef(Routes.addAd, page: AddAd),
    RouteDef(Routes.shops, page: Shops),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Splashscreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Splashscreen(),
        settings: data,
      );
    },
    Clint: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Clint(),
        settings: data,
      );
    },
    StoreRegister: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StoreRegister(),
        settings: data,
      );
    },
    CustomerResgister: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CustomerResgister(),
        settings: data,
      );
    },
    MainPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainPage(),
        settings: data,
      );
    },
    CustomProducts: (data) {
      final args = data.getArgs<CustomProductsArguments>(
        orElse: () => CustomProductsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CustomProducts(products: args.products),
        settings: data,
      );
    },
    ProductDetails: (data) {
      final args = data.getArgs<ProductDetailsArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductDetails(args.product),
        settings: data,
      );
    },
    AboutTheApplication: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AboutTheApplication(),
        settings: data,
      );
    },
    CallUs: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CallUs(),
        settings: data,
      );
    },
    TermsAndConditions: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TermsAndConditions(),
        settings: data,
      );
    },
    Correspondence: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Correspondence(),
        settings: data,
      );
    },
    AddAd: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddAd(),
        settings: data,
      );
    },
    Shops: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Shops(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CustomProducts arguments holder class
class CustomProductsArguments {
  final dynamic products;
  CustomProductsArguments({this.products});
}

/// ProductDetails arguments holder class
class ProductDetailsArguments {
  final Product product;
  ProductDetailsArguments({@required this.product});
}
