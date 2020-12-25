import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/utils/Product_moceup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  Product product;
  ProductDetails(this.product);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.forward_to_inbox,
              color: Colors.amber,
            ),
          ),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.phone,
                color: Colors.blueAccent,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.report_gmailerrorred_rounded,
                color: Colors.red,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.share,
                color: Colors.green,

              )),
        ],
      ),
      appBar: AppBar(
        title: Text(
          "تفاصيل المنتج",
        ),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(

            alignment: Alignment.center,
            height: 214.h,
            width: 420.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    widget.product.imageUrl
                )
              ),
              border: Border.all(color: Colors.green),
            ),
          ),
          SizedBox(height:20.h ,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${widget.product.description}',
            textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }
}
