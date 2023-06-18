import 'package:app_doc/src/auth/controller/auth_controller.dart';
import 'package:app_doc/src/home/view/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController con_auth = Get.put(AuthController());
    return Scaffold(
      appBar:  AppBar(title: Text('My Page'),actions: [
        IconButton(onPressed: (){
          con_auth.SignOut();
        }, icon: Icon(Icons.logout_outlined))
      ],
      ),
      body: Container(
        child:  Container(child: Text("Home"),)
      ),
    );
  }
}


class FooBar extends PreferredSize {
  FooBar({required super.child, required super.preferredSize});



  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Text("ii"); // Your custom widget implementation.
  }
}