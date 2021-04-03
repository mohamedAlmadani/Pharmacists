import 'dart:io';

import 'package:ecommerce/models/market.dart';
import 'package:ecommerce/models/productlearn.dart';
import 'package:ecommerce/models/sliderimage.dart';
import 'package:ecommerce/models/user.dart';
import 'package:flutter/material.dart';

class Pharmacistprovider extends ChangeNotifier {
  Market selectMarket;
  AppUser appUser;
  List<String> imageSlider = [];

  setImageSlider( List<String> imageSlider ){
    this.imageSlider = imageSlider;
    notifyListeners();
  }
  setAppUser(AppUser appUser) {
    this.appUser = appUser;
    notifyListeners();
  }

  bool isCallAllowed = false;
  bool isMessagesAllowed = false;
  changeCallAllowed() {
    this.isCallAllowed = !this.isCallAllowed;
    notifyListeners();
  }

  changeisMessagesAllowed() {
    this.isMessagesAllowed = !this.isMessagesAllowed;
    notifyListeners();
  }

  File file;
  setFile(File file) {
    this.file = file;
    notifyListeners();
  }
  File fileslider;
  setFileslider(File fileslider) {
    this.fileslider = fileslider;
    notifyListeners();
  }

  List<Market> markets = [];
  List<Products> products = [];
  List<SliderImage> sliderImages=[];
  serSliderImage(List<SliderImage>  value){
    this.sliderImages=value;
    notifyListeners();

  }
  setMarket(List<Market> value) {
    this.markets = value;
    notifyListeners();
  }
  setProduct(List<Products> value) {
    this.products = value;
    notifyListeners();
  }
  int productBottomIndex =0;
  changeIndex(int value){
    this.productBottomIndex=value;
    notifyListeners();
  }
}
