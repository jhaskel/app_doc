

import 'package:app_doc/src/auth/controller/auth_controller.dart';
import 'package:app_doc/src/user/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Header extends PreferredSize {
   Header({
    super.key,
    required this.con_auth, required super.child, required super.preferredSize,
  });
  User myUser = User.fromJson(GetStorage().read('user') ?? {});

  final AuthController con_auth;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100.0),
      child: AppBar(title: Text('My Page'),actions: [
        IconButton(onPressed: (){
          con_auth.SignOut();
        }, icon: Icon(Icons.logout_outlined))
      ],
      ),
    );
  }
}