import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Users/screen/Shops.dart';
import 'package:ecommerce/Users/screen/mainPage.dart';
import 'package:ecommerce/Users/screen/pageLogin.dart';
import 'package:ecommerce/Users/screen/shopandclint.dart';
import 'package:ecommerce/backend/SPHelper.dart';
import 'package:ecommerce/backend/appGet.dart';
import 'package:ecommerce/backend/pharmacist_provider.dart';
import 'package:ecommerce/backend/repository.dart';
import 'package:ecommerce/models/MessageModel.dart';
import 'package:ecommerce/models/market.dart';
import 'package:ecommerce/models/productlearn.dart';
import 'package:ecommerce/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_route/auto_route.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;
Logger logger = Logger();
final String collectionName = 'users';
String chatCollectionName = 'chats';
String messageCollectionName = 'messages';
String usersCollectionName = 'users';
AppGet appGet = Get.find();
Future<String> registerUsingEmailAndPassword(
    String email, String password) async {
  UserCredential userCredential = await firebaseAuth
      .createUserWithEmailAndPassword(email: email, password: password);
  return userCredential.user.uid;
}

Future<String> signInUsingEmailAndPassword(
    String email, String password) async {
  UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password);
  DocumentSnapshot documentSnapshot = await firestore
      .collection(collectionName)
      .doc(userCredential.user.uid)
      .get();
  Map map = documentSnapshot.data();
  map['userId'] = documentSnapshot.id;

  AppUser appUser = AppUser.newUser(map);
  Repository.repository.appUser = appUser;
  appUser.userId = userCredential.user.uid;
  Get.to(Shops());

  // Get.context.rootNavigator.push(Routes.mainPage);
}

String getUserId() {
  String userId =
      firebaseAuth.currentUser != null ? firebaseAuth.currentUser.uid : null;
  return userId;
}

signOut() async {
  await firebaseAuth.signOut();
  SPHelper.spHelper.clearData();
  Get.off(Clint());
}

saveUserInFirebase(AppUser appUser) async {
  try {
    String userId =
        await registerUsingEmailAndPassword(appUser.email, appUser.password);
    Logger().d("userId :$userId");
    print("userId :$userId");
    Map map = appUser.toJson();
    map['userId'] = userId;
    map.remove('password');
    SPHelper.spHelper.saveUser(appUser);

    bool isMershant = appUser.type == userType.mershant;
    if (isMershant) {
      map['logoUrl'] = await uploadImage(
          Provider.of<Pharmacistprovider>(Get.context, listen: false).file);
      appUser.logoUrl = map['logoUrl'];
    }

    await firestore.collection(collectionName).doc(userId).set(map);

    Repository.repository.appUser = appUser;

    appGet.setUserModel(appUser);

    Get.to(Shops());

    // Get.context.rootNavigator.push(Routes.mainPage);
  } on Exception catch (e) {
    logger.e(e.toString());
  }
}

splachMethods() {
  getAlUsers();

}

Future<AppUser> getUserFromFirebase() async {
  String userId = getUserId();
  DocumentSnapshot documentSnapshot =
      await firestore.collection(collectionName).doc(userId).get();
  Map map = documentSnapshot.data();
  map['userId'] = userId;
  AppUser appUser = AppUser.newUser(map);
  SPHelper.spHelper.saveUser(appUser);
  Repository.repository.appUser = appUser;

  appGet.setUserModel(appUser);

  return appUser;
}

getUserFromSp() {
  AppUser appUser = SPHelper.spHelper.getUser();
  appGet.setUserModel(appUser);
}

Future<String> uploadImage(File file, [bool isProductImage = false]) async {
  String fileName = file.path.split('/').last;
  String folderName = isProductImage ? 'productImag' : 'logos';
  Reference reference = storage.ref('$folderName/$fileName');
  await reference.putFile(file);
  String imageUrl = await reference.getDownloadURL();
  return imageUrl;
}

fetchSplachData() async {
  GetAllMarkets();

  AppUser appUser = await getUserFromFirebase();
  Repository.repository.appUser = appUser;
}

addNewProduct(Map map) async {
  String productImageUrl = await uploadImage(map['file'], true);
  map.remove('file');
  map['imageUrl'] = productImageUrl;
  await firestore
      .collection('Producs')
      .doc(Repository.repository.appUser.userId)
      .collection('MarketProduct')
      .add({...map});
  Get.back();
}

