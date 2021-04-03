import 'package:ecommerce/backend/pharmacist_provider.dart';
import 'package:ecommerce/backend/server.dart';
import 'package:ecommerce/models/productlearn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDeatails extends StatelessWidget {
  Products products;
  ProductDeatails(this.products);
  callMarket(String phoneNumber) async {
    
    if (products.isCall) {
      String url = 'tel:$phoneNumber';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else{
      Get.defaultDialog(title: 'error',content: Text('Calling is disaple  in this product'));
    }
  }
  sendMessageToMarket(String phoneNumber) async{
    if (products.isMessage) {
      String url = 'tel:$phoneNumber';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }else{
      Get.defaultDialog(title: 'error',content: Text('Calling is disaple  in this product'));

    }
  }


  reporMarket(String markeNumber) {}
  String repotResson;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Selector<Pharmacistprovider, int>(
        selector: (x, y) {
          return y.productBottomIndex;
        },
        builder: (context, value, child) {
          return BottomNavigationBar(
            onTap: (value)  async{
              Provider.of<Pharmacistprovider>(context, listen: false)
                  .changeIndex(value);
              switch (value) {
                case 0:
                  callMarket(
                      Provider.of<Pharmacistprovider>(context, listen: false)
                          .selectMarket
                          .mobileNumber);
                  break;
                case 1:
                  sendMessageToMarket(  Provider.of<Pharmacistprovider>(context, listen: false)
                      .selectMarket
                      .mobileNumber);
                  break;
                case 2:
               await   Get.defaultDialog(title: 'errer',content: TextField(onChanged: (value){
                    repotResson=value;

                  },),
                 onConfirm: (){
                 Get.back();
                 }


               );
                  repotProduct(products.marketId,getUserId(),repotResson);
                  break;
              }
            },
            currentIndex: value,
            items: [
              BottomNavigationBarItem( label: '', icon: Icon(Icons.message, color: Colors.amber,)),
              BottomNavigationBarItem(label: '', icon: Icon(Icons.call,color: Colors.blueAccent,)),
              BottomNavigationBarItem(label: '', icon: Icon(Icons.report, color: Colors.red,)),
            ],
          );
        },
      ),
      appBar: AppBar(
        title: Text(
          translator.translate('descriotion'),

        ),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height / 4,
            width: size.width,
            color: Colors.grey,
            child: Image.network(
              products.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(products.name,style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.ssp,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${products.description}',
                    // textAlign: TextAlign.right,
                    // textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
