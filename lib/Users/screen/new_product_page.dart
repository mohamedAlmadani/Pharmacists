import 'dart:io';

import 'package:ecommerce/Users/screen/Shops.dart';
import 'package:ecommerce/Users/screen/product_page.dart';
import 'package:ecommerce/backend/server.dart';
import 'package:ecommerce/widget/textfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/backend/pharmacist_provider.dart';

class NewProduct extends StatelessWidget {
  String productName;
  String price;
  String description;
  bool allowCall;
  bool allowMessages;
  File productimage;
  GlobalKey<FormState> newProductFormKey = GlobalKey();
  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }

  setproductName(String value) {
    this.productName = value;
  }

  setprice(String value) {
    this.price = value;
  }

  setdescription(String value) {
    this.description = value;
  }

  setallowCall(bool value) {
    this.allowCall = value;
  }

  setallowMessages(bool value) {
    this.allowMessages = value;
  }
  saveForm(){
    if(newProductFormKey.currentState.validate()){
      newProductFormKey.currentState.save();
      Map map ={
        'productName':this.productName,
        'ProductPrice':this.price,
        'ProductDescription':this.description,
        'allowCalling':Provider.of<Pharmacistprovider>(Get.context,listen: false).isCallAllowed,
        'allowMessing':Provider.of<Pharmacistprovider>(Get.context,listen: false).isMessagesAllowed,
        'file':Provider.of<Pharmacistprovider>(Get.context,listen: false).file,


      };
      addNewProduct(map);
    }
    else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New product'),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      body: Form(
        key:  newProductFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFieldWidget(
                hint: 'Product Name',
                saveFun: setproductName,
                validateFun: nullValidator,
              ),
              TextFieldWidget(
                hint: 'Price',
                saveFun: setprice,
                validateFun: nullValidator,
              ),
              TextFieldWidget(
                hint: 'Description',
                saveFun: setdescription,
                validateFun: nullValidator,
              ),
              Selector<Pharmacistprovider, bool>(
                  builder: (context, value, child) {
                return CheckboxListTile(
                  title: Text('Allow Calling'),
                    value: value, onChanged: (value) {
                    Provider.of<Pharmacistprovider>(context,listen: false).changeCallAllowed();

                });
              }, selector: (x, y) {
                return y.isCallAllowed;
              }),
              Selector<Pharmacistprovider, bool>(
                  builder: (context, value, child) {
                    return CheckboxListTile(
                        title: Text('isMessagesAllowed'),
                        value: value, onChanged: (value) {
                      Provider.of<Pharmacistprovider>(context,listen: false).changeisMessagesAllowed();

                    });
                  }, selector: (x, y) {
                return y.isMessagesAllowed;
              }),
              Selector<Pharmacistprovider, File>(
                  builder: (context, value, child) {
                    return GestureDetector(
                      onTap: () async{
                     PickedFile pickedFile=  await  ImagePicker().getImage(source: ImageSource.gallery);
                     File file =File(pickedFile.path);
                     Provider.of<Pharmacistprovider>(context,listen: false).setFile(file);
                      },
                      child: Container(
                        color: Colors.grey[200],
                        height: 200,
                        width: 200,
                        child: value!=null?Image.file(value,fit: BoxFit.cover,):Icon(Icons.add),
                      ),
                    );
                  }, selector: (x, y) {
                return y.file;
              }),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text('Add Product'),
                  onPressed: () {
                    saveForm();
                    //Get.to(Shops());
                  }),
              SizedBox(
                height: 30,
              ),
              SliderImage(),
            ],
          ),
        ),
      ),
    );
  }
}
class SliderImage extends StatelessWidget {
  String sliderImage;
  GlobalKey<FormState> sliderFormKey = GlobalKey();
  saveForms() {
    if (sliderFormKey.currentState.validate()) {
      sliderFormKey.currentState.save();
      Map map ={

        'fileslider':Provider.of<Pharmacistprovider>(Get.context,listen: false).fileslider,

      };

      addimageSlider(map);
      // Get.to(NewsPage());

    }
    else{
      return;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          key: sliderFormKey,
          child: Column(children: [
        Selector<Pharmacistprovider, File>(
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () async {
                  PickedFile pickedFile = await ImagePicker().getImage(
                      source: ImageSource.gallery);
                  File fileslider = File(pickedFile.path);
                  Provider.of<Pharmacistprovider>(context, listen: false)
                      .setFileslider(fileslider);
                },
                child: Container(
                  color: Colors.grey[200],
                  height: 200,
                  width: 200,
                  child: value != null ? Image.file(value,
                    fit: BoxFit.cover,) : Icon(Icons.add),
                ),
              );
            }, selector: (x, y) {
          return y.fileslider;
        }),
        SizedBox(
          height: 30,
        ),
        RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)),
            child: Text('Add imageslider'),
            onPressed: () {
              saveForms();
              Get.to(Shops());
            })

      ],)),

    );
  }
}
