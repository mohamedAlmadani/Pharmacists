import 'package:ecommerce/Users/screen/product_page.dart';
import 'package:ecommerce/backend/pharmacist_provider.dart';
import 'package:ecommerce/backend/repository.dart';
import 'package:ecommerce/backend/server.dart';
import 'package:ecommerce/models/market.dart';
import 'package:ecommerce/widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/backend/repository.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class PageMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('main hello'),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: (){
            signOut();

          })
        ],
      ),
      body: Selector<Pharmacistprovider,List<Market>>(builder:(context, value, child) {
        return value.isEmpty?Center(child: CircularProgressIndicator(),):
          ListView.builder(
          itemCount: value.length,
            itemBuilder: (context,index){
            return GestureDetector(
              onTap: () async{
                Provider.of<Pharmacistprovider>(context,listen: false).selectMarket =value[index];
                await GetAllMarketProductFromFirebase(value[index].marketId);
                Get.to(ProductsPage());

              },
              child: Container(
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.network(value[index].logoUrl??'',
                        fit: BoxFit.cover,

                      ),
                    ),
                    Column(
                      children: [
                        Text(value[index].userName),
                        Text(value[index].email),

                      ],
                    )

                  ],
                ),
              ),
            );

            });

      } ,selector: (x,y ) {
return y.markets;

      },),
    );
  }
}
