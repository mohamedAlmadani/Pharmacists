import 'package:flutter/material.dart';
class WidgetContact extends StatelessWidget {
  String hint;
  Function validationFun;
  Function saveFun;
  int a;
  WidgetContact({this.hint,this.validationFun,this.saveFun,this.a});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          child: Container(

            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,

            ),
            padding: EdgeInsets.only(left: 10),


            child: TextFormField(
              maxLines:a ,

              onSaved: (value){
                saveFun(value);
              },
              decoration: InputDecoration(

                border: InputBorder.none,

                hintText: hint,

              ),
            ),
          ),
        ),

      ],
    );

  }
}