GetAllMarkets() async {
  QuerySnapshot querySnapshot = await firestore
      .collection(collectionName)
      .where('isMershant', isEqualTo: true)
      .get();
  List<Market> markets = querySnapshot.docs.map((e) {
    Map map = e.data();
    map['marketId'] = e.id;
    return Market.fromMap(map);
  }).toList();
  Provider.of<Pharmacistprovider>(Get.context, listen: false)
      .setMarket(markets);
}

GetAllMarketProductFromFirebase(String marketId) async {
  QuerySnapshot querySnapshot = await firestore
      .collection('Producs')
      .doc(marketId)
      .collection('MarketProduct')
      .get();
  List<Products> products = querySnapshot.docs.map((e) {
    Map map = e.data();
    map['productId'] = e.data();
    return Products.fromMap(map);
  }).toList();
  Provider.of<Pharmacistprovider>(Get.context, listen: false)
      .setProduct(products);
}

repotProduct(String marketId, String userId, String repotResson) async {
  await firestore
      .collection('Reports')
      .doc(marketId)
      .collection(collectionName)
      .doc(userId)
      .set({'reportrRasen': repotResson});
}

addContactUs(Map map) async {
  CollectionReference collectionReference =
      await firestore.collection('ContactUs');
  collectionReference.add({...map});
//  Get.to(NewsPage());
}

Future<String> createChat(List<String> usersIds) async {
  String chatId = usersIds.reduce((value, element) {
    print(value);
    print(element);
    Logger().d("value: $value  element $element");
    return (value + element);
  });
  //String chatId1 = ""
  // var _uuid = Uuid().v4() ;

  await firestore
      .collection(chatCollectionName)
      .doc(chatId)
      .set({'users': usersIds});
  return chatId;
}

createMessage(MessageMode message) async {
  firestore
      .collection(chatCollectionName)
      .doc(message.chatId)
      .collection(messageCollectionName)
      .add(message.toJson());
}

getAlUsers() async {
  QuerySnapshot querySnapshot =
      await firestore.collection(usersCollectionName).get();
  List<AppUser> appUser =
      querySnapshot.docs.map((e) => AppUser.newUser(e.data())).toList();
  appGet.users.value = appUser
      .where((element) => element.userId != appGet.appUser?.userId)
      .toList();
}

Future<List<Map<String, dynamic>>> getAllChats() async {
  String myId = appGet.appUser.userId;
  QuerySnapshot querySnapshot = await firestore
      .collection(chatCollectionName)
      .where('user', arrayContains: myId)
      .get();
  List<Map<String, dynamic>> chats =
      querySnapshot.docs.map((e) => e.data()).toList();
  return chats;
}

Stream<QuerySnapshot> getChatMessages(String chatId) {
  Stream<QuerySnapshot> stream = firestore
      .collection(chatCollectionName)
      .doc(chatId)
      .collection(messageCollectionName)
      .orderBy('timeStamp')
      .snapshots();
  return stream;
}

Future<String> uploadImageSlider(File fileslider) async {
  String fileName = fileslider.path.split('/').last;
  String folderName = 'Slider';
  Reference reference = storage.ref('$folderName/$fileName');
  await reference.putFile(fileslider);
  String sliderImage = await reference.getDownloadURL();
  return sliderImage;
}

addimageSlider(Map map) async {
  String userId;
  String productImageSlider = await uploadImageSlider(map['fileslider']);
  map.remove('fileslider');
  map['sliderImage'] = productImageSlider;
  await firestore
      .collection('ImageSlider')
      .doc(Repository.repository.appUser.userId)
      .collection("listImage")
      .add({...map});
  Get.back();
}

Future getImageSlider() async {
  String userId;
  List<String> imageSlider = [];
  var firestore =  FirebaseFirestore.instance;
  QuerySnapshot qn = await firestore
      .collection('ImageSlider')
      .doc(Repository.repository.appUser.userId)
      .collection("listImage")
      .get();
  List<QueryDocumentSnapshot> getAllImage = qn.docs;

  getAllImage.map((e) => imageSlider.add(e.data()["sliderImage"])).toList();
  logger.d('image${qn.docs.length}');

  Provider.of<Pharmacistprovider>(Get.context, listen: false)
      .setImageSlider(imageSlider);
  return qn.docs;
}
