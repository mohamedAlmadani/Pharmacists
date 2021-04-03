import 'package:ecommerce/Users/screen/message.dart';
import 'package:ecommerce/backend/server.dart';
import 'package:ecommerce/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('user'),
        backgroundColor: Color(0xff88a53b),
        centerTitle: true,
      ),
      body: Obx((){
        return appGet.users.isEmpty?Center(
          child: Text('No Users Found'),
        )
            :ListView.builder(
          itemCount: appGet.users.length,
            itemBuilder: (context,index){
            Logger().e("${appGet.users[index].userId}");
            return UserWidget(appGet.users[index]);
            }
            );
      }),
    );
  }
}
class UserWidget extends StatelessWidget {
  AppUser appUser;
  UserWidget(this.appUser);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: () async {
          String chatId =
          await createChat([appUser.userId, appGet.appUser.userId]);
         Get.to(ChatMessagesPage(appUser, chatId));
        },
        leading: CircleAvatar(
          radius: 30,
          child: Text(appUser.userName[0].toUpperCase()),
        ),
        title: Text(appUser.userName),
        subtitle: Text(appUser.email),
        trailing: Icon(Icons.chat_rounded),
      ),
    );
  }
}